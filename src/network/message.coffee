object = require('../object').object

class message extends object
	constructor: (params) ->
		object::extend(true, @, params)

	pack: () ->
		return global.schema.get(@name).serialize(@)
		
	unpack: (data) ->
		definition = global.schema.get(@name).parse(data)
		
		object::extend(true, @, definition)
		
		return @

exports.message = message