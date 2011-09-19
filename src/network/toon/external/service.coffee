require('../../../buffer')
network = require('../../__init__')
base = require('../../service').service
util = require('../../../util')

class service extends base
	constructor: () ->
		super()

		@request_handlers =
			1: network.toon.external.toon_list_request

	id: 2
	hash: 0x4124C31B
	name: 'network.toon.external.service'
	request_callbacks: {}
	total_requests: 0
	request_handlers: {}
	response_handlers: {}

exports.service = service