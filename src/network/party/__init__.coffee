base = require('../message').message

class create_channel_request extends base
	constructor: (params) ->
		super(params)
		
		@name = 'network.party.create_channel_request'
		
class create_channel_response extends base
	constructor: (params) ->
		super(params)
		
		@name = 'network.party.create_channel_response'
		
class join_channel_request extends base
	constructor: (params) ->
		super(params)
		
		@name = 'network.party.join_channel_request'
		
class join_channel_response extends base
	constructor: (params) ->
		super(params)
		
		@name = 'network.party.join_channel_response'
		
class get_channel_info_response extends base
	constructor: (params) ->
		super(params)
		
		@name = 'network.party.get_channel_info_response'

exports.join_channel_request = join_channel_request
exports.join_channel_response = join_channel_response
exports.get_channel_info_response = get_channel_info_response
exports.service = require('./service').service