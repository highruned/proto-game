object = require('../object').object
schema = require('../schema').schema

base = new schema('network.process_id')

class process_id extends base
	constructor: (params) ->
		object::extend(true, @, params)
		
  label: null
  epoch: null

class entity_id extends base
	constructor: (params) ->
		object::extend(true, @, params)
		
  low: null
  high: null

class entity extends base
	constructor: (params) ->
		object::extend(true, @, params)
		
  account_id: null
  game_account_id: null
  toon_id: null
  
class bound_service
	constructor: (params) ->
		object::extend(true, @, params)
	
  hash: null
  id: null


exports.process_id = process_id
exports.entity_id = entity_id
exports.entity = entity
exports.bound_service = bound_service
exports.message = require('./message').message
exports.bind_request = require('./bind_request').bind_request
exports.bind_response = require('./bind_response').bind_response
exports.connect_request = require('./connect_request').connect_request
exports.connect_response = require('./connect_response').connect_response
exports.service = require('./service').service
exports.connection = require('./connection/__init__')
exports.authentication = require('./authentication/__init__')