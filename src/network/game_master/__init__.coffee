base = require('../message').message

class player extends base
	constructor: (params) ->
		super(params)
		
		@name = 'network.game_master.player'
	
  type: 'TOON'
  toon_id: null
  game_account_id: null
  bnet_account_id: null
  attribute: []

player::type = 
	toon: 0
	computer: 1

class connection_info extends base
	constructor: (params) ->
		super(params)
		
		@name = 'network.game_master.connection_info'
		
  toon_id: null
  host: null
  port: null
  token: null
  attribute: []

class game_stats_bucket extends base
	constructor: (params) ->
		super(params)
		
		@name = 'network.game_master.game_stats_bucket'
		
  bucket_min: 0
  bucket_max = 4294967296
  wait_milliseconds: 0
  games_per_hour: 0
  active_games: 0
  active_players: 0
  forming_games: 0
  waiting_players: 0

class game_factory_description extends base
	constructor: (params) ->
		super(params)
		
		@name = 'network.game_master.game_factory_description'
		
  id: null
  name: null
  attribute: []
  stats_bucket: []

class game_handle extends base
	constructor: (params) ->
		super(params)
		
		@name = 'network.game_master.game_handle'
		
  factory_id: null
  game_id: null


exports.player = player
exports.connection_info = connection_info
exports.game_stats_bucket = game_stats_bucket
exports.game_factory_description = game_factory_description
exports.game_handle = game_handle
exports.list_factories_request = require('./list_factories_request').list_factories_request
exports.list_factories_response = require('./list_factories_response').list_factories_response
exports.service = require('./service').service