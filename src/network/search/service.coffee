require('../../buffer')
network = require('../__init__')
base = require('../service').service
util = require('../../util')

class service extends base
	constructor: () ->
		super
			id: 14
			hash: 0x0a24a291
			name: 'network.search.service'

exports.service = service