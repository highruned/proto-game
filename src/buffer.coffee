require('buffertools')

# only varint16 kinda works atm

Buffer::readRawVarint8 = (offset, endian) ->
	result = 0
	buffer = @
	
	result = buffer[offset] | (buffer[offset+1] << 8)
	
	return result
	
Buffer::readRawVarint16 = (offset, endian) ->
	result = 0
	buffer = @
	
	result = buffer[offset+1] + (buffer[offset] << 16)
	
	return result

Buffer::readRawByte = (offset, endian) ->
	return @readByte(offset, endian)

Buffer::readByte = (offset, endian) ->
	result = @[offset]

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
	
Buffer::readRawVarint32 = (offset, endian) ->
	tmp = @readRawByte(offset)
	
	if tmp >= 0
		return tmp
	
	result = tmp & 0x7f
	
	if (tmp = @readRawByte(offset+1)) >= 0
		result |= tmp << 7
	else 
		result |= (tmp & 0x7f) << 7
		
		if(tmp = @readRawByte(offset+2)) >= 0
			result |= tmp << 14
		else
			result |= (tmp & 0x7f) << 14
			
			if (tmp = @readRawByte(offset+3)) >= 0
				result |= tmp << 21
			else
				result |= (tmp & 0x7f) << 21
				result |= (tmp = @readRawByte(offset+4)) << 28
				
				if tmp < 0
					# discard upper 32 bits.
					for i in [0..4]
						if @readRawByte(offset+i) >= 0
							return result
					
					console.log("Malformed varint32.")

	return result

Buffer::readRawVarint64 = (offset, endian) ->
	shift = 0
	result = 0
	
	while shift < 64
		b = @readRawByte(offset)
		ba = new Buffer()
		
		ba.writeByte(b & 0x7F)
 	
		# shift the byte to its position and set it in the result
		ba = ba << shift
		result = result | ba
		
		# are we done or do we continue
		if (b & 0x80) == 0
			return result
		
		shift += 7
	
	console.log("Malformed varint64.")