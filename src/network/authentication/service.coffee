require('../../buffer')
network = require('../__init__')
base = require('../service').service
util = require('../../util')

class service extends base
	constructor: () ->
		super()
		
		@request_handlers[1] = network.authentication.logon_request
		@request_handlers[2] = network.authentication.module_load_request
		@request_handlers[3] = network.authentication.module_message_request
		
		@response_handlers[1] = network.authentication.logon_response
		@response_handlers[2] = network.authentication.module_load_response

	id: 1
	hash: 0x0DECFC01
	name: 'network.authentication.service'
	request_callbacks: {}
	total_requests: 0
	request_handlers: {}
	response_handlers: {}

exports.service = service