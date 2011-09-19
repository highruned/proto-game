require('../../buffer')
network = require('../__init__')
base = require('../service').service
util = require('../../util')

class service extends base
	constructor: () ->
		super()
		
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
		if params.data.length < 4
			console.log "Header not large enough, continuing."
			
			return new Buffer(0)
		
		header = params.data.slice(0, 5)
		
		message =
			endpoint: params.endpoint
			method_id: header[0]
			request_id: header[1]
			length: header[4] + (header[3] << 16)
		
		if message.length
			message.payload = params.data.slice(header.length, message.length + header.length)
		
		@process_message(message)
		console.log 'Left over: ',  params.data.slice(header.length + message.length).length
		return params.data.slice(header.length + message.length) # tell the service manager that we took some off the top
		
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
			message.payload = new @request_handlers[message.method_id]().unpack(message.payload)
		
			@emit(message.payload.name.substr(message.payload.name.lastIndexOf('.') + 1), message) # cut off the namespace and fire the event


	id: 14
	hash: 0x0a24a291
	name: 'network.search.service'
	request_callbacks: {}
	total_requests: 0
	request_handlers: {}
	response_handlers: {}

exports.service = service