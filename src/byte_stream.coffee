class byte_stream extends Buffer
  constructor: (@bytes) ->
    @length = @bytes.length
    @index = 0
  
  has_bytes: (self) ->
    return @index < @length
  
  read_byte: (self) ->
    byte = @bytes[@index]
    @index += 1
    
    return byte
    
  read_bytes: (count) ->
    ret = []
    
    for i in [0...count]
      ret += [@read_byte()]
      
    return ret
  
  read_varint: (self) ->
    sum = 0
    shift = 0
    
    while true
      sum += (@bytes[@index] & 0x7f) << shift
      shift += 7
      @index += 1
      
      if (@bytes[@index - 1] & 0x80) == 0
        break
        
    return sum
    
  read_word: (self) ->
    return @read_byte() | (@read_byte() << 8)
    
  read_int32: (self) ->
    return @read_word() | (@read_word() << 16)
    
  read_int64: (self) ->
    return @read_int32() | (@read_int32() << 32)
    
  skip: (number) ->
    @index += number
    
  remaining: (self) ->
    return @bytes[@index ->]
    
exports.byte_stream = byte_stream