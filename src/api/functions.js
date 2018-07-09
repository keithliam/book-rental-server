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