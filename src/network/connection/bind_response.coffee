base = require('../message').message

class bind_response extends base
	constructor: (params) ->
		super(params)
		
		@name = 'network.connection.bind_response'

exports.bind_response = bind_response