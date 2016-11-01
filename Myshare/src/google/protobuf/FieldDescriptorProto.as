package google.protobuf {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import google.protobuf.FieldDescriptorProto.Label;
	import google.protobuf.FieldOptions;
	import google.protobuf.FieldDescriptorProto.Type;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class FieldDescriptorProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("google.protobuf.FieldDescriptorProto.name", "name", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const NUMBER:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("google.protobuf.FieldDescriptorProto.number", "number", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var number$field:int;

		private var hasField$0:uint = 0;

		public function clearNumber():void {
			hasField$0 &= 0xfffffffe;
			number$field = new int();
		}

		public function get hasNumber():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set number(value:int):void {
			hasField$0 |= 0x1;
			number$field = value;
		}

		public function get number():int {
			return number$field;
		}

		/**
		 *  @private
		 */
		public static const LABEL:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("google.protobuf.FieldDescriptorProto.label", "label", (4 << 3) | com.netease.protobuf.WireType.VARINT, google.protobuf.FieldDescriptorProto.Label);

		private var label$field:int;

		public function clearLabel():void {
			hasField$0 &= 0xfffffffd;
			label$field = new int();
		}

		public function get hasLabel():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set label(value:int):void {
			hasField$0 |= 0x2;
			label$field = value;
		}

		public function get label():int {
			return label$field;
		}

		/**
		 *  @private
		 */
		public static const TYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("google.protobuf.FieldDescriptorProto.type", "type", (5 << 3) | com.netease.protobuf.WireType.VARINT, google.protobuf.FieldDescriptorProto.Type);

		private var type$field:int;

		public function clearType():void {
			hasField$0 &= 0xfffffffb;
			type$field = new int();
		}

		public function get hasType():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set type(value:int):void {
			hasField$0 |= 0x4;
			type$field = value;
		}

		public function get type():int {
			return type$field;
		}

		/**
		 *  @private
		 */
		public static const TYPE_NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("google.protobuf.FieldDescriptorProto.type_name", "typeName", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var type_name$field:String;

		public function clearTypeName():void {
			type_name$field = null;
		}

		public function get hasTypeName():Boolean {
			return type_name$field != null;
		}

		public function set typeName(value:String):void {
			type_name$field = value;
		}

		public function get typeName():String {
			return type_name$field;
		}

		/**
		 *  @private
		 */
		public static const EXTENDEE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("google.protobuf.FieldDescriptorProto.extendee", "extendee", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var extendee$field:String;

		public function clearExtendee():void {
			extendee$field = null;
		}

		public function get hasExtendee():Boolean {
			return extendee$field != null;
		}

		public function set extendee(value:String):void {
			extendee$field = value;
		}

		public function get extendee():String {
			return extendee$field;
		}

		/**
		 *  @private
		 */
		public static const DEFAULT_VALUE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("google.protobuf.FieldDescriptorProto.default_value", "defaultValue", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var default_value$field:String;

		public function clearDefaultValue():void {
			default_value$field = null;
		}

		public function get hasDefaultValue():Boolean {
			return default_value$field != null;
		}

		public function set defaultValue(value:String):void {
			default_value$field = value;
		}

		public function get defaultValue():String {
			return default_value$field;
		}

		/**
		 *  @private
		 */
		public static const ONEOF_INDEX:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("google.protobuf.FieldDescriptorProto.oneof_index", "oneofIndex", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var oneof_index$field:int;

		public function clearOneofIndex():void {
			hasField$0 &= 0xfffffff7;
			oneof_index$field = new int();
		}

		public function get hasOneofIndex():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set oneofIndex(value:int):void {
			hasField$0 |= 0x8;
			oneof_index$field = value;
		}

		public function get oneofIndex():int {
			return oneof_index$field;
		}

		/**
		 *  @private
		 */
		public static const OPTIONS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("google.protobuf.FieldDescriptorProto.options", "options", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return google.protobuf.FieldOptions; });

		private var options$field:google.protobuf.FieldOptions;

		public function clearOptions():void {
			options$field = null;
		}

		public function get hasOptions():Boolean {
			return options$field != null;
		}

		public function set options(value:google.protobuf.FieldOptions):void {
			options$field = value;
		}

		public function get options():google.protobuf.FieldOptions {
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
			if (hasNumber) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, number$field);
			}
			if (hasLabel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, label$field);
			}
			if (hasType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, type$field);
			}
			if (hasTypeName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, type_name$field);
			}
			if (hasExtendee) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, extendee$field);
			}
			if (hasDefaultValue) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, default_value$field);
			}
			if (hasOneofIndex) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, oneof_index$field);
			}
			if (hasOptions) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
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
			var number$count:uint = 0;
			var label$count:uint = 0;
			var type$count:uint = 0;
			var type_name$count:uint = 0;
			var extendee$count:uint = 0;
			var default_value$count:uint = 0;
			var oneof_index$count:uint = 0;
			var options$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: FieldDescriptorProto.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (number$count != 0) {
						throw new flash.errors.IOError('Bad data format: FieldDescriptorProto.number cannot be set twice.');
					}
					++number$count;
					this.number = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (label$count != 0) {
						throw new flash.errors.IOError('Bad data format: FieldDescriptorProto.label cannot be set twice.');
					}
					++label$count;
					this.label = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 5:
					if (type$count != 0) {
						throw new flash.errors.IOError('Bad data format: FieldDescriptorProto.type cannot be set twice.');
					}
					++type$count;
					this.type = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 6:
					if (type_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: FieldDescriptorProto.typeName cannot be set twice.');
					}
					++type_name$count;
					this.typeName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (extendee$count != 0) {
						throw new flash.errors.IOError('Bad data format: FieldDescriptorProto.extendee cannot be set twice.');
					}
					++extendee$count;
					this.extendee = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 7:
					if (default_value$count != 0) {
						throw new flash.errors.IOError('Bad data format: FieldDescriptorProto.defaultValue cannot be set twice.');
					}
					++default_value$count;
					this.defaultValue = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 9:
					if (oneof_index$count != 0) {
						throw new flash.errors.IOError('Bad data format: FieldDescriptorProto.oneofIndex cannot be set twice.');
					}
					++oneof_index$count;
					this.oneofIndex = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 8:
					if (options$count != 0) {
						throw new flash.errors.IOError('Bad data format: FieldDescriptorProto.options cannot be set twice.');
					}
					++options$count;
					this.options = new google.protobuf.FieldOptions();
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
