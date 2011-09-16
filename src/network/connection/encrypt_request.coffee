base = require('../message').message

class encrypt_request extends base
	constructor: () ->
		super()
		
		@name = 'network.connection.encrypt_request'

exports.encrypt_request = encrypt_request