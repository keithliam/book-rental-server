import fetch from 'node-fetch';

export function checkUser(db, req, res) {
	return new Promise(async (resolve, reject) => {
		const data = await getIdSource(req);
		const id = data[0];
		const source = data[1];

		var queryString = 'SELECT id FROM user WHERE BINARY id = ?';

		db.query(queryString, id, (err, rows) => {
			if(err) {
				console.log(err);
				return reject();
			} else {
				if(!rows.length) {
					queryString = 'INSERT INTO user VALUES (?, ?, NOW())';
					const values = [id, source];

					db.query(queryString, values, (err, rows) => {
						if(err) {
							console.log(err);
							return reject();
						} else {
							return resolve();
						}
					});
				} else {
					queryString = 'UPDATE user SET prev_transac = NOW() WHERE id = ?'
					
					db.query(queryString, id, (err, rows) => {
						if(err) {
							console.log(err);
							return reject();
						} else {
							return resolve();
						}
					});
				}
			}
		});
	});
}

function push(id, payload) {
	const url = 'https://graph.facebook.com/v2.6/me/messages?access_token=';
	const pageAccessToken = 'token'
	
	fetch(url + pageAccessToken, {
		headers: { 'Content-Type': 'application/json' },
		method: "POST",
		body: JSON.stringify(payload)	  	
	})
		.catch((e) => { console.log(e); });
}

function pushMessage(id, message) {
	push(id, {
		messaging_type: 'UPDATE',
		recipient: {
			id: id
		},
		message: {
			text: message
		}
	});
}

function getIdSource(req) {
	return new Promise((resolve, reject) => {
		if(req.body.originalDetectIntentRequest.hasOwnProperty('source') && req.body.originalDetectIntentRequest.source == 'facebook') {
			const source = req.body.originalDetectIntentRequest.source;
			const id = req.body.originalDetectIntentRequest.payload.data.sender.id;
			return resolve([id, source]);
		} else {
			const source = 'DialogFlow';
			const id = req.body.session;
			return resolve([id, source]);
		}
	})
}

async function sendToAllFb(rows, message) {
	for(var i = 0; i < rows.length; i++) {
		pushMessage((await getIdSource(req))[0], message);
	}
}

export function broadcast(db, req, res) {
	const message = req.body.queryResult.parameters.message;

	const queryString = 'SELECT id FROM user WHERE source = facebook';
	db.query(queryString, (err, rows) => {
		if(err) {
			console.log(err);
			return reject();
		} else if(rows.length) {
			sendToAllFB(rows, message);
		}
	})
}