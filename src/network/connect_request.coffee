base = require('./message').message

class connect_request extends base
	constructor: (params) ->
		super(params)
		
		@name = 'network.connect_request'
		
	
	unpack: (message) ->
		super(message)

exports.connect_request = connect_request