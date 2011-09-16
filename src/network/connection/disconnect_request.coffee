base = require('../message').message

class disconnect_request extends base
	constructor: () ->
		super()
		
		@name = 'network.connection.disconnect_request'

exports.disconnect_request = disconnect_request