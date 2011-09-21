base = require('../message').message

class list_factories_request extends base
	constructor: (params) ->
		super(params)
		
	get_definition_name: () -> 'network.game_master.list_factories_request'

exports.list_factories_request = list_factories_request