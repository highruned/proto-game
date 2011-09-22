require('../../buffer')
network = require('../__init__')
base = require('../service').service
util = require('../../util')

class service extends base
	constructor: () ->
		super
			id: 5656 # wrong
			hash: 'gibberish'
			name: 'network.channel_subscriber.service'
	

exports.service = service