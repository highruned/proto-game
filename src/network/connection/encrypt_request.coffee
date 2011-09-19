base = require('../message').message

class encrypt_request extends base
	constructor: (params) ->
		super(params)
		
		@name = 'network.connection.encrypt_request'

exports.encrypt_request = encrypt_request