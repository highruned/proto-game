class client extends require('events').EventEmitter
	constructor: (@socket) ->
		@socket.on 'connect', (params...) =>
			@emit('connect', params...)

		@socket.on 'data', (params...) =>
			@emit('data', params...)
			
	add_module: (module) ->
		@modules.push(module)
	
	write: (params...) ->
		return @socket.write(params...)
		
	socket: null
	modules: []
	
exports.client = client