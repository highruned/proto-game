require('../../buffer')
network = require('../__init__')
base = require('../service').service
util = require('../../util')

class service extends base
	constructor: () ->
		super
			id: 10
			hash: 0xD750148B
			name: 'network.exchange.service'
		
		@request_handlers =
			1: network.not_implemented #network.exchange.get_configuration_request
			2: network.not_implemented #network.exchange.get_bid_fee_estimation_request
			18: network.not_implemented
			27: network.not_implemented


exports.service = service