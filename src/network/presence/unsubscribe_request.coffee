base = require('../message').message

class unsubscribe_request extends base
	constructor: (params) ->
		super(params)
		
		@name = 'network.precense.unsubscribe_request'

exports.unsubscribe_request = unsubscribe_request