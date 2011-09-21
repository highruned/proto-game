base = require('../message').message

class subscribe_to_user_manager_request extends base
	constructor: (params) ->
		super(params)
		
	get_definition_name: () -> 'network.user_manager.subscribe_to_user_manager_request'

exports.subscribe_to_user_manager_request = subscribe_to_user_manager_request