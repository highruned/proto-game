schema = require('../schema').schema

base = new schema('network.process_id')

class process_id extends base
	constructor: () ->
		
  label: null
  epoch: null
	
exports.process_id = process_id
exports.connection = require('./connection/__init__')
exports.message = require('./message').message
exports.service = require('./service').service