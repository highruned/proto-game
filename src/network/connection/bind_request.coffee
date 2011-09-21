base = require('../message').message

class bind_request extends base
	constructor: (params) ->
		super(params)
		
	get_definition_name: () -> 'network.connection.bind_request'

exports.bind_request = bind_request