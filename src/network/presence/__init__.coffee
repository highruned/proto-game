base = require('../message').message

class field_key extends base
	constructor: (params) ->
		super(params)
		
		@name = 'network.presence.field_key'

	program: null
	group: null
	field: null
	index: 0
	
class field extends base
	constructor: (params) ->
		super(params)
		
		@name = 'network.presence.field'
		
	key: null
	value: null
	
	
class field_operation extends base
	constructor: (params) ->
		super(params)
		
		@name = 'network.presence.field_operation'
		
	field: null
	operation: null

field_operation::operation_type = 
	set: 0
	clear: 1
	
class channel_state extends base
	constructor: (params) ->
		super(params)
		
		@name = 'network.presence.channel_state'

	entity_id: null
	field_operation: null
	presence: null

exports.field_key = field_key
exports.field = field
exports.field_operation = field_operation
exports.channel_state = channel_state
exports.query_request = require('./query_request').query_request
exports.query_response = require('./query_response').query_response
exports.subscribe_request = require('./subscribe_request').subscribe_request
exports.unsubscribe_request = require('./unsubscribe_request').unsubscribe_request
exports.update_request = require('./update_request').update_request
exports.service = require('./service').service