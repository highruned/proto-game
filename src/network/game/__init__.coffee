base = require('../message').message

exports.hero = {}
exports.account = {}

class entity_id extends base
	constructor: (params) ->
		super(params)
		
		@name = 'network.game.entity_id'
		
  low: null
  high: null
  
class digest extends base
	constructor: (params) ->
		super(params)
		
		@name = 'network.game.hero.digest'
	
  type: 'TOON'
  toon_id: null
  game_account_id: null
  bnet_account_id: null
  attribute: []

exports.hero.digest = digest

class banner_configuration extends base
	constructor: (params) ->
		super(params)
		
		@name = 'network.game.account.banner_configuration'
		
  toon_id: null
  host: null
  port: null
  token: null
  attribute: []
  

class digest extends base
	constructor: (params) ->
		super(params)
		
		@name = 'network.game.account.digest'
		
  bucket_min: 0
  bucket_max = 4294967296
  wait_milliseconds: 0
  games_per_hour: 0
  active_games: 0
  active_players: 0
  forming_games: 0
  waiting_players: 0
  
exports.account.digest = digest


class visual_equipment extends base
	constructor: (params) ->
		super(params)
		
		@name = 'network.game.hero.visual_equipment'
		
class visual_item extends base
	constructor: (params) ->
		super(params)
		
		@name = 'network.game.hero.visual_item'


class quest_history_entry extends base
	constructor: (params) ->
		super(params)
		
		@name = 'network.game.hero.quest_history_entry'


exports.entity_id = entity_id
exports.account.banner_configuration = banner_configuration
exports.hero.visual_equipment = visual_equipment
exports.hero.visual_item = visual_item
exports.hero.quest_history_entry = quest_history_entry

#exports.service = require('./service').service