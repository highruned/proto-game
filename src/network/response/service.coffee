network = require('../__init__')
util = require('../../util')
base = require('../service').service
i = 0
class service extends base
	constructor: () ->
		super
			id: 0xfe
			hash: 0xfffffffe
			name: 'network.response.service'
			total_requests: -1
		
		@request_handlers[195] = network.response.handle_request # logout requested
	
	send: (message) ->
		service_id = @id
		
		if !message.payload
			console.error 'Message has no payload?', message
		
		m1 = message.payload.pack()

		request_id = ++@total_requests
		
		m2 = new Buffer(4)
		m2[0] = service_id
		m2[1] = 0
		m2[2] = request_id
		m2[3] = 0
			
		bytes = new network.varint
			value: m1.length
				
		console.log 'sending length: ', m2, bytes, bytes.pack().slice(1), m1
		
		m3 = m2.concat(bytes.pack().slice(1)).concat(m1)
		
		console.log 'Sending: ', ' Service ID: ', service_id, 'Request ID: ', request_id, ' Method ID: ', message.method_id, ' Length: ', m1.length, ' Payload: ', m1
		
		console.log 'Raw: Length: ', m3.length, 'Data: ', m3
		
		console.log 'Object: ', message.payload
		
		#setTimeout ((message, m3) ->
		#	return () ->
		message.endpoint.write(m3)
		#)(message, m3), 5000
		


exports.service = service