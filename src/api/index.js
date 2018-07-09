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

	// perhaps expose some API metadata at the root
	api.post('/broadcast', (req, res) => {
		const message = req.body.message;

		const queryString = 'SELECT id FROM user WHERE source=\'facebook\'';
		db.query(queryString, (err, rows) => {
			if(err) {
				console.log(err);
				res.status(500).json({ message: 'There was a problem with the database ☹️'});
			} else if(rows.length) {
				functions.sendToAllFB(rows, message);
				res.json({ message: 'Message successfully broadcasted to all users 🙂 '});
			} else {
				res.json({ message: 'I haven\'t talked to anyone in facebook yet 🤷‍♀️'});
			}
		})
	});

	return api;
}
