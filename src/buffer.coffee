require('buffertools')

Buffer.toHex = () ->
	r = ''
	e = @length
	c = 0
	h = ''
	
	while c < e
		h = @charCodeAt(c++).toString(16)
		
		while h.length < 3
			h = "0" + h
			
		r += h
	
	return r

# none of these work
# only varint16 kinda works atm

Buffer.readInt16 = (offset, endian) ->
	result = 0
	buffer = @
	
	result = buffer[offset] | (buffer[offset+1] << 8)
	
	return result

Buffer.readInt32 = (offset, endian) ->
	result = 0
	buffer = @
	
	result = buffer[offset+1] + (buffer[offset] << 16)
	
	return result

	
Buffer::writeByte = (value, offset, endian) ->
	@[offset] = value
	
Buffer::readBytes = (offset, size, endian) ->
	if @length < 0
		console.log('buffer is negative length.')
	
	result = new Buffer()
	
	if size != 0
		@copy(@, result, 0, offset, offset + size)
	
	return result

	
Buffer::writeByte2 = (value, offset, endian) ->
	@[offset] = value
	
Buffer::readByte2 = (offset, endian) ->
	result = @[offset]

	return result
	
Buffer::readRawByte = (offset, endian) ->
	return @readByte2(offset, endian)
	
Buffer::readRawVarint64 = (offset, endian) ->
	shift = 0
	result = 0
	
	while shift < 64
		b = @readRawByte(offset)
		ba = new Buffer()
		
		ba.writeByte2(b & 0x7F)
 	
		# shift the byte to its position and set it in the result
		ba = ba << shift
		result = result | ba
		
		# are we done or do we continue
		if (b & 0x80) == 0
			return result
		
		shift += 7
	
	console.log("Malformed varint64.")