base = require('./message').message

class bind_response extends base
	constructor: (params) ->
		super(params)
		
		@name = 'network.bind_response'

exports.bind_response = bind_response