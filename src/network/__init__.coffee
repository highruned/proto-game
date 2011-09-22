object = require('../object').object
schema = require('../schema').schema
message = require('./message').message


class not_implemented extends message
	constructor: (params) ->
		super(params)
		
	get_definition_name: () -> 'network.not_implemented'
	
class packet extends message
	constructor: (params) ->
		super(params)
		
	get_definition_name: () -> 'network.packet'
		
	size: null
	data: null
	
class varint extends message
	constructor: (params) ->
		super(params)
		
	get_definition_name: () -> 'network.varint'
	
class no_data extends message
	constructor: (params) ->
		super(params)
		
	get_definition_name: () -> 'network.no_data'


class process_id extends message
	constructor: (params) ->
		super(params)
		
	get_definition_name: () -> 'network.process_id'
		
	label: null
	epoch: null

class entity_id extends message
	constructor: (params) ->
		super(params)
		
	get_definition_name: () -> 'network.entity_id'
		
	low: null
	high: null

class entity extends message
	constructor: (params) ->
		super(params)
		
	get_definition_name: () -> 'network.entity'
	
	account_id: null
	game_account_id: null
	toon_id: null
	
class bound_service
	constructor: (params) ->
		super(params)
		
	get_definition_name: () -> 'network.bound_service'
	
	hash: null
	id: null

class variant extends message
	constructor: (params) ->
		super(params)
		
	get_definition_name: () -> 'network.variant'
	
class attribute extends message
	constructor: (params) ->
		super(params)
		
	get_definition_name: () -> 'network.attribute'
	
	name: null
	value: null
 
class attribute_filter extends message
	constructor: (params) ->
		super(params)
		
	get_definition_name: () -> 'network.attribute_filter'
	
	op: 1
	attribute: 2

attribute_filter::operation =
	match_none: 0
	match_any: 1
	match_all: 2
	match_all_most_specific: 3

exports.not_implemented = not_implemented
exports.varint = varint
exports.packet = packet
exports.message = message
exports.no_data = no_data
exports.process_id = process_id
exports.entity_id = entity_id
exports.entity = entity
exports.bound_service = bound_service
exports.variant = variant
exports.attribute = attribute
exports.service = require('./service').service
exports.connection = require('./connection/__init__')
exports.response = require('./response/__init__')
exports.presence = require('./presence/__init__')
exports.authentication = require('./authentication/__init__')
exports.channel = require('./channel/__init__')
exports.channel_owner = require('./channel_owner/__init__')
exports.channel_subscriber = require('./channel_subscriber/__init__')
exports.channel_invitation = require('./channel_invitation/__init__')
exports.toon = require('./toon/__init__')
exports.followers = require('./followers/__init__')
exports.user_manager = require('./user_manager/__init__')
exports.friends = require('./friends/__init__')
exports.game = require('./game/__init__')
exports.game_master = require('./game_master/__init__')
exports.game_utilities = require('./game_utilities/__init__')
exports.storage = require('./storage/__init__')
exports.party = require('./party/__init__')
exports.notification = require('./notification/__init__')
exports.exchange = require('./exchange/__init__')
exports.chat = require('./chat/__init__')
exports.search = require('./search/__init__')
exports.authentication_client = require('./authentication_client/__init__')

