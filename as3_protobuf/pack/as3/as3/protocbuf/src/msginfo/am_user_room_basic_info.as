package msginfo {
	import com.netease.protobuf.*;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import msginfo.am_room_rank_type;
	import msginfo.am_user_type_and_id;
	import msginfo.am_user_platform_info;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class am_user_room_basic_info extends com.netease.protobuf.Message {
		public static const USER_ID:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("msginfo.am_user_room_basic_info.user_id", "userId", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, msginfo.am_user_type_and_id);

		private var user_id$field:msginfo.am_user_type_and_id;

		public function clearUserId():void {
			user_id$field = null;
		}

		public function get hasUserId():Boolean {
			return user_id$field != null;
		}

		public function set userId(value:msginfo.am_user_type_and_id):void {
			user_id$field = value;
		}

		public function get userId():msginfo.am_user_type_and_id {
			return user_id$field;
		}

		public static const USER_PLATFORM_INFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("msginfo.am_user_room_basic_info.user_platform_info", "userPlatformInfo", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, msginfo.am_user_platform_info);

		private var user_platform_info$field:msginfo.am_user_platform_info;

		public function clearUserPlatformInfo():void {
			user_platform_info$field = null;
		}

		public function get hasUserPlatformInfo():Boolean {
			return user_platform_info$field != null;
		}

		public function set userPlatformInfo(value:msginfo.am_user_platform_info):void {
			user_platform_info$field = value;
		}

		public function get userPlatformInfo():msginfo.am_user_platform_info {
			return user_platform_info$field;
		}

		public static const ROOM_RANK:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("msginfo.am_user_room_basic_info.room_rank", "roomRank", (3 << 3) | com.netease.protobuf.WireType.VARINT, msginfo.am_room_rank_type);

		private var room_rank$field:int;

		private var hasField$0:uint = 0;

		public function clearRoomRank():void {
			hasField$0 &= 0xfffffffe;
			room_rank$field = new int();
		}

		public function get hasRoomRank():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set roomRank(value:int):void {
			hasField$0 |= 0x1;
			room_rank$field = value;
		}

		public function get roomRank():int {
			if(!hasRoomRank) {
				return msginfo.am_room_rank_type.rrt_guest;
			}
			return room_rank$field;
		}

		public static const TEXTING_FORBIDDEN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("msginfo.am_user_room_basic_info.texting_forbidden", "textingForbidden", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var texting_forbidden$field:Boolean;

		public function clearTextingForbidden():void {
			hasField$0 &= 0xfffffffd;
			texting_forbidden$field = new Boolean();
		}

		public function get hasTextingForbidden():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set textingForbidden(value:Boolean):void {
			hasField$0 |= 0x2;
			texting_forbidden$field = value;
		}

		public function get textingForbidden():Boolean {
			return texting_forbidden$field;
		}

		public static const SPEECH_FORBIDDEN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("msginfo.am_user_room_basic_info.speech_forbidden", "speechForbidden", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var speech_forbidden$field:Boolean;

		public function clearSpeechForbidden():void {
			hasField$0 &= 0xfffffffb;
			speech_forbidden$field = new Boolean();
		}

		public function get hasSpeechForbidden():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set speechForbidden(value:Boolean):void {
			hasField$0 |= 0x4;
			speech_forbidden$field = value;
		}

		public function get speechForbidden():Boolean {
			return speech_forbidden$field;
		}

		/**
		 *  @private
		 */
		override public final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasUserId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, user_id$field);
			}
			if (hasUserPlatformInfo) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, user_platform_info$field);
			}
			if (hasRoomRank) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, room_rank$field);
			}
			if (hasTextingForbidden) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, texting_forbidden$field);
			}
			if (hasSpeechForbidden) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, speech_forbidden$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override public final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var user_id$count:uint = 0;
			var user_platform_info$count:uint = 0;
			var room_rank$count:uint = 0;
			var texting_forbidden$count:uint = 0;
			var speech_forbidden$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (user_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_user_room_basic_info.userId cannot be set twice.');
					}
					++user_id$count;
					this.userId = new msginfo.am_user_type_and_id();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.userId);
					break;
				case 2:
					if (user_platform_info$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_user_room_basic_info.userPlatformInfo cannot be set twice.');
					}
					++user_platform_info$count;
					this.userPlatformInfo = new msginfo.am_user_platform_info();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.userPlatformInfo);
					break;
				case 3:
					if (room_rank$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_user_room_basic_info.roomRank cannot be set twice.');
					}
					++room_rank$count;
					this.roomRank = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 4:
					if (texting_forbidden$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_user_room_basic_info.textingForbidden cannot be set twice.');
					}
					++texting_forbidden$count;
					this.textingForbidden = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 5:
					if (speech_forbidden$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_user_room_basic_info.speechForbidden cannot be set twice.');
					}
					++speech_forbidden$count;
					this.speechForbidden = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
