base = require('../message').message

class echo_request extends base
	constructor: () ->
		super()
		
		@name = 'network.connection.echo_request'

exports.echo_request = echo_request