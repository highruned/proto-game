require('../../buffer')
network = require('../__init__')
base = require('../service').service
util = require('../../util')

class service extends base
	constructor: () ->
		super()

		@on 'add_subscriber', (subscriber) ->
			add_notification = new network.channel.add_notification
				channel_state: [
					new network.presence.channel_state
				    entity_id:
				      high: 72057594037927936
				      low: 23545
				    field_operation:
				      field:
				        key:
				          program: 17459
				          group: 1
				          field: 1
				          index: 0
				        value:
				          message_value: "\010\263\210\201\200\240\254\200\200\003\020\310\331\224\236\263\224\325\261\313\001"
				    field_operation:
				      field:
				        key:
				          program: 16974
				          group: 1
				          field: 1
				          index: 0
				        value:
				          string_value: "Dreyfal Hyatt"
				    field_operation:
				      field:
				        key:
				          program: 16974
				          group: 1
				          field: 2
				          index: 0
				        value:
				          bool_value: true
				    field_operation:
				      field:
				        key:
				          program: 16974
				          group: 1
				          field: 4
				          index: 10752446439796583110
				        value:
				          message_value: "\t3D\000\000b\001\000\003\021\365n}ns\\8\226"
				    field_operation:
				      field:
				        key:
				          program: 16974
				          group: 1
				          field: 4
				          index: 14439479118565566715
				        value:
				          message_value: "\t3D\000\000b\001\000\003\021\310,\3053\243Tc\313"
				]
				
			# send

	id: 16
	hash: 0xb732db32
	name: 'network.channel.service'
	request_callbacks: {}
	total_requests: 0
	request_handlers: {}
	response_handlers: {}

exports.service = service