package msginfo {
	import com.netease.protobuf.*;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import flash.utils.ByteArray;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class am_req_switch_room extends com.netease.protobuf.Message {
		public static const ROOM_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("msginfo.am_req_switch_room.room_id", "roomId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var roomId:UInt64;

		public static const ROOM_PASSWORD:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("msginfo.am_req_switch_room.room_password", "roomPassword", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var room_password$field:flash.utils.ByteArray;

		public function clearRoomPassword():void {
			room_password$field = null;
		}

		public function get hasRoomPassword():Boolean {
			return room_password$field != null;
		}

		public function set roomPassword(value:flash.utils.ByteArray):void {
			room_password$field = value;
		}

		public function get roomPassword():flash.utils.ByteArray {
			return room_password$field;
		}

		public static const CLIENT_ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("msginfo.am_req_switch_room.client_id", "clientId", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var client_id$field:uint;

		private var hasField$0:uint = 0;

		public function clearClientId():void {
			hasField$0 &= 0xfffffffe;
			client_id$field = new uint();
		}

		public function get hasClientId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set clientId(value:uint):void {
			hasField$0 |= 0x1;
			client_id$field = value;
		}

		public function get clientId():uint {
			return client_id$field;
		}

		/**
		 *  @private
		 */
		override public final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, this.roomId);
			if (hasRoomPassword) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_BYTES(output, room_password$field);
			}
			if (hasClientId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, client_id$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override public final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var room_id$count:uint = 0;
			var room_password$count:uint = 0;
			var client_id$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (room_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_req_switch_room.roomId cannot be set twice.');
					}
					++room_id$count;
					this.roomId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 2:
					if (room_password$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_req_switch_room.roomPassword cannot be set twice.');
					}
					++room_password$count;
					this.roomPassword = com.netease.protobuf.ReadUtils.read$TYPE_BYTES(input);
					break;
				case 3:
					if (client_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_req_switch_room.clientId cannot be set twice.');
					}
					++client_id$count;
					this.clientId = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
