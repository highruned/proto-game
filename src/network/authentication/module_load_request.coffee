base = require('../message').message

class module_load_request extends base
	constructor: (params) ->
		super(params)
		
		@name = 'network.authentication.module_load_request'

exports.module_load_request = module_load_request