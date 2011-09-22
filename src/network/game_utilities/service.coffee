require('../../buffer')
network = require('../__init__')
base = require('../service').service
util = require('../../util')

class service extends base
	constructor: () ->
		super
			id: 8
			hash: 0x3FC1274D
			name: 'network.game_utilities.service'
		
		@request_handlers[1] = network.game_utilities.client_request


exports.service = service