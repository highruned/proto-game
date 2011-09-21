require('../../buffer')
network = require('../__init__')
base = require('../service').service
util = require('../../util')

class service extends base
	constructor: () ->
		super()
		
		@request_handlers =
			1: network.friends.subscribe_to_friends_request

	id: 6
	hash: 0xA3DDB1BD
	name: 'network.friends.service'
	request_callbacks: {}
	total_requests: 0
	request_handlers: {}
	response_handlers: {}

exports.service = service