object = require('../object').object

class message extends object
	constructor: (params) ->
		object::merge(@, params) # we like to be extended

	pack: () ->
		definition = global.schema.get(@get_definition_name())
		
		if !definition
			console.error 'Could not find message definition by name: ' + @get_definition_name()
		
		return definition.serialize(@) # serialize ourself as this definition
		
	unpack: (data) ->
		definition = global.schema.get(@get_definition_name())
		
		if !definition
			console.error 'Could not find message definition by name or is undefined: ' + @get_definition_name(), global.schema
		
		if !data
			console.error 'Unpack being called with no data, using an empty buffer.'
			
			data = new Buffer(0)
		
		item = definition.parse(data)
		
		object::merge(@, item) # extend ourself with this definition
		
		return @
		
	is_answer: () ->
		return @service_id == 256

exports.message = message