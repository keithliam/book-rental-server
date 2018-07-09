import { version } from '../../package.json';
import { Router } from 'express';
import facets from './facets';
import * as functions from './functions';

export default ({ config, db }) => {
	let api = Router();

	// mount the facets resource
	api.use('/facets', facets({ config, db }));

	api.get('/users', (req, res) => {
		const queryString = 'SELECT id, name FROM user WHERE source=\'facebook\'';
		db.query(queryString, (err, rows) => {
			if(err) {
				console.log(err);
				res.status(500).json({ message: 'There was a problem with the database ☹️'});
			} else {
				res.json({ data: rows });
			}
		})
	});

	api.get('/groups', (req, res) => {
		const queryString = 'SELECT a.id, a.name, b.name AS `group` FROM user a JOIN user_group b ON a.id=b.user WHERE a.source=\'facebook\'';
		db.query(queryString, (err, rows) => {
			if(err) {
				console.log(err);
				res.status(500).json({ message: 'There was a problem with the database ☹️'});
			} else {
				var groups = [];
				var found;
				for(var i = 0; i < rows.length; i++) {
					found = false;
					for(var j = 0; j < groups.length; j++) {
						if(groups[j].name == rows[i].group){
							found = true;
							groups[j].users.push({
								id: rows[i].id,
								name: rows[i].name
							});
							break;
						}
					}
					if(!found) {
						groups.push({
							name: rows[i].group,
							users: [{
								id: rows[i].id,
								name: rows[i].name
							}]
						})
					}
				}
				res.json({ data: groups });
			}
		})
	});

	api.post('/groups', (req, res) => {
		var queryString = 'SELECT name FROM user_group WHERE name = ?';

		db.query(queryString, req.body.name, (err, rows) => {
			if(err) {
				console.log(err);
				res.status(500).json({ message: 'There was a problem with the database ☹️'});
			} else if(rows.length) {
				res.json({ message: 'Group name already taken' });
			} else {
				for(var i = 0; i < req.body.users.length; i++) {
					queryString = 'INSERT IGNORE INTO user_group VALUES(?, ?)';
					const values = [req.body.name, req.body.users[i]];

					db.query(queryString, values, (err, rows) => {
						if(err) {
							console.log(err);
							res.status(500).json({ message: 'There was a problem with the database ☹️'});
						}
					});
				}
				res.json({ message: 'Successfully created group' });
			}
		});
	})

	api.delete('/groups/:name', (req, res) => {
		var queryString = 'DELETE FROM user_group WHERE name = ?';

		db.query(queryString, req.params.name, (err, rows) => {
			if(err) {
				console.log(err);
				res.status(500).json({ message: 'There was a problem with the database ☹️'});
			} else if(!rows.affectedRows) {
				res.json({ message: 'Group does not exist' });
			} else {
				res.json({ message: 'Successfully deleted group' });
			}
		});
	})

	// perhaps expose some API metadata at the root
	api.post('/broadcast', (req, res) => {
		const message = req.body.message;

		const queryString = 'SELECT id FROM user WHERE source=\'facebook\'';
		db.query(queryString, (err, rows) => {
			if(err) {
				console.log(err);
				res.status(500).json({ message: 'There was a problem with the database ☹️'});
			} else if(rows.length) {
				functions.sendToAllFb(rows, message);
				res.json({ message: 'Message successfully broadcasted to all users 🙂 '});
			} else {
				res.json({ message: 'I haven\'t talked to anyone in facebook yet 🤷‍♀️'});
			}
		})
	});

	api.post('/message-user', (req, res) => {
		const id = req.body.id;
		const message = req.body.message;

		const queryString = 'SELECT id FROM user WHERE source=\'facebook\'';
		db.query(queryString, (err, rows) => {
			if(err) {
				console.log(err);
				res.status(500).json({ message: 'There was a problem with the database ☹️'});
			} else if(!rows.length) {
				res.json({ message: 'User not found in database 🤷‍♀️'});
			} else {
				functions.pushMessage(id, message);
				res.json({ message: 'Message successfully messaged user 🙂 '});
			}
		})
	});

	api.post('/message-users', (req, res) => {
		const users = req.body.id.map(user => {
			return { id: user };
		});
		const message = req.body.message;
		functions.sendToAllFb(users, message);
		res.json({ message: 'Message successfully messaged user 🙂 '});
	});

	api.post('/message-group', (req, res) => {
		const name = req.body.name;
		const message = req.body.message;

		var queryString = 'SELECT user FROM user_group WHERE name = ?';
		db.query(queryString, name, (err, rows) => {
			if(err) {
				console.log(err);
				res.status(500).json({ message: 'There was a problem with the database ☹️'});
			} else if(!rows.length) {
				res.json({ message: 'Group does not exist 🤷‍♀️'});
			} else {
				const users = rows.map(row => {
					return { id: row.user }
				});
				functions.sendToAllFb(users, message);
				res.json({ message: 'Message successfully messaged the group 🙂 '});
			}
		})
	});

	return api;
}
