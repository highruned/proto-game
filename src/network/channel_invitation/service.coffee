require('../../buffer')
network = require('../__init__')
base = require('../service').service
util = require('../../util')

class service extends base
	constructor: () ->
		super
			id: 3
			hash: 0x83040608
			name: 'network.channel_invitation.service'
		
		@request_handlers[1] = network.channel_invitation.subscribe_request
		
		@response_handlers[1] = network.channel_invitation.subscribe_response
		

exports.service = service