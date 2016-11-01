package google.protobuf {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import google.protobuf.UninterpretedOption;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class EnumValueOptions extends com.netease.protobuf.Message {
		[ArrayElementType("Function")]
		public static const extensionReadFunctions:Array = [];

		/**
		 *  @private
		 */
		public static const DEPRECATED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("google.protobuf.EnumValueOptions.deprecated", "deprecated", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var deprecated$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearDeprecated():void {
			hasField$0 &= 0xfffffffe;
			deprecated$field = new Boolean();
		}

		public function get hasDeprecated():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set deprecated(value:Boolean):void {
			hasField$0 |= 0x1;
			deprecated$field = value;
		}

		public function get deprecated():Boolean {
			if(!hasDeprecated) {
				return false;
			}
			return deprecated$field;
		}

		/**
		 *  @private
		 */
		public static const UNINTERPRETED_OPTION:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("google.protobuf.EnumValueOptions.uninterpreted_option", "uninterpretedOption", (999 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return google.protobuf.UninterpretedOption; });

		[ArrayElementType("google.protobuf.UninterpretedOption")]
		public var uninterpretedOption:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasDeprecated) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, deprecated$field);
			}
			for (var uninterpretedOption$index:uint = 0; uninterpretedOption$index < this.uninterpretedOption.length; ++uninterpretedOption$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 999);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.uninterpretedOption[uninterpretedOption$index]);
			}
			for (var fieldKey:* in this) {
				super.writeExtensionOrUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var deprecated$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (deprecated$count != 0) {
						throw new flash.errors.IOError('Bad data format: EnumValueOptions.deprecated cannot be set twice.');
					}
					++deprecated$count;
					this.deprecated = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 999:
					this.uninterpretedOption.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new google.protobuf.UninterpretedOption()));
					break;
				default:
					super.readExtensionOrUnknown(extensionReadFunctions, input, tag);
					break;
				}
			}
		}

	}
}
