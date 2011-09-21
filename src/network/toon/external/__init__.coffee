base = require('../../message').message

class select_request extends base
	constructor: (params) ->
		super(params)
		
	get_definition_name: () ->
		return 'network.toon.external.select_request'

exports.select_request = select_request

class select_response extends base
	constructor: (params) ->
		super(params)
		
	get_definition_name: () ->
		return 'network.toon.external.select_response'

exports.select_response = select_response

class create_request extends base
	constructor: (params) ->
		super(params)
		
	get_definition_name: () ->
		return 'network.toon.external.create_request'

exports.create_request = create_request

class delete_request extends base
	constructor: (params) ->
		super(params)
		
	get_definition_name: () ->
		return 'network.toon.external.delete_request'

exports.delete_request = delete_request

exports.toon_list_request = require('./toon_list_request').toon_list_request
exports.toon_list_response = require('./toon_list_response').toon_list_response
exports.service = require('./service').service