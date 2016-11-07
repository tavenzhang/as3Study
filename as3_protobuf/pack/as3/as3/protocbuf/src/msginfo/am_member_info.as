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
	public dynamic final class am_member_info extends com.netease.protobuf.Message {
		public static const EXPIRED_AT:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("msginfo.am_member_info.expired_at", "expiredAt", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var expired_at$field:UInt64;

		public function clearExpiredAt():void {
			expired_at$field = null;
		}

		public function get hasExpiredAt():Boolean {
			return expired_at$field != null;
		}

		public function set expiredAt(value:UInt64):void {
			expired_at$field = value;
		}

		public function get expiredAt():UInt64 {
			if(!hasExpiredAt) {
				return new UInt64(0, 0);
			}
			return expired_at$field;
		}

		public static const EXPIRED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("msginfo.am_member_info.expired", "expired", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var expired$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearExpired():void {
			hasField$0 &= 0xfffffffe;
			expired$field = new Boolean();
		}

		public function get hasExpired():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set expired(value:Boolean):void {
			hasField$0 |= 0x1;
			expired$field = value;
		}

		public function get expired():Boolean {
			if(!hasExpired) {
				return true;
			}
			return expired$field;
		}

		public static const SCORE:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("msginfo.am_member_info.score", "score", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var score$field:UInt64;

		public function clearScore():void {
			score$field = null;
		}

		public function get hasScore():Boolean {
			return score$field != null;
		}

		public function set score(value:UInt64):void {
			score$field = value;
		}

		public function get score():UInt64 {
			if(!hasScore) {
				return new UInt64(0, 0);
			}
			return score$field;
		}

		/**
		 *  @private
		 */
		override public final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasExpiredAt) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, expired_at$field);
			}
			if (hasExpired) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, expired$field);
			}
			if (hasScore) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, score$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override public final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var expired_at$count:uint = 0;
			var expired$count:uint = 0;
			var score$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (expired_at$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_member_info.expiredAt cannot be set twice.');
					}
					++expired_at$count;
					this.expiredAt = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 2:
					if (expired$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_member_info.expired cannot be set twice.');
					}
					++expired$count;
					this.expired = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 3:
					if (score$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_member_info.score cannot be set twice.');
					}
					++score$count;
					this.score = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
