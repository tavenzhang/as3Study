package google.protobuf {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import google.protobuf.FieldOptions.JSType;
	import google.protobuf.UninterpretedOption;
	import google.protobuf.FieldOptions.CType;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class FieldOptions extends com.netease.protobuf.Message {
		[ArrayElementType("Function")]
		public static const extensionReadFunctions:Array = [];

		/**
		 *  @private
		 */
		public static const CTYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("google.protobuf.FieldOptions.ctype", "ctype", (1 << 3) | com.netease.protobuf.WireType.VARINT, google.protobuf.FieldOptions.CType);

		private var ctype$field:int;

		private var hasField$0:uint = 0;

		public function clearCtype():void {
			hasField$0 &= 0xfffffffe;
			ctype$field = new int();
		}

		public function get hasCtype():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set ctype(value:int):void {
			hasField$0 |= 0x1;
			ctype$field = value;
		}

		public function get ctype():int {
			if(!hasCtype) {
				return google.protobuf.FieldOptions.CType.STRING;
			}
			return ctype$field;
		}

		/**
		 *  @private
		 */
		public static const PACKED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("google.protobuf.FieldOptions.packed", "packed", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var packed$field:Boolean;

		public function clearPacked():void {
			hasField$0 &= 0xfffffffd;
			packed$field = new Boolean();
		}

		public function get hasPacked():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set packed(value:Boolean):void {
			hasField$0 |= 0x2;
			packed$field = value;
		}

		public function get packed():Boolean {
			return packed$field;
		}

		/**
		 *  @private
		 */
		public static const JSTYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("google.protobuf.FieldOptions.jstype", "jstype", (6 << 3) | com.netease.protobuf.WireType.VARINT, google.protobuf.FieldOptions.JSType);

		private var jstype$field:int;

		public function clearJstype():void {
			hasField$0 &= 0xfffffffb;
			jstype$field = new int();
		}

		public function get hasJstype():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set jstype(value:int):void {
			hasField$0 |= 0x4;
			jstype$field = value;
		}

		public function get jstype():int {
			if(!hasJstype) {
				return google.protobuf.FieldOptions.JSType.JS_NORMAL;
			}
			return jstype$field;
		}

		/**
		 *  @private
		 */
		public static const LAZY:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("google.protobuf.FieldOptions.lazy", "lazy", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var lazy$field:Boolean;

		public function clearLazy():void {
			hasField$0 &= 0xfffffff7;
			lazy$field = new Boolean();
		}

		public function get hasLazy():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set lazy(value:Boolean):void {
			hasField$0 |= 0x8;
			lazy$field = value;
		}

		public function get lazy():Boolean {
			if(!hasLazy) {
				return false;
			}
			return lazy$field;
		}

		/**
		 *  @private
		 */
		public static const DEPRECATED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("google.protobuf.FieldOptions.deprecated", "deprecated", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var deprecated$field:Boolean;

		public function clearDeprecated():void {
			hasField$0 &= 0xffffffef;
			deprecated$field = new Boolean();
		}

		public function get hasDeprecated():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set deprecated(value:Boolean):void {
			hasField$0 |= 0x10;
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
		public static const WEAK:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("google.protobuf.FieldOptions.weak", "weak", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var weak$field:Boolean;

		public function clearWeak():void {
			hasField$0 &= 0xffffffdf;
			weak$field = new Boolean();
		}

		public function get hasWeak():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set weak(value:Boolean):void {
			hasField$0 |= 0x20;
			weak$field = value;
		}

		public function get weak():Boolean {
			if(!hasWeak) {
				return false;
			}
			return weak$field;
		}

		/**
		 *  @private
		 */
		public static const UNINTERPRETED_OPTION:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("google.protobuf.FieldOptions.uninterpreted_option", "uninterpretedOption", (999 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return google.protobuf.UninterpretedOption; });

		[ArrayElementType("google.protobuf.UninterpretedOption")]
		public var uninterpretedOption:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasCtype) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, ctype$field);
			}
			if (hasPacked) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, packed$field);
			}
			if (hasJstype) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, jstype$field);
			}
			if (hasLazy) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, lazy$field);
			}
			if (hasDeprecated) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, deprecated$field);
			}
			if (hasWeak) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, weak$field);
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
			var ctype$count:uint = 0;
			var packed$count:uint = 0;
			var jstype$count:uint = 0;
			var lazy$count:uint = 0;
			var deprecated$count:uint = 0;
			var weak$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (ctype$count != 0) {
						throw new flash.errors.IOError('Bad data format: FieldOptions.ctype cannot be set twice.');
					}
					++ctype$count;
					this.ctype = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 2:
					if (packed$count != 0) {
						throw new flash.errors.IOError('Bad data format: FieldOptions.packed cannot be set twice.');
					}
					++packed$count;
					this.packed = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 6:
					if (jstype$count != 0) {
						throw new flash.errors.IOError('Bad data format: FieldOptions.jstype cannot be set twice.');
					}
					++jstype$count;
					this.jstype = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 5:
					if (lazy$count != 0) {
						throw new flash.errors.IOError('Bad data format: FieldOptions.lazy cannot be set twice.');
					}
					++lazy$count;
					this.lazy = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 3:
					if (deprecated$count != 0) {
						throw new flash.errors.IOError('Bad data format: FieldOptions.deprecated cannot be set twice.');
					}
					++deprecated$count;
					this.deprecated = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 10:
					if (weak$count != 0) {
						throw new flash.errors.IOError('Bad data format: FieldOptions.weak cannot be set twice.');
					}
					++weak$count;
					this.weak = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
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
