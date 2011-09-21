base = require('../message').message

class unsubscribe_request extends base
	constructor: (params) ->
		super(params)
		
	get_definition_name: () -> 'network.precense.unsubscribe_request'

exports.unsubscribe_request = unsubscribe_request