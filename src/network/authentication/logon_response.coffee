base = require('../message').message

class logon_response extends base
	constructor: (params) ->
		super(params)
		
	get_definition_name: () -> 'network.authentication.logon_response'

exports.logon_response = logon_response