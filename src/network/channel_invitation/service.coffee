require('../../buffer')
network = require('../__init__')
base = require('../service').service
util = require('../../util')

class service extends base
	constructor: () ->
		super()
		
		@request_handlers[1] = network.channel_invitation.subscribe_request
		
		@response_handlers[1] = network.channel_invitation.subscribe_response
		
	id: 3
	hash: 0x83040608
	name: 'network.channel_invitation.service'
	request_callbacks: {}
	total_requests: 0
	request_handlers: {}
	response_handlers: {}
	subscribers: []

exports.service = service