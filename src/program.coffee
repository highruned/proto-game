network = require('./network/__init__')
schema = require('./schema').schema
object = require('./object').object
util = require('./util')

class program extends require('events').EventEmitter
	constructor: (params) ->
		object::extend(true, @, params)
		
		@schema = new schema()
		
		global.schema = @schema
		
		@set_descriptor(@descriptor)
		
		
	get_service: (name) ->
		return @services[name]
		
	get_service_by_id: (id) ->
		for key, service of @services
			if service.id == id
				return service
				
	get_service_by_hash: (hash) ->
		for key, service of @services
			if service.get_hash() == undefined
				console.error 'Service has not defined a hash.'
				
				console.log service, key, service.get_hash()
				
				process.exit 1
			
			if service.get_hash() == hash
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