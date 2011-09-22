require('../../buffer')
network = require('../__init__')
base = require('../service').service
util = require('../../util')

class service extends base
	constructor: () ->
		super
			id: 92 # wrong
			hash: 'gibberish' #wrong
			name: 'network.authentication_client.service'

exports.service = service