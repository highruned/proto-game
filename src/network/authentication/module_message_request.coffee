base = require('../message').message

class module_message_request extends base
	constructor: (params) ->
		super(params)
		
	get_definition_name: () -> 'network.authentication.module_message_request'

exports.module_message_request = module_message_request