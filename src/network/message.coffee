object = require('../object').object

class message extends object
	constructor: (params) ->
		object::extend(true, @, params) # we like to be extended

	pack: () ->
		definition = global.schema.get(@name)
		
		if !definition
			console.error 'Could not find message definition by name: ' + @name
		console.log @
		return definition.serialize(@) # serialize ourself as this definition
		
	unpack: (data) ->
		definition = global.schema.get(@name)
	
		if !definition
			console.error 'Could not find message definition by name or is undefined: ' + @name, global.schema
		
		if !data
			console.error 'Unpack being called with no data, using an empty buffer.'
			
			data = new Buffer(0)
		
		item = definition.parse(data)
		
		object::extend(true, @, item) # extend ourself with this definition
		
		return @
		
	is_answer: () ->
		return @service_id == 256

exports.message = message