base = require('../message').message

class create_channel_request extends base
	constructor: (params) ->
		super(params)
		
	get_definition_name: () -> 'network.channel.create_channel_request'
		
class create_channel_response extends base
	constructor: (params) ->
		super(params)
		
	get_definition_name: () -> 'network.channel.create_channel_response'
		
class join_channel_request extends base
	constructor: (params) ->
		super(params)
		
	get_definition_name: () -> 'network.channel.join_channel_request'
		
class join_channel_response extends base
	constructor: (params) ->
		super(params)
		
	get_definition_name: () -> 'network.channel.join_channel_response'
		
class get_channel_info_response extends base
	constructor: (params) ->
		super(params)
		
	get_definition_name: () -> 'network.channel.get_channel_info_response'

exports.create_channel_request = create_channel_request
exports.create_channel_response = create_channel_response
exports.join_channel_request = join_channel_request
exports.join_channel_response = join_channel_response
exports.get_channel_info_response = get_channel_info_response

exports.service = require('./service').service