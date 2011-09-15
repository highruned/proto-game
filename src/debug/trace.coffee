debug = require('./__init__')
fs = require('fs')

class trace
	constructor: (messages..., options = {level: 10}) ->
		@resources = new os.file(debug.config.trace['path'])
		
		@write messages..., options
	
	write: (messages..., options = {level: 10}) ->
		if options['level'] < debug.config.trace['level']
			return # don't trace something we're not interested in
	
		message = core.string.format("[%s] %s\n", core.datetime.create().format('%F %T'), messages)

		if !debug.config.trace['silent'] # do we want output?
			debug.info messages...
		
		os.file.write messages.join("\n")
	
	resource: null

exports.trace = trace