require('../../../buffer')
network = require('../../__init__')
base = require('../../service').service
util = require('../../../util')

class service extends base
	constructor: () ->
		super
			id: 2
			hash: 0x4124C31B
			name: 'network.toon.external.service'

		@request_handlers =
			1: network.toon.external.toon_list_request
			2: network.toon.external.select_request
			3: network.toon.external.create_request
			4: network.toon.external.delete_request


exports.service = service