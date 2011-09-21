require('../../buffer')
network = require('../__init__')
base = require('../service').service
util = require('../../util')

class service extends base
	constructor: () ->
		super()
		
		@request_handlers =
			1: network.user_manager.subscribe_to_user_manager_request

	id: 5
	hash: 0x3E19268A
	name: 'network.user_manager.service'
	request_callbacks: {}
	total_requests: 0
	request_handlers: {}
	response_handlers: {}

exports.service = service