require('buffertools')
base = require('../service').service

class service extends base
	constructor: () ->
		super()
	
	send: (method_id, endpoint, message) ->
		m1 = message.encode()
		m2 = new Buffer([@id, method_id, 0, 0, 0, m1.length])
		m3 = m2.concat(m1)
		
		console.log 'Sending: ', m3, ' Type: ', @id, ' Method: ', method_id, ' Length: ', m1.length
		
		endpoint.write(m3)
	
	receive: (message) ->
		service_id = message[0]
		method_id = message[1]
		length = message[5] + (message[4] << 16)
		message = message.slice(6)
		
		return [service_id, method_id, length, message]
	
	process_message: (client, message, callback) ->
		type = message[0]
		length = message[4] + (message[3] << 16)
		message = message.slice(5)
		
		console.log 'Received: ', message, 'Type: ', type, ' Length: ', length
		
		if type == 0x01
			@emit('connect_request', client, length)
		else if type == 0x02
			@emit('bind_request', client, length)

	id: 1
	name: 'connection'

exports.service = service