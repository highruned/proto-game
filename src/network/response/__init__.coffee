base = require('../message').message

class handle_request extends base
	constructor: (params) ->
		super(params)
		
	get_definition_name: () -> 'network.response.handle_request'
	
	pack: () ->
		return @
	
	unpack: () ->
		return @
		
		
exports.handle_request = handle_request
exports.service = require('./service').service