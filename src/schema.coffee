class schema
	constructor: () ->
	
	set_bindings: (@bindings) ->
	
	get: (name) ->
		Schema = require('../vendor/protobuf_for_node').Schema
		
		descriptor = new Schema(global.descriptor)
		
		return descriptor[@bindings[name]]
	
	@bindings: {}
		
		
exports.schema = schema