require('../../buffer')
network = require('../__init__')
base = require('../service').service
util = require('../../util')

class service extends base
	constructor: () ->
		super
			id: 15 
			hash: 0x00d89ca9
			name: 'network.chat.service'


exports.service = service