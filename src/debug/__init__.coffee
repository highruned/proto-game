if !global.console
	global.console =
		log: () ->

if !global.debug
	global.debug = 
		info: console.log
		error: console.log
		warn: console.log

exports.config =
	trace:
		silent: false
		level: 10 # represents the level of warnings/info you want logged, from 0-10. 0 being none. 10 being all.
		path: __dirname + '/log/trace.txt'

exports.trace = require('./trace').trace

exports.info = exports.write = (messages..., options = {level: 10}) ->
	debug.info messages...
	
exports.error = (messages..., options = {level: 10}) ->
	debug.error messages...
	
exports.warn = (messages..., options = {level: 10}) ->
	debug.warn messages...