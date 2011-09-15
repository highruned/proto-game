class message extends Object
	encode: () ->
		return global.schema.get(@name).serialize(@)
		
	decode: (data) ->
		return global.schema.get(@name).parse(data)

exports.message = message