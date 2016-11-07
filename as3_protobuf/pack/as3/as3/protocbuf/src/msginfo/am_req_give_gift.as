package msginfo {
	import com.netease.protobuf.*;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import flash.utils.ByteArray;
	import msginfo.am_user_type_and_id;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class am_req_give_gift extends com.netease.protobuf.Message {
		public static const GIFT_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("msginfo.am_req_give_gift.gift_id", "giftId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var giftId:int;

		public static const GIFT_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("msginfo.am_req_give_gift.gift_count", "giftCount", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var giftCount:int;

		public static const ON_USER_ID:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("msginfo.am_req_give_gift.on_user_id", "onUserId", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, msginfo.am_user_type_and_id);

		public var onUserId:msginfo.am_user_type_and_id;

		public static const GIFT_VERSION:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("msginfo.am_req_give_gift.gift_version", "giftVersion", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var giftVersion:flash.utils.ByteArray;

		/**
		 *  @private
		 */
		override public final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.giftId);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.giftCount);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
			com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.onUserId);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
			com.netease.protobuf.WriteUtils.write$TYPE_BYTES(output, this.giftVersion);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override public final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var gift_id$count:uint = 0;
			var gift_count$count:uint = 0;
			var on_user_id$count:uint = 0;
			var gift_version$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (gift_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_req_give_gift.giftId cannot be set twice.');
					}
					++gift_id$count;
					this.giftId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (gift_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_req_give_gift.giftCount cannot be set twice.');
					}
					++gift_count$count;
					this.giftCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (on_user_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_req_give_gift.onUserId cannot be set twice.');
					}
					++on_user_id$count;
					this.onUserId = new msginfo.am_user_type_and_id();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.onUserId);
					break;
				case 4:
					if (gift_version$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_req_give_gift.giftVersion cannot be set twice.');
					}
					++gift_version$count;
					this.giftVersion = com.netease.protobuf.ReadUtils.read$TYPE_BYTES(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
