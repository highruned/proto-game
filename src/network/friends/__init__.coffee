base = require('../message').message

class subscribe_to_friends_request extends base
	constructor: (params) ->
		super(params)
		
	get_definition_name: () -> 'network.friends.subscribe_to_friends_request'
		
class subscribe_to_friends_response extends base
	constructor: (params) ->
		super(params)
		
	get_definition_name: () -> 'network.friends.subscribe_to_friends_response'
  
  
  

exports.subscribe_to_friends_request = subscribe_to_friends_request
exports.subscribe_to_friends_response = subscribe_to_friends_response
exports.service = require('./service').service