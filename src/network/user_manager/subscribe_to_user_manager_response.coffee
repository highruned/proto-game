base = require('../message').message

class subscribe_to_user_manager_response extends base
	constructor: (params) ->
		super(params)
		
		@name = 'network.user_manager.subscribe_to_user_manager_response'

exports.subscribe_to_user_manager_response = subscribe_to_user_manager_response