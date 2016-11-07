package msginfo {
	import com.netease.protobuf.*;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import msginfo.am_gift_prize;
	import msginfo.am_user_draw_info;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class am_notify_give_gift extends com.netease.protobuf.Message {
		public static const USER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("msginfo.am_notify_give_gift.user", "user", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, msginfo.am_user_draw_info);

		public var user:msginfo.am_user_draw_info;

		public static const ON_USER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("msginfo.am_notify_give_gift.on_user", "onUser", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, msginfo.am_user_draw_info);

		public var onUser:msginfo.am_user_draw_info;

		public static const GIFT_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("msginfo.am_notify_give_gift.gift_id", "giftId", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		public var giftId:int;

		public static const GIFT_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("msginfo.am_notify_give_gift.gift_count", "giftCount", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		public var giftCount:int;

		public static const PRIZE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("msginfo.am_notify_give_gift.prize", "prize", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, msginfo.am_gift_prize);

		[ArrayElementType("msginfo.am_gift_prize")]
		public var prize:Array = [];

		/**
		 *  @private
		 */
		override public final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.user);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.onUser);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.giftId);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.giftCount);
			for (var prize$index:uint = 0; prize$index < this.prize.length; ++prize$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.prize[prize$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override public final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var user$count:uint = 0;
			var on_user$count:uint = 0;
			var gift_id$count:uint = 0;
			var gift_count$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (user$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_notify_give_gift.user cannot be set twice.');
					}
					++user$count;
					this.user = new msginfo.am_user_draw_info();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.user);
					break;
				case 2:
					if (on_user$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_notify_give_gift.onUser cannot be set twice.');
					}
					++on_user$count;
					this.onUser = new msginfo.am_user_draw_info();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.onUser);
					break;
				case 3:
					if (gift_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_notify_give_gift.giftId cannot be set twice.');
					}
					++gift_id$count;
					this.giftId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (gift_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_notify_give_gift.giftCount cannot be set twice.');
					}
					++gift_count$count;
					this.giftCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					this.prize.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new msginfo.am_gift_prize()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
