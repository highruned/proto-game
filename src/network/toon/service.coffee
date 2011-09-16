require('buffertools')
network = require('../__init__')
base = require('../service').service

class service extends base
	constructor: () ->
		super()
		
		@request_handlers =
			1: network.connection.echo_request
			2: network.connection.disconnect_notification
			3: network.connection.null_request
			4: network.connection.encrypt_request
			5: network.connection.disconnect_request
		
		@response_handlers =
			1: network.connection.echo_response
			2: network.connection.null_response
			3: network.connection.encrypt_response
			4: network.connection.disconnect_response
		
	
	send: (params) ->
		service_id = @id
		request_id = ++@total_requests
		m1 = params.message.pack()
		m2 = new Buffer([service_id, params.method_id, request_id, 0, 0, m1.length])
		m3 = m2.concat(m1)
		
		console.log 'Sending: ', ' Service: ', service_id, ' Method: ', params.method_id, ' Length: ', m1.length, ' Message: ', m1
		
		if params.call
			@request_callbacks[request_id] = params.call
		
		params.endpoint.write(m3)
	
	receive: (params) ->
		result =
			endpoint: params.endpoint
			method_id: params.message.readUInt8()
			request_id: params.message[1]
			unknown: ServiceID != 0xfe ? params.message.readVarint64() : null
			length: params.message.readVarint32() #params.message[4] + (params.message[3] << 16)
			message: params.message.slice(5)
		
		console.log 'Received: ', 'Method: ', result.method_id, ' Length: ', result.length, 'Message: ', result.message
		
		if @request_callbacks[result.request_id]
			result.message = new @response_handlers[result.method_id]().unpack(result.message)
			call = @request_callbacks[result.request_id]
			
			delete @request_callbacks[result.request_id]
			
			call(result)
		else
			result.message = new @request_handlers[result.method_id]().unpack(result.message)
		
			@emit(result.message.name.replace('network.toon.', ''), result)

	id: 1
	hash: 0x83040608
	name: 'toon'
	request_callbacks: {}
	total_requests: 0
	request_handlers: {}
	response_handlers: {}

exports.service = service