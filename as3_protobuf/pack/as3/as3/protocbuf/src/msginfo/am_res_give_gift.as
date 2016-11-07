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
	public dynamic final class am_res_give_gift extends com.netease.protobuf.Message {
		public static const ERROR_CODE:FieldDescriptor$TYPE_SINT32 = new FieldDescriptor$TYPE_SINT32("msginfo.am_res_give_gift.error_code", "errorCode", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var errorCode:int;

		public static const MONEY:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("msginfo.am_res_give_gift.money", "money", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var money$field:Int64;

		public function clearMoney():void {
			money$field = null;
		}

		public function get hasMoney():Boolean {
			return money$field != null;
		}

		public function set money(value:Int64):void {
			money$field = value;
		}

		public function get money():Int64 {
			return money$field;
		}

		/**
		 *  @private
		 */
		override public final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_SINT32(output, this.errorCode);
			if (hasMoney) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, money$field);
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
			var money$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (error_code$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_res_give_gift.errorCode cannot be set twice.');
					}
					++error_code$count;
					this.errorCode = com.netease.protobuf.ReadUtils.read$TYPE_SINT32(input);
					break;
				case 2:
					if (money$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_res_give_gift.money cannot be set twice.');
					}
					++money$count;
					this.money = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
