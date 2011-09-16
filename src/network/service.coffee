require('buffertools')
EventEmitter2 = require('EventEmitter2').EventEmitter2
network = require('./__init__')

class service extends EventEmitter2
	constructor: () ->
		super()
	
		@request_handlers =
			1: network.connect_request
			2: network.bind_request
		
		@response_handlers =
			1: network.connect_response
			2: network.bind_response
		
	
	send: (params) ->
		service_id = if params.service_id? then params.service_id else @id
		request_id = if params.request_id? then params.request_id else ++@total_requests
		
		m1 = params.message.pack()
		m2 = new Buffer([service_id, params.method_id, request_id, 0, 0, m1.length])
		m3 = m2.concat(m1)
		
		console.log 'Sending: ', ' Service: ', service_id, ' Method: ', params.method_id, ' Length: ', m1.length, ' Message: ', m1
		
		if params.call
			@request_callbacks[request_id] = params.call
		
		console.log 'Sending [raw]: ', ' Length: ', m3.length, m3
		
		params.endpoint.write(m3)
	
	receive: (params) ->
		result =
			endpoint: params.endpoint
			method_id: params.message[0]
			request_id: params.message[1]
			length: params.message[4] + (params.message[3] << 16) #params.message.readRawVarint16(2)
			message: params.message.slice(5)
			
		console.log 'Received: ', 'Method: ', result.method_id, ' Length: ', result.length, 'Message: ', result.message
		
		if !@request_handlers[result.method_id]
			console.log "Cannot find a request handler."
		
		if @request_callbacks[result.request_id]
			result.message = new @response_handlers[result.method_id]().unpack(result.message)
				
			call = @request_callbacks[result.request_id]
			
			delete @request_callbacks[result.request_id]
			
			call(result)
		else
			# hack
			if result.method_id == 1 or result.method_id == 2
				result.message = new @request_handlers[result.method_id]()
			else
				result.message = new @request_handlers[result.method_id]().unpack(result.message)
		
			@emit(result.message.name.replace('network.', ''), result)

	id: 0
	hash: 0
	name: 'default'
	request_callbacks: {}
	total_requests: 0
	request_handlers: {}
	response_handlers: {}
		
exports.service = service