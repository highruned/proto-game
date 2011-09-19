require('../../buffer')
network = require('../__init__')
base = require('../service').service
util = require('../../util')
node = require('util')

class service extends base
	constructor: () ->
		super()
		
		@request_handlers =
			1: network.storage.execute_request
			2: network.storage.open_table_request
			3: network.storage.open_column_request

	get_toon_settings: (request) ->
		op = request.operations[0]
 		
		operation_result = new network.storage.operation_result
			table_id: op.table_id
			data: [
				new network.storage.cell
					column_id: op.column_id
					row_id: op.row_id
					version: 1
			]
			
		return operation_result
		
	get_hero_digests: (request) ->
		op = request.operations[0]
			
		hero_digest = new network.game.hero.digest
			#version: 1
			hero_id: new network.game.entity_id
				id_high: 0x300016200004433
				id_low: 1
			hero_name: 'Codeweaver'
			gbid_class: 0x1D4681B1
			level: 1
			player_flags: 0x2000002
			visual_equipment: new network.game.hero.visual_equipment
			#quest_history: [
			#	new network.game.hero.quest_history_entry
			#]
			last_played_act: 0
			highest_unlocked_act: 0
			last_played_difficulty: 0
			highest_unlocked_difficulty: 0
			last_played_quest: 1
			last_played_quest_step: 1
			time_played: 0
			
		operation_result = new network.storage.operation_result
			table_id: op.table_id
			data: [
				new network.storage.cell
					column_id: op.column_id
					row_id: op.row_id
					version: 1
					data: Array::slice.call(hero_digest.pack(), 0) # to byte string?
			]
		
		console.log node.inspect(operation_result, true, 10)
		
		return operation_result
	
	buffer_to_byte_string: (buffer) ->
		str = ''
		
		for value, key in buffer
			v = buffer.charCodeAt(key) & 0xff
			
			if v >= 32 && v <= 127
				str = str + value
			else if v < 10
				str = str + '\\00' + v
			else if v < 100
				str = str + '\\0' + v
			else
				str = str + '\\' + v
				
		return str
	
	load_account_digest: (request) ->
		op = request.operations[0]
			
		account_digest = new network.game.account.digest
			version: 1
			last_played_hero_id: new network.entity_id
				high: 0
				low: 0
			banner_configuration: new network.game.account.banner_configuration
				background_color_index: 0
				banner_inx: 0
				pattern: 0
				pattern_color_index: 0
				placement_index: 0
				sigin_accent: 0
				sigil_main: 0
				sigil_color_index: 0
				use_sigil_variant: false
			flags: 0

		operation_result = new network.storage.operation_result
			table_id: op.table_id
			data: [
				new network.storage.cell
					column_id: op.column_id
					row_id: op.row_id
					version: 1
					data: Array::slice.call(account_digest.pack(), 0) # to byte string?
			]
			
		return operation_result
		
	get_game_account_settings: (request) ->
		op = request.operations[0]
 		
		operation_result = new network.storage.operation_result
			table_id: op.table_id
			data: [
				new network.storage.cell
					column_id: op.column_id
					row_id: op.row_id
					#version: 1
			]
			
		return operation_result

	id: 9
	hash: 0xda6e4bb9
	name: 'network.storage.service'
	request_callbacks: {}
	total_requests: 0
	request_handlers: {}
	response_handlers: {}

exports.service = service