package google.protobuf {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import google.protobuf.EnumValueDescriptorProto;
	import google.protobuf.EnumOptions;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class EnumDescriptorProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("google.protobuf.EnumDescriptorProto.name", "name", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var name$field:String;

		public function clearName():void {
			name$field = null;
		}

		public function get hasName():Boolean {
			return name$field != null;
		}

		public function set name(value:String):void {
			name$field = value;
		}

		public function get name():String {
			return name$field;
		}

		/**
		 *  @private
		 */
		public static const VALUE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("google.protobuf.EnumDescriptorProto.value", "value", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return google.protobuf.EnumValueDescriptorProto; });

		[ArrayElementType("google.protobuf.EnumValueDescriptorProto")]
		public var value:Array = [];

		/**
		 *  @private
		 */
		public static const OPTIONS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("google.protobuf.EnumDescriptorProto.options", "options", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return google.protobuf.EnumOptions; });

		private var options$field:google.protobuf.EnumOptions;

		public function clearOptions():void {
			options$field = null;
		}

		public function get hasOptions():Boolean {
			return options$field != null;
		}

		public function set options(value:google.protobuf.EnumOptions):void {
			options$field = value;
		}

		public function get options():google.protobuf.EnumOptions {
			return options$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, name$field);
			}
			for (var value$index:uint = 0; value$index < this.value.length; ++value$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.value[value$index]);
			}
			if (hasOptions) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, options$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var name$count:uint = 0;
			var options$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: EnumDescriptorProto.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					this.value.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new google.protobuf.EnumValueDescriptorProto()));
					break;
				case 3:
					if (options$count != 0) {
						throw new flash.errors.IOError('Bad data format: EnumDescriptorProto.options cannot be set twice.');
					}
					++options$count;
					this.options = new google.protobuf.EnumOptions();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.options);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
