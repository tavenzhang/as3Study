package msginfo {
	import com.netease.protobuf.*;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import msginfo.am_user_draw_info;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class am_notify_user_enter_room extends com.netease.protobuf.Message {
		public static const CHANNEL_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("msginfo.am_notify_user_enter_room.channel_id", "channelId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var channel_id$field:int;

		private var hasField$0:uint = 0;

		public function clearChannelId():void {
			hasField$0 &= 0xfffffffe;
			channel_id$field = new int();
		}

		public function get hasChannelId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set channelId(value:int):void {
			hasField$0 |= 0x1;
			channel_id$field = value;
		}

		public function get channelId():int {
			return channel_id$field;
		}

		public static const ROOM_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("msginfo.am_notify_user_enter_room.room_id", "roomId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var room_id$field:int;

		public function clearRoomId():void {
			hasField$0 &= 0xfffffffd;
			room_id$field = new int();
		}

		public function get hasRoomId():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set roomId(value:int):void {
			hasField$0 |= 0x2;
			room_id$field = value;
		}

		public function get roomId():int {
			return room_id$field;
		}

		public static const USER_INFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("msginfo.am_notify_user_enter_room.user_info", "userInfo", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, msginfo.am_user_draw_info);

		private var user_info$field:msginfo.am_user_draw_info;

		public function clearUserInfo():void {
			user_info$field = null;
		}

		public function get hasUserInfo():Boolean {
			return user_info$field != null;
		}

		public function set userInfo(value:msginfo.am_user_draw_info):void {
			user_info$field = value;
		}

		public function get userInfo():msginfo.am_user_draw_info {
			return user_info$field;
		}

		/**
		 *  @private
		 */
		override public final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasChannelId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, channel_id$field);
			}
			if (hasRoomId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, room_id$field);
			}
			if (hasUserInfo) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, user_info$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override public final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var channel_id$count:uint = 0;
			var room_id$count:uint = 0;
			var user_info$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (channel_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_notify_user_enter_room.channelId cannot be set twice.');
					}
					++channel_id$count;
					this.channelId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (room_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_notify_user_enter_room.roomId cannot be set twice.');
					}
					++room_id$count;
					this.roomId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (user_info$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_notify_user_enter_room.userInfo cannot be set twice.');
					}
					++user_info$count;
					this.userInfo = new msginfo.am_user_draw_info();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.userInfo);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
