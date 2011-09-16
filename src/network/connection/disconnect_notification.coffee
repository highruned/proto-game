base = require('../message').message

class disconnect_notification extends base
	constructor: () ->
		super()
		
		@name = 'network.connection.disconnect_notification'

exports.disconnect_notification = disconnect_notification