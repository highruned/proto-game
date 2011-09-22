require('../../buffer')
network = require('../__init__')
base = require('../service').service
util = require('../../util')

class service extends base
	constructor: () ->
		super
			id: 5
			hash: 0x3E19268A
			name: 'network.user_manager.service'
		
		@request_handlers =
			1: network.user_manager.subscribe_to_user_manager_request


exports.service = service