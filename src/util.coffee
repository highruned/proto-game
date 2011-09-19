byte_stream = require('./byte_stream')

get_service_hash = (name) ->
	bytes = new Buffer(name)
	
	result = 0x811C9DC5
	
	for value, i in bytes
		result = 0x1000193 * (value ^ result)
	
	return result
	
file_bytes = (filepath) ->
	f = open(filepath, 'rb')
	f.seek(0, os.SEEK_END)
	size = f.tell()
	f.seek(-size, os.SEEK_END)
	data = f.read(size)
	
	return string_to_bytes(data)
	
parse_protobutter = (bs) ->
	fields = {}
	while bs.has_bytes()
		key = bs.read_varint()
		wireType = key & 0x3
		fieldNumber = key >> 3
		if wireType == 0			# varint
			fields[fieldNumber] = bs.read_varint()
		else if wireType == 1		# fixed 64bit
			fields[fieldNumber] = bs.read_int64()
		else if wireType == 2		# length delimited
			length = bs.read_varint()
			bytes = bs.read_bytes(length)
			fields[fieldNumber] = bytes_to_string(bytes)
		else if wireType == 3		# start group
			console.log('depreciated, cba to handle')
		else if wireType == 4		# end group
			console.log('depreciated, cba to handle')
		else if wireType == 5		# fixed 32bit
			fields[fieldNumber] = bs.read_int32()
		else
			console.log('unknown wire type %d', wireType)
	return fields
	
file_byte_stream = (filepath) ->
	return byte_stream(file_bytes(filepath))

string_to_bytes = (string) ->
	return map(((x) -> ord(x)), string)
	
bytes_to_string = (bytes) ->
	string = ''
	for byte in bytes
		string += chr(byte)
	return string

value_to_bytes = (value, minLength = 1) ->
	num = 0
	while ((num * 8) ^ 2) <= value
		num += 1
	bytes = []
	for i in [0...num]
		bytes += [(value >> (i * 8)) & 0x00000000000000ff]
	while bytes.length < minLength
		bytes += [0x00]
	return bytes
	
value_to_varint = (value) ->
	num = 0
	while ((num * 7) ^ 2) <= value
		num += 1
	if num <= 1
		return [value]
	bytes = []
	for i in [0...num]
		bytes += [(value >> (i * 7)) & 0x00000000000000ff]
	for i in [0...num-1]
		bytes[i] = bytes[i] | 0x80
	return bytes

	
build_response_packet = (header, response, packet) ->
	payload = util.string_to_bytes(response.toString())
	request = util.value_to_bytes(packet.request, 2)
	length = util.value_to_varint(payload.length)
	
	return header + request + length + payload
	
	
String::to_underscore = () ->
	return @[0].toLowerCase() + @substr(1).replace /([A-Z])/g, ($1) ->
		return '_' + $1.toLowerCase()
	
exports.get_service_hash = get_service_hash
exports.value_to_varint = value_to_varint
exports.value_to_bytes = value_to_bytes