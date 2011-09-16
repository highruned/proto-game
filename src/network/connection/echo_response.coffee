base = require('../message').message

class echo_response extends base
	constructor: () ->
		super()
		
		@name = 'network.connection.echo_response'

exports.echo_response = echo_response