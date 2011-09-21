base = require('../message').message

class logon_request extends base
	constructor: (params) ->
		super(params)
		
	get_definition_name: () -> 'network.authentication.logon_request'

exports.logon_request = logon_request