package msginfo {
	import com.netease.protobuf.*;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import flash.utils.ByteArray;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class am_text_format extends com.netease.protobuf.Message {
		public static const FONT:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("msginfo.am_text_format.font", "font", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var font$field:flash.utils.ByteArray;

		public function clearFont():void {
			font$field = null;
		}

		public function get hasFont():Boolean {
			return font$field != null;
		}

		public function set font(value:flash.utils.ByteArray):void {
			font$field = value;
		}

		public function get font():flash.utils.ByteArray {
			return font$field;
		}

		public static const SIZE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("msginfo.am_text_format.size", "size", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var size$field:uint;

		private var hasField$0:uint = 0;

		public function clearSize():void {
			hasField$0 &= 0xfffffffe;
			size$field = new uint();
		}

		public function get hasSize():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set size(value:uint):void {
			hasField$0 |= 0x1;
			size$field = value;
		}

		public function get size():uint {
			return size$field;
		}

		public static const COLOR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("msginfo.am_text_format.color", "color", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var color$field:uint;

		public function clearColor():void {
			hasField$0 &= 0xfffffffd;
			color$field = new uint();
		}

		public function get hasColor():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set color(value:uint):void {
			hasField$0 |= 0x2;
			color$field = value;
		}

		public function get color():uint {
			return color$field;
		}

		public static const IS_BOLD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("msginfo.am_text_format.is_bold", "isBold", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_bold$field:Boolean;

		public function clearIsBold():void {
			hasField$0 &= 0xfffffffb;
			is_bold$field = new Boolean();
		}

		public function get hasIsBold():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set isBold(value:Boolean):void {
			hasField$0 |= 0x4;
			is_bold$field = value;
		}

		public function get isBold():Boolean {
			return is_bold$field;
		}

		public static const IS_ITALIC:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("msginfo.am_text_format.is_italic", "isItalic", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_italic$field:Boolean;

		public function clearIsItalic():void {
			hasField$0 &= 0xfffffff7;
			is_italic$field = new Boolean();
		}

		public function get hasIsItalic():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set isItalic(value:Boolean):void {
			hasField$0 |= 0x8;
			is_italic$field = value;
		}

		public function get isItalic():Boolean {
			return is_italic$field;
		}

		public static const IS_UNDERLINED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("msginfo.am_text_format.is_underlined", "isUnderlined", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_underlined$field:Boolean;

		public function clearIsUnderlined():void {
			hasField$0 &= 0xffffffef;
			is_underlined$field = new Boolean();
		}

		public function get hasIsUnderlined():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set isUnderlined(value:Boolean):void {
			hasField$0 |= 0x10;
			is_underlined$field = value;
		}

		public function get isUnderlined():Boolean {
			return is_underlined$field;
		}

		/**
		 *  @private
		 */
		override public final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasFont) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_BYTES(output, font$field);
			}
			if (hasSize) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, size$field);
			}
			if (hasColor) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, color$field);
			}
			if (hasIsBold) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_bold$field);
			}
			if (hasIsItalic) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_italic$field);
			}
			if (hasIsUnderlined) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_underlined$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override public final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var font$count:uint = 0;
			var size$count:uint = 0;
			var color$count:uint = 0;
			var is_bold$count:uint = 0;
			var is_italic$count:uint = 0;
			var is_underlined$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (font$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_text_format.font cannot be set twice.');
					}
					++font$count;
					this.font = com.netease.protobuf.ReadUtils.read$TYPE_BYTES(input);
					break;
				case 2:
					if (size$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_text_format.size cannot be set twice.');
					}
					++size$count;
					this.size = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 3:
					if (color$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_text_format.color cannot be set twice.');
					}
					++color$count;
					this.color = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 4:
					if (is_bold$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_text_format.isBold cannot be set twice.');
					}
					++is_bold$count;
					this.isBold = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 5:
					if (is_italic$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_text_format.isItalic cannot be set twice.');
					}
					++is_italic$count;
					this.isItalic = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 6:
					if (is_underlined$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_text_format.isUnderlined cannot be set twice.');
					}
					++is_underlined$count;
					this.isUnderlined = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
