base = require('../message').message

class null_request extends base
	constructor: () ->
		super()
		
		@name = 'network.connection.null_request'

exports.null_request = null_request