base = require('../message').message

class execute_request extends base
	constructor: (params) ->
		super(params)
		
	get_definition_name: () -> 'network.storage.execute_request'
	
class open_table_request extends base
	constructor: (params) ->
		super(params)
		
	get_definition_name: () -> 'network.storage.open_table_request'
	
class open_column_request extends base
	constructor: (params) ->
		super(params)
		
	get_definition_name: () -> 'network.storage.open_column_request'

class execute_response extends base
	constructor: (params) ->
		super(params)
		
	get_definition_name: () -> 'network.storage.execute_response'
	
class open_table_response extends base
	constructor: (params) ->
		super(params)
		
	get_definition_name: () -> 'network.storage.open_table_response'
	
class open_column_response extends base
	constructor: (params) ->
		super(params)
		
	get_definition_name: () -> 'network.storage.open_column_response'
	
class operation_result extends base
	constructor: (params) ->
		super(params)
		
	get_definition_name: () -> 'network.storage.operation_result'
	
class cell extends base
	constructor: (params) ->
		super(params)
		
	get_definition_name: () -> 'network.storage.cell'


exports.cell = cell
exports.operation_result = operation_result
exports.execute_request = execute_request
exports.open_table_request = open_table_request
exports.open_column_request = open_column_request
exports.execute_response = execute_response
exports.open_table_response = open_table_response
exports.open_column_response = open_column_response
exports.service = require('./service').service