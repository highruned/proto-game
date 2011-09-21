base = require('../message').message

class connect_request extends base
	constructor: (params) ->
		super(params)
		
	get_definition_name: () -> 'network.connection.connect_request'

exports.connect_request = connect_request