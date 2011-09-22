require('../../buffer')
network = require('../__init__')
base = require('../service').service
util = require('../../util')

class service extends base
	constructor: () ->
		super
			id: 12
			hash: 0x0CBE3C43
			name: 'network.notification.service'

exports.service = service