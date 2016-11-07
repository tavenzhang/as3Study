package msginfo {
	import com.netease.protobuf.*;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import msginfo.am_user_type_and_id;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class am_user_extend_info extends com.netease.protobuf.Message {
		public static const USER_ID:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("msginfo.am_user_extend_info.user_id", "userId", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, msginfo.am_user_type_and_id);

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

		public static const VERSION:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("msginfo.am_user_extend_info.version", "version", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var version$field:UInt64;

		public function clearVersion():void {
			version$field = null;
		}

		public function get hasVersion():Boolean {
			return version$field != null;
		}

		public function set version(value:UInt64):void {
			version$field = value;
		}

		public function get version():UInt64 {
			return version$field;
		}

		public static const REGTIME:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("msginfo.am_user_extend_info.regtime", "regtime", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var regtime$field:UInt64;

		public function clearRegtime():void {
			regtime$field = null;
		}

		public function get hasRegtime():Boolean {
			return regtime$field != null;
		}

		public function set regtime(value:UInt64):void {
			regtime$field = value;
		}

		public function get regtime():UInt64 {
			return regtime$field;
		}

		public static const REGIP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("msginfo.am_user_extend_info.regip", "regip", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var regip$field:uint;

		private var hasField$0:uint = 0;

		public function clearRegip():void {
			hasField$0 &= 0xfffffffe;
			regip$field = new uint();
		}

		public function get hasRegip():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set regip(value:uint):void {
			hasField$0 |= 0x1;
			regip$field = value;
		}

		public function get regip():uint {
			return regip$field;
		}

		public static const FEATURED_GAME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("msginfo.am_user_extend_info.featured_game", "featuredGame", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var featured_game$field:uint;

		public function clearFeaturedGame():void {
			hasField$0 &= 0xfffffffd;
			featured_game$field = new uint();
		}

		public function get hasFeaturedGame():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set featuredGame(value:uint):void {
			hasField$0 |= 0x2;
			featured_game$field = value;
		}

		public function get featuredGame():uint {
			return featured_game$field;
		}

		/**
		 *  @private
		 */
		override public final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasUserId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, user_id$field);
			}
			if (hasVersion) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, version$field);
			}
			if (hasRegtime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, regtime$field);
			}
			if (hasRegip) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, regip$field);
			}
			if (hasFeaturedGame) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, featured_game$field);
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
			var version$count:uint = 0;
			var regtime$count:uint = 0;
			var regip$count:uint = 0;
			var featured_game$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (user_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_user_extend_info.userId cannot be set twice.');
					}
					++user_id$count;
					this.userId = new msginfo.am_user_type_and_id();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.userId);
					break;
				case 2:
					if (version$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_user_extend_info.version cannot be set twice.');
					}
					++version$count;
					this.version = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 3:
					if (regtime$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_user_extend_info.regtime cannot be set twice.');
					}
					++regtime$count;
					this.regtime = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 4:
					if (regip$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_user_extend_info.regip cannot be set twice.');
					}
					++regip$count;
					this.regip = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 5:
					if (featured_game$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_user_extend_info.featuredGame cannot be set twice.');
					}
					++featured_game$count;
					this.featuredGame = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
