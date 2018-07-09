import { version } from '../../package.json';
import { Router } from 'express';
import facets from './facets';
import * as functions from './functions';

export default ({ config, db }) => {
	let api = Router();

	// mount the facets resource
	api.use('/facets', facets({ config, db }));

	// perhaps expose some API metadata at the root
	api.get('/', (req, res) => {
		try {
			await functions.checkUser(db, req, res);

			switch(req.body.queryResult.action) {
				default:
					return res.json({ fulfillmentText: 'Something\'s not right 🤔' });
			}
		} catch(e) {
			console.log(e)
			return res.json({ fulfillmentText: 'Something\'s not right 🤔' });
		}
	});

	return api;
}
