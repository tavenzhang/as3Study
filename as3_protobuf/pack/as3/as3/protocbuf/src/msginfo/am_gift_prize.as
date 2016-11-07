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
	public dynamic final class am_gift_prize extends com.netease.protobuf.Message {
		public static const INDEX:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("msginfo.am_gift_prize.index", "index", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var index:int;

		public static const PRIZE_QUOTA:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("msginfo.am_gift_prize.prize_quota", "prizeQuota", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var prizeQuota:int;

		/**
		 *  @private
		 */
		override public final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.index);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.prizeQuota);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override public final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var index$count:uint = 0;
			var prize_quota$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (index$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_gift_prize.index cannot be set twice.');
					}
					++index$count;
					this.index = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (prize_quota$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_gift_prize.prizeQuota cannot be set twice.');
					}
					++prize_quota$count;
					this.prizeQuota = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
