package msginfo {
	import com.netease.protobuf.*;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import msginfo.am_sex_type;
	import msginfo.am_room_rank_type;
	import flash.utils.ByteArray;
	import msginfo.am_user_type_and_id;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class am_user_draw_info extends com.netease.protobuf.Message {
		public static const USER_ID:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("msginfo.am_user_draw_info.user_id", "userId", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, msginfo.am_user_type_and_id);

		public var userId:msginfo.am_user_type_and_id;

		public static const NICKNAME:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("msginfo.am_user_draw_info.nickname", "nickname", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var nickname$field:flash.utils.ByteArray;

		public function clearNickname():void {
			nickname$field = null;
		}

		public function get hasNickname():Boolean {
			return nickname$field != null;
		}

		public function set nickname(value:flash.utils.ByteArray):void {
			nickname$field = value;
		}

		public function get nickname():flash.utils.ByteArray {
			if(!hasNickname) {
				return stringToByteArray("");
			}
			return nickname$field;
		}

		public static const SEX:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("msginfo.am_user_draw_info.sex", "sex", (3 << 3) | com.netease.protobuf.WireType.VARINT, msginfo.am_sex_type);

		private var sex$field:int;

		private var hasField$0:uint = 0;

		public function clearSex():void {
			hasField$0 &= 0xfffffffe;
			sex$field = new int();
		}

		public function get hasSex():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set sex(value:int):void {
			hasField$0 |= 0x1;
			sex$field = value;
		}

		public function get sex():int {
			if(!hasSex) {
				return msginfo.am_sex_type.ast_secret;
			}
			return sex$field;
		}

		public static const ROOM_RANK:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("msginfo.am_user_draw_info.room_rank", "roomRank", (4 << 3) | com.netease.protobuf.WireType.VARINT, msginfo.am_room_rank_type);

		private var room_rank$field:int;

		public function clearRoomRank():void {
			hasField$0 &= 0xfffffffd;
			room_rank$field = new int();
		}

		public function get hasRoomRank():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set roomRank(value:int):void {
			hasField$0 |= 0x2;
			room_rank$field = value;
		}

		public function get roomRank():int {
			if(!hasRoomRank) {
				return msginfo.am_room_rank_type.rrt_guest;
			}
			return room_rank$field;
		}

		/**
		 *  @private
		 */
		override public final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.userId);
			if (hasNickname) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_BYTES(output, nickname$field);
			}
			if (hasSex) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, sex$field);
			}
			if (hasRoomRank) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, room_rank$field);
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
			var nickname$count:uint = 0;
			var sex$count:uint = 0;
			var room_rank$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (user_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_user_draw_info.userId cannot be set twice.');
					}
					++user_id$count;
					this.userId = new msginfo.am_user_type_and_id();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.userId);
					break;
				case 2:
					if (nickname$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_user_draw_info.nickname cannot be set twice.');
					}
					++nickname$count;
					this.nickname = com.netease.protobuf.ReadUtils.read$TYPE_BYTES(input);
					break;
				case 3:
					if (sex$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_user_draw_info.sex cannot be set twice.');
					}
					++sex$count;
					this.sex = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 4:
					if (room_rank$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_user_draw_info.roomRank cannot be set twice.');
					}
					++room_rank$count;
					this.roomRank = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
