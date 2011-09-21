base = require('../message').message

class list_factories_response extends base
	constructor: (params) ->
		super(params)
		
	get_definition_name: () -> 'network.game_master.list_factories_response'

exports.list_factories_response = list_factories_response