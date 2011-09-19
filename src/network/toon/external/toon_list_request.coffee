base = require('../../message').message

class toon_list_request extends base
	constructor: (params) ->
		super(params)
		
		@name = 'network.toon.external.toon_list_request'

exports.toon_list_request = toon_list_request