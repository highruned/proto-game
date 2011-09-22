require('../../buffer')
network = require('../__init__')
base = require('../service').service

class service extends base
	constructor: () ->
		super
			id: 0
			hash: 0
			name: 'network.connection.service'
	
		@request_handlers =
			1: network.connection.connect_request
			2: network.connection.bind_request
			3: network.connection.echo_request
			4: network.connection.disconnect_notification
			5: network.connection.null_request
			6: network.connection.encrypt_request
			7: network.connection.disconnect_request
		
		@response_handlers =
			1: network.connection.connect_response
			2: network.connection.bind_response
			3: network.connection.echo_response
			4: network.connection.disconnect_notification
			5: network.connection.null_response
			6: network.connection.encrypt_response
			7: network.connection.disconnect_response

	process_message: (message) ->
		console.log 'Received: ', 'Service: ', @name, 'Method ID: ', message.method_id, 'Request ID: ', message.request_id, ' Length: ', message.length, 'Payload: ', message.payload
		
		if message.method_id == 0
			message.method_id = 1
			
		if !@request_handlers[message.method_id]
			console.log "Cannot find a request handler."
			
			return
		
		if @request_callbacks[message.request_id]
			message.payload = new @response_handlers[message.method_id]().unpack(message.payload)
				
			call = @request_callbacks[message.request_id]
			
			delete @request_callbacks[message.request_id]
			
			call(message)
		else
			# hack
			if message.method_id == 1
				message.payload = new @request_handlers[message.method_id]()
			else
				message.payload = new @request_handlers[message.method_id]().unpack(message.payload)
		
			@emit(message.payload.get_definition_name().substr(message.payload.get_definition_name().lastIndexOf('.') + 1), message) # cut off the namespace and fire the event


exports.service = service