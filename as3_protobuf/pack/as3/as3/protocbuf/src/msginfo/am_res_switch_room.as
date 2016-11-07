package msginfo {
	import com.netease.protobuf.*;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class am_res_switch_room extends com.netease.protobuf.Message {
		public static const ERROR_CODE:FieldDescriptor$TYPE_SINT32 = new FieldDescriptor$TYPE_SINT32("msginfo.am_res_switch_room.error_code", "errorCode", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var errorCode:int;

		public static const ROOM_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("msginfo.am_res_switch_room.room_id", "roomId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var room_id$field:UInt64;

		public function clearRoomId():void {
			room_id$field = null;
		}

		public function get hasRoomId():Boolean {
			return room_id$field != null;
		}

		public function set roomId(value:UInt64):void {
			room_id$field = value;
		}

		public function get roomId():UInt64 {
			return room_id$field;
		}

		/**
		 *  @private
		 */
		override public final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_SINT32(output, this.errorCode);
			if (hasRoomId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, room_id$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override public final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var error_code$count:uint = 0;
			var room_id$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (error_code$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_res_switch_room.errorCode cannot be set twice.');
					}
					++error_code$count;
					this.errorCode = com.netease.protobuf.ReadUtils.read$TYPE_SINT32(input);
					break;
				case 2:
					if (room_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_res_switch_room.roomId cannot be set twice.');
					}
					++room_id$count;
					this.roomId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
