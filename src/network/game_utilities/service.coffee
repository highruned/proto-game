require('../../buffer')
network = require('../__init__')
base = require('../service').service
util = require('../../util')

class service extends base
	constructor: () ->
		super()
		
		@request_handlers[1] = network.game_utilities.client_request

	id: 8
	hash: 0x3FC1274D
	name: 'network.game_utilities.service'
	request_callbacks: {}
	total_requests: 0
	request_handlers: {}
	response_handlers: {}

exports.service = service