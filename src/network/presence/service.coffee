require('../../buffer')
network = require('../__init__')
base = require('../service').service
util = require('../../util')

class service extends base
	constructor: () ->
		super
			id: 11
			hash: 0xfa0796ff
			name: 'network.presence.service'
			subscribers: []
		
		@request_handlers[1] = network.presence.subscribe_request
		@request_handlers[2] = network.presence.unsubscribe_request
		@request_handlers[3] = network.presence.update_request
		@request_handlers[4] = network.presence.query_request


exports.service = service