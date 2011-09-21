require('../../buffer')
network = require('../__init__')
base = require('../service').service
util = require('../../util')

class service extends base
	constructor: () ->
		super()
		
		@request_handlers =
			1: network.followers.subscribe_to_followers_request
		
	id: 4
	hash: 0xE5A11099
	name: 'network.followers.service'
	request_callbacks: {}
	total_requests: 0
	request_handlers: {}
	response_handlers: {}

exports.service = service