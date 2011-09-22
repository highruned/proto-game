require('../../buffer')
network = require('../__init__')
base = require('../service').service
util = require('../../util')
node = require('util')

class service extends base
	constructor: () ->
		super
			id: 9
			hash: 0xda6e4bb9
			name: 'network.storage.service'
		
		@request_handlers =
			1: network.storage.execute_request
			2: network.storage.open_table_request
			3: network.storage.open_column_request

	get_toon_settings: (message) ->
		operation_results = []

		for op in message.payload.operations
			operation_result = new network.storage.operation_result
				table_id: op.table_id
				data: [
					new network.storage.cell
						column_id: op.column_id
						row_id: op.row_id
						version: 1
				]
		
			operation_results.push(operation_result)
		
		return operation_results
		
	get_hero_digests: (message) ->
		operation_results = []

		for op in message.payload.operations
			hero_digest = new network.game.hero.digest
				version: 891
				hero_id: new network.game.entity_id
					id_high: message.endpoint.toons[0].high
					id_low: message.endpoint.toons[0].low
				hero_name: 'Codeweaver'
				gbid_class: 0x1D4681B1
				level: 1
				player_flags: 0x2000002
				visual_equipment: new network.game.hero.visual_equipment
					visual_item: [
						# head
						new network.game.hero.visual_item
							gbid: 3821
							dye_type: 0
							item_effect_type: 0
							effect_level: 0
							,
						# chest
						new network.game.hero.visual_item
							gbid: 0
							dye_type: 0
							item_effect_type: 0
							effect_level: 0
							,
						# feet
						new network.game.hero.visual_item
							gbid: 0
							dye_type: 0
							item_effect_type: 0
							effect_level: 0
							,
						# hands
						new network.game.hero.visual_item
							gbid: 0
							dye_type: 0
							item_effect_type: 0
							effect_level: 0
							,
						# weapon 1
						new network.game.hero.visual_item
							gbid: 4479
							dye_type: 0
							item_effect_type: 0
							effect_level: 0
							,
						# weapon 2
						new network.game.hero.visual_item
							gbid: 0
							dye_type: 0
							item_effect_type: 0
							effect_level: 0
							,
						# shoulders
						new network.game.hero.visual_item
							gbid: 0
							dye_type: 0
							item_effect_type: 0
							effect_level: 0
							,
						# legs
						new network.game.hero.visual_item
							gbid: 0
							dye_type: 0
							item_effect_type: 0
							effect_level: 0
					]
				quest_history: []
				last_played_act: 0
				highest_unlocked_act: 0
				last_played_difficulty: 0
				highest_unlocked_difficulty: 0
				last_played_quest: -1
				last_played_quest_step: -1
				time_played: 0
				
			operation_result = new network.storage.operation_result
				table_id: op.table_id
				data: [
					new network.storage.cell
						column_id: op.column_id
						row_id: op.row_id
						version: 1
						data: hero_digest.pack() # to byte array
				]
		
			operation_results.push(operation_result)
		
		console.log node.inspect(operation_result, true, 10)
			
		return operation_results
	
	load_account_digest: (message) ->
		operation_results = []
		
		for op in message.payload.operations
			account_digest = new network.game.account.digest
				version: 1
				last_played_hero_id: new network.entity_id
					id_high: 0
					id_low: 0
				banner_configuration: new network.game.account.banner_configuration
					background_color_index: 0
					banner_index: 0
					pattern: 0
					pattern_color_index: 0
					placement_index: 0
					sigil_accent: 0
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
						data: account_digest.pack() # to byte array
				]
			
			operation_results.push(operation_result)
		console.log 'B', operation_results
			
		return operation_results
		
	get_game_account_settings: (message) ->
		operation_results = []
		
		for op in message.payload.operations
			operation_result = new network.storage.operation_result
				table_id: op.table_id
				data: [
					new network.storage.cell
						column_id: op.column_id
						row_id: op.row_id
						#version: 1
				]
			
			operation_results.push(operation_result)
		console.log 'B', operation_results
		return operation_results

exports.service = service