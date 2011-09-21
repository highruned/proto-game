require('../../buffer')
network = require('../__init__')
base = require('../service').service
util = require('../../util')

class service extends base
	constructor: () ->
		super()

	id: 17
	hash: 0x060ca08d
	name: 'network.channel_owner.service'
	request_callbacks: {}
	total_requests: 0
	request_handlers: {}
	response_handlers: {}

exports.service = service