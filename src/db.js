import mysql from 'mysql';

export default callback => {
	const db = mysql.createConnection({
		host: 'localhost',
		user: 'root',
		password: 'Amazing!',
		db: 'book_rental'
	});

	db.on('ready', () => console.log('Database is connected')).on('error', err => {
		console.log('Error in connecting to database');
		console.log(err.message);
	});

	db.connect(err => {
		if (err) {
			console.log('Error in connecting to database');
			console.log(err.message);
		} else {
			console.log('Success in connecting to database');
		}
	});

	db.query('USE book_rental');

	callback(db);
}
