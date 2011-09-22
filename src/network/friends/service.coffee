require('../../buffer')
network = require('../__init__')
base = require('../service').service
util = require('../../util')

class service extends base
	constructor: () ->
		super
			id: 6
			hash: 0xA3DDB1BD
			name: 'network.friends.service'
		
		@request_handlers =
			1: network.friends.subscribe_to_friends_request


exports.service = service