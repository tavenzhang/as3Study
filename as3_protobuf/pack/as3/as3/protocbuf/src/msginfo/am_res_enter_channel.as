package msginfo {
	import com.netease.protobuf.*;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import msginfo.am_user_room_basic_info;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class am_res_enter_channel extends com.netease.protobuf.Message {
		public static const ERROR_CODE:FieldDescriptor$TYPE_SINT32 = new FieldDescriptor$TYPE_SINT32("msginfo.am_res_enter_channel.error_code", "errorCode", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var errorCode:int;

		public static const USER_ROOM_BASIC_INFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("msginfo.am_res_enter_channel.user_room_basic_info", "userRoomBasicInfo", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, msginfo.am_user_room_basic_info);

		private var user_room_basic_info$field:msginfo.am_user_room_basic_info;

		public function clearUserRoomBasicInfo():void {
			user_room_basic_info$field = null;
		}

		public function get hasUserRoomBasicInfo():Boolean {
			return user_room_basic_info$field != null;
		}

		public function set userRoomBasicInfo(value:msginfo.am_user_room_basic_info):void {
			user_room_basic_info$field = value;
		}

		public function get userRoomBasicInfo():msginfo.am_user_room_basic_info {
			return user_room_basic_info$field;
		}

		public static const CHANNEL_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("msginfo.am_res_enter_channel.channel_id", "channelId", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var channel_id$field:UInt64;

		public function clearChannelId():void {
			channel_id$field = null;
		}

		public function get hasChannelId():Boolean {
			return channel_id$field != null;
		}

		public function set channelId(value:UInt64):void {
			channel_id$field = value;
		}

		public function get channelId():UInt64 {
			return channel_id$field;
		}

		public static const ROOM_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("msginfo.am_res_enter_channel.room_id", "roomId", (4 << 3) | com.netease.protobuf.WireType.VARINT);

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

		public static const TODAY_EXPENDITURE:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("msginfo.am_res_enter_channel.today_expenditure", "todayExpenditure", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var today_expenditure$field:UInt64;

		public function clearTodayExpenditure():void {
			today_expenditure$field = null;
		}

		public function get hasTodayExpenditure():Boolean {
			return today_expenditure$field != null;
		}

		public function set todayExpenditure(value:UInt64):void {
			today_expenditure$field = value;
		}

		public function get todayExpenditure():UInt64 {
			return today_expenditure$field;
		}

		public static const ENTER_AT:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("msginfo.am_res_enter_channel.enter_at", "enterAt", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var enter_at$field:UInt64;

		public function clearEnterAt():void {
			enter_at$field = null;
		}

		public function get hasEnterAt():Boolean {
			return enter_at$field != null;
		}

		public function set enterAt(value:UInt64):void {
			enter_at$field = value;
		}

		public function get enterAt():UInt64 {
			return enter_at$field;
		}

		public static const SELF_IP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("msginfo.am_res_enter_channel.self_ip", "selfIp", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var self_ip$field:uint;

		private var hasField$0:uint = 0;

		public function clearSelfIp():void {
			hasField$0 &= 0xfffffffe;
			self_ip$field = new uint();
		}

		public function get hasSelfIp():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set selfIp(value:uint):void {
			hasField$0 |= 0x1;
			self_ip$field = value;
		}

		public function get selfIp():uint {
			return self_ip$field;
		}

		/**
		 *  @private
		 */
		override public final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_SINT32(output, this.errorCode);
			if (hasUserRoomBasicInfo) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, user_room_basic_info$field);
			}
			if (hasChannelId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, channel_id$field);
			}
			if (hasRoomId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, room_id$field);
			}
			if (hasTodayExpenditure) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, today_expenditure$field);
			}
			if (hasEnterAt) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, enter_at$field);
			}
			if (hasSelfIp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, self_ip$field);
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
			var user_room_basic_info$count:uint = 0;
			var channel_id$count:uint = 0;
			var room_id$count:uint = 0;
			var today_expenditure$count:uint = 0;
			var enter_at$count:uint = 0;
			var self_ip$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (error_code$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_res_enter_channel.errorCode cannot be set twice.');
					}
					++error_code$count;
					this.errorCode = com.netease.protobuf.ReadUtils.read$TYPE_SINT32(input);
					break;
				case 2:
					if (user_room_basic_info$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_res_enter_channel.userRoomBasicInfo cannot be set twice.');
					}
					++user_room_basic_info$count;
					this.userRoomBasicInfo = new msginfo.am_user_room_basic_info();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.userRoomBasicInfo);
					break;
				case 3:
					if (channel_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_res_enter_channel.channelId cannot be set twice.');
					}
					++channel_id$count;
					this.channelId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 4:
					if (room_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_res_enter_channel.roomId cannot be set twice.');
					}
					++room_id$count;
					this.roomId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 5:
					if (today_expenditure$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_res_enter_channel.todayExpenditure cannot be set twice.');
					}
					++today_expenditure$count;
					this.todayExpenditure = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 6:
					if (enter_at$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_res_enter_channel.enterAt cannot be set twice.');
					}
					++enter_at$count;
					this.enterAt = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 7:
					if (self_ip$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_res_enter_channel.selfIp cannot be set twice.');
					}
					++self_ip$count;
					this.selfIp = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
