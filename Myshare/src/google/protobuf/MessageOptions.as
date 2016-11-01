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
	public dynamic final class MessageOptions extends com.netease.protobuf.Message {
		[ArrayElementType("Function")]
		public static const extensionReadFunctions:Array = [];

		/**
		 *  @private
		 */
		public static const MESSAGE_SET_WIRE_FORMAT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("google.protobuf.MessageOptions.message_set_wire_format", "messageSetWireFormat", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var message_set_wire_format$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearMessageSetWireFormat():void {
			hasField$0 &= 0xfffffffe;
			message_set_wire_format$field = new Boolean();
		}

		public function get hasMessageSetWireFormat():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set messageSetWireFormat(value:Boolean):void {
			hasField$0 |= 0x1;
			message_set_wire_format$field = value;
		}

		public function get messageSetWireFormat():Boolean {
			if(!hasMessageSetWireFormat) {
				return false;
			}
			return message_set_wire_format$field;
		}

		/**
		 *  @private
		 */
		public static const NO_STANDARD_DESCRIPTOR_ACCESSOR:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("google.protobuf.MessageOptions.no_standard_descriptor_accessor", "noStandardDescriptorAccessor", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var no_standard_descriptor_accessor$field:Boolean;

		public function clearNoStandardDescriptorAccessor():void {
			hasField$0 &= 0xfffffffd;
			no_standard_descriptor_accessor$field = new Boolean();
		}

		public function get hasNoStandardDescriptorAccessor():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set noStandardDescriptorAccessor(value:Boolean):void {
			hasField$0 |= 0x2;
			no_standard_descriptor_accessor$field = value;
		}

		public function get noStandardDescriptorAccessor():Boolean {
			if(!hasNoStandardDescriptorAccessor) {
				return false;
			}
			return no_standard_descriptor_accessor$field;
		}

		/**
		 *  @private
		 */
		public static const DEPRECATED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("google.protobuf.MessageOptions.deprecated", "deprecated", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var deprecated$field:Boolean;

		public function clearDeprecated():void {
			hasField$0 &= 0xfffffffb;
			deprecated$field = new Boolean();
		}

		public function get hasDeprecated():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set deprecated(value:Boolean):void {
			hasField$0 |= 0x4;
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
		public static const MAP_ENTRY:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("google.protobuf.MessageOptions.map_entry", "mapEntry", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var map_entry$field:Boolean;

		public function clearMapEntry():void {
			hasField$0 &= 0xfffffff7;
			map_entry$field = new Boolean();
		}

		public function get hasMapEntry():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set mapEntry(value:Boolean):void {
			hasField$0 |= 0x8;
			map_entry$field = value;
		}

		public function get mapEntry():Boolean {
			return map_entry$field;
		}

		/**
		 *  @private
		 */
		public static const UNINTERPRETED_OPTION:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("google.protobuf.MessageOptions.uninterpreted_option", "uninterpretedOption", (999 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return google.protobuf.UninterpretedOption; });

		[ArrayElementType("google.protobuf.UninterpretedOption")]
		public var uninterpretedOption:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasMessageSetWireFormat) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, message_set_wire_format$field);
			}
			if (hasNoStandardDescriptorAccessor) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, no_standard_descriptor_accessor$field);
			}
			if (hasDeprecated) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, deprecated$field);
			}
			if (hasMapEntry) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, map_entry$field);
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
			var message_set_wire_format$count:uint = 0;
			var no_standard_descriptor_accessor$count:uint = 0;
			var deprecated$count:uint = 0;
			var map_entry$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (message_set_wire_format$count != 0) {
						throw new flash.errors.IOError('Bad data format: MessageOptions.messageSetWireFormat cannot be set twice.');
					}
					++message_set_wire_format$count;
					this.messageSetWireFormat = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 2:
					if (no_standard_descriptor_accessor$count != 0) {
						throw new flash.errors.IOError('Bad data format: MessageOptions.noStandardDescriptorAccessor cannot be set twice.');
					}
					++no_standard_descriptor_accessor$count;
					this.noStandardDescriptorAccessor = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 3:
					if (deprecated$count != 0) {
						throw new flash.errors.IOError('Bad data format: MessageOptions.deprecated cannot be set twice.');
					}
					++deprecated$count;
					this.deprecated = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 7:
					if (map_entry$count != 0) {
						throw new flash.errors.IOError('Bad data format: MessageOptions.mapEntry cannot be set twice.');
					}
					++map_entry$count;
					this.mapEntry = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
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
