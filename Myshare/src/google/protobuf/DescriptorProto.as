package google.protobuf {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import google.protobuf.DescriptorProto;
	import google.protobuf.DescriptorProto.ExtensionRange;
	import google.protobuf.FieldDescriptorProto;
	import google.protobuf.MessageOptions;
	import google.protobuf.DescriptorProto.ReservedRange;
	import google.protobuf.EnumDescriptorProto;
	import google.protobuf.OneofDescriptorProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class DescriptorProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("google.protobuf.DescriptorProto.name", "name", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const FIELD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("google.protobuf.DescriptorProto.field", "field", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return google.protobuf.FieldDescriptorProto; });

		[ArrayElementType("google.protobuf.FieldDescriptorProto")]
		public var field:Array = [];

		/**
		 *  @private
		 */
		public static const EXTENSION:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("google.protobuf.DescriptorProto.extension", "extension", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return google.protobuf.FieldDescriptorProto; });

		[ArrayElementType("google.protobuf.FieldDescriptorProto")]
		public var extension:Array = [];

		/**
		 *  @private
		 */
		public static const NESTED_TYPE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("google.protobuf.DescriptorProto.nested_type", "nestedType", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return DescriptorProto; });

		[ArrayElementType("DescriptorProto")]
		public var nestedType:Array = [];

		/**
		 *  @private
		 */
		public static const ENUM_TYPE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("google.protobuf.DescriptorProto.enum_type", "enumType", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return google.protobuf.EnumDescriptorProto; });

		[ArrayElementType("google.protobuf.EnumDescriptorProto")]
		public var enumType:Array = [];

		/**
		 *  @private
		 */
		public static const EXTENSION_RANGE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("google.protobuf.DescriptorProto.extension_range", "extensionRange", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return google.protobuf.DescriptorProto.ExtensionRange; });

		[ArrayElementType("google.protobuf.DescriptorProto.ExtensionRange")]
		public var extensionRange:Array = [];

		/**
		 *  @private
		 */
		public static const ONEOF_DECL:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("google.protobuf.DescriptorProto.oneof_decl", "oneofDecl", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return google.protobuf.OneofDescriptorProto; });

		[ArrayElementType("google.protobuf.OneofDescriptorProto")]
		public var oneofDecl:Array = [];

		/**
		 *  @private
		 */
		public static const OPTIONS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("google.protobuf.DescriptorProto.options", "options", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return google.protobuf.MessageOptions; });

		private var options$field:google.protobuf.MessageOptions;

		public function clearOptions():void {
			options$field = null;
		}

		public function get hasOptions():Boolean {
			return options$field != null;
		}

		public function set options(value:google.protobuf.MessageOptions):void {
			options$field = value;
		}

		public function get options():google.protobuf.MessageOptions {
			return options$field;
		}

		/**
		 *  @private
		 */
		public static const RESERVED_RANGE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("google.protobuf.DescriptorProto.reserved_range", "reservedRange", (9 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return google.protobuf.DescriptorProto.ReservedRange; });

		[ArrayElementType("google.protobuf.DescriptorProto.ReservedRange")]
		public var reservedRange:Array = [];

		/**
		 *  @private
		 */
		public static const RESERVED_NAME:RepeatedFieldDescriptor$TYPE_STRING = new RepeatedFieldDescriptor$TYPE_STRING("google.protobuf.DescriptorProto.reserved_name", "reservedName", (10 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		[ArrayElementType("String")]
		public var reservedName:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, name$field);
			}
			for (var field$index:uint = 0; field$index < this.field.length; ++field$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.field[field$index]);
			}
			for (var extension$index:uint = 0; extension$index < this.extension.length; ++extension$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.extension[extension$index]);
			}
			for (var nestedType$index:uint = 0; nestedType$index < this.nestedType.length; ++nestedType$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.nestedType[nestedType$index]);
			}
			for (var enumType$index:uint = 0; enumType$index < this.enumType.length; ++enumType$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.enumType[enumType$index]);
			}
			for (var extensionRange$index:uint = 0; extensionRange$index < this.extensionRange.length; ++extensionRange$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.extensionRange[extensionRange$index]);
			}
			for (var oneofDecl$index:uint = 0; oneofDecl$index < this.oneofDecl.length; ++oneofDecl$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.oneofDecl[oneofDecl$index]);
			}
			if (hasOptions) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, options$field);
			}
			for (var reservedRange$index:uint = 0; reservedRange$index < this.reservedRange.length; ++reservedRange$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.reservedRange[reservedRange$index]);
			}
			for (var reservedName$index:uint = 0; reservedName$index < this.reservedName.length; ++reservedName$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.reservedName[reservedName$index]);
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
						throw new flash.errors.IOError('Bad data format: DescriptorProto.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					this.field.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new google.protobuf.FieldDescriptorProto()));
					break;
				case 6:
					this.extension.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new google.protobuf.FieldDescriptorProto()));
					break;
				case 3:
					this.nestedType.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new DescriptorProto()));
					break;
				case 4:
					this.enumType.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new google.protobuf.EnumDescriptorProto()));
					break;
				case 5:
					this.extensionRange.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new google.protobuf.DescriptorProto.ExtensionRange()));
					break;
				case 8:
					this.oneofDecl.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new google.protobuf.OneofDescriptorProto()));
					break;
				case 7:
					if (options$count != 0) {
						throw new flash.errors.IOError('Bad data format: DescriptorProto.options cannot be set twice.');
					}
					++options$count;
					this.options = new google.protobuf.MessageOptions();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.options);
					break;
				case 9:
					this.reservedRange.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new google.protobuf.DescriptorProto.ReservedRange()));
					break;
				case 10:
					this.reservedName.push(com.netease.protobuf.ReadUtils.read$TYPE_STRING(input));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
