package google.protobuf {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import flash.utils.ByteArray;
	import google.protobuf.UninterpretedOption.NamePart;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class UninterpretedOption extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const NAME:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("google.protobuf.UninterpretedOption.name", "name", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return google.protobuf.UninterpretedOption.NamePart; });

		[ArrayElementType("google.protobuf.UninterpretedOption.NamePart")]
		public var name:Array = [];

		/**
		 *  @private
		 */
		public static const IDENTIFIER_VALUE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("google.protobuf.UninterpretedOption.identifier_value", "identifierValue", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var identifier_value$field:String;

		public function clearIdentifierValue():void {
			identifier_value$field = null;
		}

		public function get hasIdentifierValue():Boolean {
			return identifier_value$field != null;
		}

		public function set identifierValue(value:String):void {
			identifier_value$field = value;
		}

		public function get identifierValue():String {
			return identifier_value$field;
		}

		/**
		 *  @private
		 */
		public static const POSITIVE_INT_VALUE:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("google.protobuf.UninterpretedOption.positive_int_value", "positiveIntValue", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var positive_int_value$field:UInt64;

		public function clearPositiveIntValue():void {
			positive_int_value$field = null;
		}

		public function get hasPositiveIntValue():Boolean {
			return positive_int_value$field != null;
		}

		public function set positiveIntValue(value:UInt64):void {
			positive_int_value$field = value;
		}

		public function get positiveIntValue():UInt64 {
			return positive_int_value$field;
		}

		/**
		 *  @private
		 */
		public static const NEGATIVE_INT_VALUE:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("google.protobuf.UninterpretedOption.negative_int_value", "negativeIntValue", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var negative_int_value$field:Int64;

		public function clearNegativeIntValue():void {
			negative_int_value$field = null;
		}

		public function get hasNegativeIntValue():Boolean {
			return negative_int_value$field != null;
		}

		public function set negativeIntValue(value:Int64):void {
			negative_int_value$field = value;
		}

		public function get negativeIntValue():Int64 {
			return negative_int_value$field;
		}

		/**
		 *  @private
		 */
		public static const DOUBLE_VALUE:FieldDescriptor$TYPE_DOUBLE = new FieldDescriptor$TYPE_DOUBLE("google.protobuf.UninterpretedOption.double_value", "doubleValue", (6 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		private var double_value$field:Number;

		private var hasField$0:uint = 0;

		public function clearDoubleValue():void {
			hasField$0 &= 0xfffffffe;
			double_value$field = new Number();
		}

		public function get hasDoubleValue():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set doubleValue(value:Number):void {
			hasField$0 |= 0x1;
			double_value$field = value;
		}

		public function get doubleValue():Number {
			return double_value$field;
		}

		/**
		 *  @private
		 */
		public static const STRING_VALUE:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("google.protobuf.UninterpretedOption.string_value", "stringValue", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var string_value$field:flash.utils.ByteArray;

		public function clearStringValue():void {
			string_value$field = null;
		}

		public function get hasStringValue():Boolean {
			return string_value$field != null;
		}

		public function set stringValue(value:flash.utils.ByteArray):void {
			string_value$field = value;
		}

		public function get stringValue():flash.utils.ByteArray {
			return string_value$field;
		}

		/**
		 *  @private
		 */
		public static const AGGREGATE_VALUE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("google.protobuf.UninterpretedOption.aggregate_value", "aggregateValue", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var aggregate_value$field:String;

		public function clearAggregateValue():void {
			aggregate_value$field = null;
		}

		public function get hasAggregateValue():Boolean {
			return aggregate_value$field != null;
		}

		public function set aggregateValue(value:String):void {
			aggregate_value$field = value;
		}

		public function get aggregateValue():String {
			return aggregate_value$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var name$index:uint = 0; name$index < this.name.length; ++name$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.name[name$index]);
			}
			if (hasIdentifierValue) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, identifier_value$field);
			}
			if (hasPositiveIntValue) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, positive_int_value$field);
			}
			if (hasNegativeIntValue) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, negative_int_value$field);
			}
			if (hasDoubleValue) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_DOUBLE(output, double_value$field);
			}
			if (hasStringValue) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_BYTES(output, string_value$field);
			}
			if (hasAggregateValue) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, aggregate_value$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var identifier_value$count:uint = 0;
			var positive_int_value$count:uint = 0;
			var negative_int_value$count:uint = 0;
			var double_value$count:uint = 0;
			var string_value$count:uint = 0;
			var aggregate_value$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 2:
					this.name.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new google.protobuf.UninterpretedOption.NamePart()));
					break;
				case 3:
					if (identifier_value$count != 0) {
						throw new flash.errors.IOError('Bad data format: UninterpretedOption.identifierValue cannot be set twice.');
					}
					++identifier_value$count;
					this.identifierValue = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					if (positive_int_value$count != 0) {
						throw new flash.errors.IOError('Bad data format: UninterpretedOption.positiveIntValue cannot be set twice.');
					}
					++positive_int_value$count;
					this.positiveIntValue = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 5:
					if (negative_int_value$count != 0) {
						throw new flash.errors.IOError('Bad data format: UninterpretedOption.negativeIntValue cannot be set twice.');
					}
					++negative_int_value$count;
					this.negativeIntValue = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 6:
					if (double_value$count != 0) {
						throw new flash.errors.IOError('Bad data format: UninterpretedOption.doubleValue cannot be set twice.');
					}
					++double_value$count;
					this.doubleValue = com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE(input);
					break;
				case 7:
					if (string_value$count != 0) {
						throw new flash.errors.IOError('Bad data format: UninterpretedOption.stringValue cannot be set twice.');
					}
					++string_value$count;
					this.stringValue = com.netease.protobuf.ReadUtils.read$TYPE_BYTES(input);
					break;
				case 8:
					if (aggregate_value$count != 0) {
						throw new flash.errors.IOError('Bad data format: UninterpretedOption.aggregateValue cannot be set twice.');
					}
					++aggregate_value$count;
					this.aggregateValue = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
