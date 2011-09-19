require('../../buffer')
network = require('../__init__')
base = require('../service').service

class service extends base
	constructor: () ->
		super()
		
		@request_handlers[2] = network.game_master.list_factories_request
		
		@response_handlers[2] = network.game_master.list_factories_response

	id: 7
	hash: 0x810CB195
	name: 'network.game_master.service'
	request_callbacks: {}
	total_requests: 0
	request_handlers: {}
	response_handlers: {}

exports.service = service