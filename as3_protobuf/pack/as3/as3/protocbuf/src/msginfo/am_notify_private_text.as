package msginfo {
	import com.netease.protobuf.*;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import msginfo.am_user_draw_info;
	import msginfo.am_text_message;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class am_notify_private_text extends com.netease.protobuf.Message {
		public static const USER_DRAW_INFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("msginfo.am_notify_private_text.user_draw_info", "userDrawInfo", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, msginfo.am_user_draw_info);

		private var user_draw_info$field:msginfo.am_user_draw_info;

		public function clearUserDrawInfo():void {
			user_draw_info$field = null;
		}

		public function get hasUserDrawInfo():Boolean {
			return user_draw_info$field != null;
		}

		public function set userDrawInfo(value:msginfo.am_user_draw_info):void {
			user_draw_info$field = value;
		}

		public function get userDrawInfo():msginfo.am_user_draw_info {
			return user_draw_info$field;
		}

		public static const TEXT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("msginfo.am_notify_private_text.text", "text", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, msginfo.am_text_message);

		private var text$field:msginfo.am_text_message;

		public function clearText():void {
			text$field = null;
		}

		public function get hasText():Boolean {
			return text$field != null;
		}

		public function set text(value:msginfo.am_text_message):void {
			text$field = value;
		}

		public function get text():msginfo.am_text_message {
			return text$field;
		}

		public static const CHANNEL_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("msginfo.am_notify_private_text.channel_id", "channelId", (3 << 3) | com.netease.protobuf.WireType.VARINT);

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

		public static const ROOM_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("msginfo.am_notify_private_text.room_id", "roomId", (4 << 3) | com.netease.protobuf.WireType.VARINT);

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

		public static const ON_USER_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("msginfo.am_notify_private_text.on_user_id", "onUserId", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var on_user_id$field:int;

		public function clearOnUserId():void {
			hasField$0 &= 0xfffffffb;
			on_user_id$field = new int();
		}

		public function get hasOnUserId():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set onUserId(value:int):void {
			hasField$0 |= 0x4;
			on_user_id$field = value;
		}

		public function get onUserId():int {
			return on_user_id$field;
		}

		/**
		 *  @private
		 */
		override public final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasUserDrawInfo) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, user_draw_info$field);
			}
			if (hasText) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, text$field);
			}
			if (hasChannelId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, channel_id$field);
			}
			if (hasRoomId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, room_id$field);
			}
			if (hasOnUserId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, on_user_id$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override public final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var user_draw_info$count:uint = 0;
			var text$count:uint = 0;
			var channel_id$count:uint = 0;
			var room_id$count:uint = 0;
			var on_user_id$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (user_draw_info$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_notify_private_text.userDrawInfo cannot be set twice.');
					}
					++user_draw_info$count;
					this.userDrawInfo = new msginfo.am_user_draw_info();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.userDrawInfo);
					break;
				case 2:
					if (text$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_notify_private_text.text cannot be set twice.');
					}
					++text$count;
					this.text = new msginfo.am_text_message();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.text);
					break;
				case 3:
					if (channel_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_notify_private_text.channelId cannot be set twice.');
					}
					++channel_id$count;
					this.channelId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (room_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_notify_private_text.roomId cannot be set twice.');
					}
					++room_id$count;
					this.roomId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (on_user_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_notify_private_text.onUserId cannot be set twice.');
					}
					++on_user_id$count;
					this.onUserId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
