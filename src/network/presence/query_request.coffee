message = require('../message').message

class query_request extends message
	constructor: (params) ->
		super(params)
		
	get_definition_name: () -> 'network.presence.query_request'

exports.query_request = query_request