network = require('./__init__')
util = require('../util')
node = require('util')

class service extends require('events').EventEmitter
	constructor: () ->
		super()
		
	add_subscriber: (subscriber) ->
		@subscribers.push(subscriber)
		
		@emit 'add_subscriber', subscriber
		
	get_hash: () ->
		return @hash
		
		#console.log @name, global.schema.bindings[@name]
		
		if !global.schema.bindings[@name]
			console.error 'Service is invalid or has no bindings.', @name, @
			
			process.exit 1
		
		name = global.schema.bindings[@name] # convert to custom protocol name
		name = name.substr(name.lastIndexOf('.') + 1) # cut off namespace
		#console.log name, @hash.toString(16)
		#return util.get_service_hash(name)
	
	send: (message) ->
		service_id = if message.service_id? then message.service_id else @id
		
		if !message.payload.pack
			console.error 'Message has no ability to pack?', message
			
			process.exit 1
		
		m1 = message.payload.pack()

		request_id = if message.request_id? then message.request_id else @total_requests
		
		m2 = new Buffer([service_id, message.method_id, request_id, 0, 0, m1.length])
			
		m3 = m2.concat(m1)
		
		console.log 'Sending: ', ' Service: ', service_id, ' Method: ', message.method_id, ' Length: ', m1.length, ' Message: ', m1
		console.log node.inspect(message.payload, true, 10)
		
		if message.call
			@request_callbacks[request_id] = message.call
		
		console.log 'Sending [raw]: ', ' Length: ', m3.length, m3
		
		message.endpoint.write(m3)
		
		++@total_requests
	
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
		else
			message.payload = new Buffer(0)
			
		@process_message(message)
		console.log 'Left over: ',  params.data.slice(header.length + message.length).length
		return params.data.slice(header.length + message.length) # tell the service manager that we took some off the top

	process_message: (message) ->
		console.log 'Received: ', 'Service: ', @name, 'Method ID: ', message.method_id, 'Request ID: ', message.request_id, ' Length: ', message.length, 'Payload: ', message.payload
		
		if message.method_id == 0
			message.method_id = 1
			
		if !@request_handlers[message.method_id]
			console.log "Cannot find a request handler."
			
			process.exit 1
		
		if @request_callbacks[message.request_id]
			message.payload = new @response_handlers[message.method_id]().unpack(message.payload)
				
			call = @request_callbacks[message.request_id]
			
			delete @request_callbacks[message.request_id]
			
			call(message)
		else
			message.payload = new @request_handlers[message.method_id]().unpack(message.payload)
		
			@emit(message.payload.name.substr(message.payload.name.lastIndexOf('.') + 1), message) # cut off the namespace and fire the event

	id: null
	hash: null
	name: null
	request_callbacks: {}
	total_requests: 0
	request_handlers: {}
	response_handlers: {}
	subscribers: []
		
exports.service = service