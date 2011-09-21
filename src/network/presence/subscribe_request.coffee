base = require('../message').message

class subscribe_request extends base
	constructor: (params) ->
		super(params)
		
	get_definition_name: () -> 'network.presence.subscribe_request'

exports.subscribe_request = subscribe_request