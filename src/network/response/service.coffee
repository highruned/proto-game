network = require('../__init__')
util = require('../../util')
base = require('../service').service

class service extends base
	constructor: () ->
		super()
	
	send: (message) ->
		service_id = @id
		
		if !message.payload
			console.error 'Message has no payload?', message
		
		m1 = message.payload.pack()

		request_id = ++@total_requests
		
		if service_id == 0xfe
			m2 = new Buffer(5)
			m2[0] = service_id
			m2[1] = 0
			m2[2] = request_id
			m2[3] = 0
			m2[4] = m1.length 
			
		m3 = m2.concat(m1)
		
		console.log 'Sending: ', ' Service ID: ', service_id, 'Request ID: ', request_id, ' Method ID: ', message.method_id, ' Length: ', m1.length, ' Payload: ', m1
		
		console.log 'Raw: Length: ', m3.length, 'Data: ', m3
		
		console.log 'Object: ', message.payload
		
		message.endpoint.write(m3)

	id: 0xfe
	hash: 0xfffffffe
	name: 'network.response.service'
	request_callbacks: {}
	total_requests: -1
	request_handlers: {}
	response_handlers: {}

exports.service = service