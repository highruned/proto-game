base = require('../message').message

class client_request extends base
	constructor: (params) ->
		super(params)
		
	get_definition_name: () -> 'network.game_utilities.client_request'
		
class client_response extends base
	constructor: (params) ->
		super(params)
		
	get_definition_name: () -> 'network.game_utilities.client_response'
				

exports.client_request = client_request
exports.client_response = client_response
exports.service = require('./service').service