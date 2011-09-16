base = require('./message').message

class bind_request extends base
	constructor: (params) ->
		super(params)
		
		@name = 'network.bind_request'

exports.bind_request = bind_request