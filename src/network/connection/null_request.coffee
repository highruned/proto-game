base = require('../message').message

class null_request extends base
	constructor: (params) ->
		super(params)
		
	get_definition_name: () -> 'network.connection.null_request'

exports.null_request = null_request