base = require('../message').message

class subscribe_to_followers_request extends base
	constructor: (params) ->
		super(params)
		
	get_definition_name: () -> 'network.followers.subscribe_to_followers_request'

exports.subscribe_to_followers_request = subscribe_to_followers_request