base = require('../message').message

class disconnect_notification extends base
	constructor: (params) ->
		super(params)
		
	get_definition_name: () -> 'network.connection.disconnect_notification'

exports.disconnect_notification = disconnect_notification