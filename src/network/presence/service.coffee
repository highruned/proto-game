require('../../buffer')
network = require('../__init__')
base = require('../service').service
util = require('../../util')

class service extends base
	constructor: () ->
		super()
		
		@request_handlers[1] = network.presence.subscribe_request
		@request_handlers[2] = network.presence.unsubscribe_request
		@request_handlers[3] = network.presence.update_request
		@request_handlers[4] = network.presence.query_request

	id: 11
	hash: 0xfa0796ff
	name: 'network.presence.service'
	request_callbacks: {}
	total_requests: 0
	request_handlers: {}
	response_handlers: {}
	subscribers: []

exports.service = service