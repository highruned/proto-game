base = require('../message').message

class disconnect_request extends base
	constructor: (params) ->
		super(params)
		
	get_definition_name: () -> 'network.connection.disconnect_request'

exports.disconnect_request = disconnect_request