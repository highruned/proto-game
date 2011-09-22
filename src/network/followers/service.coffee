require('../../buffer')
network = require('../__init__')
base = require('../service').service
util = require('../../util')

class service extends base
	constructor: () ->
		super
			id: 4
			hash: 0xE5A11099
			name: 'network.followers.service'
		
		@request_handlers =
			1: network.followers.subscribe_to_followers_request
		

exports.service = service