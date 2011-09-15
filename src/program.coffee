EventEmitter2 = require('EventEmitter2').EventEmitter2
network = require('./network/__init__')
schema = require('./schema').schema

class program extends EventEmitter2
	constructor: () ->
		@schema = new schema()
		
		global.schema = @schema
		
	get_service: (name) ->
		return @services[name]
		
	get_service_by_id: (id) ->
		for key, service of @services
			if service.id == id
				return service
		
	set_descriptor: (@descriptor) ->
		global.descriptor = @descriptor
		
	rebind_network: (bindings) ->
		@schema.set_bindings(bindings)

	add_service: (service) ->
		@services[service.name] = service

	get_service: (name) ->
		return @services[name]

	add_plugin: (plugin) ->
		plugin.set_program(@)
	
		@plugins.push(plugin)

	get_plugins: () ->
		return @plugins

	services: {}
	plugins: []
	schema: null
	descriptor: null
	
exports.program = program