package google.protobuf.UninterpretedOption {
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
	public dynamic final class NamePart extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const NAME_PART:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("google.protobuf.UninterpretedOption.NamePart.name_part", "namePart", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var namePart:String;

		/**
		 *  @private
		 */
		public static const IS_EXTENSION:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("google.protobuf.UninterpretedOption.NamePart.is_extension", "isExtension", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var isExtension:Boolean;

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.namePart);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, this.isExtension);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var name_part$count:uint = 0;
			var is_extension$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (name_part$count != 0) {
						throw new flash.errors.IOError('Bad data format: NamePart.namePart cannot be set twice.');
					}
					++name_part$count;
					this.namePart = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (is_extension$count != 0) {
						throw new flash.errors.IOError('Bad data format: NamePart.isExtension cannot be set twice.');
					}
					++is_extension$count;
					this.isExtension = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
