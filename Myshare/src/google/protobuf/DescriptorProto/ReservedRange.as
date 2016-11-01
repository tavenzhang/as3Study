package google.protobuf.DescriptorProto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ReservedRange extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const START:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("google.protobuf.DescriptorProto.ReservedRange.start", "start", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var start$field:int;

		private var hasField$0:uint = 0;

		public function clearStart():void {
			hasField$0 &= 0xfffffffe;
			start$field = new int();
		}

		public function get hasStart():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set start(value:int):void {
			hasField$0 |= 0x1;
			start$field = value;
		}

		public function get start():int {
			return start$field;
		}

		/**
		 *  @private
		 */
		public static const END:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("google.protobuf.DescriptorProto.ReservedRange.end", "end", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var end$field:int;

		public function clearEnd():void {
			hasField$0 &= 0xfffffffd;
			end$field = new int();
		}

		public function get hasEnd():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set end(value:int):void {
			hasField$0 |= 0x2;
			end$field = value;
		}

		public function get end():int {
			return end$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasStart) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, start$field);
			}
			if (hasEnd) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, end$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var start$count:uint = 0;
			var end$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (start$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReservedRange.start cannot be set twice.');
					}
					++start$count;
					this.start = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (end$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReservedRange.end cannot be set twice.');
					}
					++end$count;
					this.end = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
