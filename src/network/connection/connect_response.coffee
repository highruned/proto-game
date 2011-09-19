base = require('../message').message

class connect_response extends base
	constructor: (params) ->
		super(params)
		
		@name = 'network.connection.connect_response'

exports.connect_response = connect_response