base = require('../message').message

class query_response extends base
	constructor: (params) ->
		super(params)
		
		@name = 'network.presence.query_response'

exports.query_response = query_response