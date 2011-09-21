require('../../buffer')
network = require('../__init__')
base = require('../service').service
util = require('../../util')

class service extends base
	constructor: () ->
		super()
		
		@request_handlers[1] = network.party.create_channel_request
		@request_handlers[2] = network.party.join_channel_request
		@request_handlers[3] = network.party.get_channel_info_request
		
		@response_handlers[1] = network.party.create_channel_response
		@response_handlers[2] = network.party.join_channel_response
		@response_handlers[3] = network.party.get_channel_info_response

	id: 13
	hash: 0xf4e7fa35
	name: 'network.party.service'
	request_callbacks: {}
	total_requests: 0
	request_handlers: {}
	response_handlers: {}

exports.service = service