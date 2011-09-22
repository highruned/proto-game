require('../../buffer')
network = require('../__init__')
base = require('../service').service
util = require('../../util')

class service extends base
	constructor: () ->
		super
			id: 13
			hash: 0xf4e7fa35
			name: 'network.party.service'
		
		@request_handlers[1] = network.channel.create_channel_request
		@request_handlers[2] = network.channel.join_channel_request
		@request_handlers[3] = network.channel.get_channel_info_request
		
		@response_handlers[1] = network.channel.create_channel_response
		@response_handlers[2] = network.channel.join_channel_response
		@response_handlers[3] = network.channel.get_channel_info_response


exports.service = service