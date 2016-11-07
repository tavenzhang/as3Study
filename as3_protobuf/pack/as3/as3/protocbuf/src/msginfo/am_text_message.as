package msginfo {
	import com.netease.protobuf.*;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import msginfo.am_text_format;
	import flash.utils.ByteArray;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class am_text_message extends com.netease.protobuf.Message {
		public static const FORMAT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("msginfo.am_text_message.format", "format", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, msginfo.am_text_format);

		private var format$field:msginfo.am_text_format;

		public function clearFormat():void {
			format$field = null;
		}

		public function get hasFormat():Boolean {
			return format$field != null;
		}

		public function set format(value:msginfo.am_text_format):void {
			format$field = value;
		}

		public function get format():msginfo.am_text_format {
			return format$field;
		}

		public static const TEXT:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("msginfo.am_text_message.text", "text", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var text$field:flash.utils.ByteArray;

		public function clearText():void {
			text$field = null;
		}

		public function get hasText():Boolean {
			return text$field != null;
		}

		public function set text(value:flash.utils.ByteArray):void {
			text$field = value;
		}

		public function get text():flash.utils.ByteArray {
			return text$field;
		}

		/**
		 *  @private
		 */
		override public final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasFormat) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, format$field);
			}
			if (hasText) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_BYTES(output, text$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override public final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var format$count:uint = 0;
			var text$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (format$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_text_message.format cannot be set twice.');
					}
					++format$count;
					this.format = new msginfo.am_text_format();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.format);
					break;
				case 2:
					if (text$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_text_message.text cannot be set twice.');
					}
					++text$count;
					this.text = com.netease.protobuf.ReadUtils.read$TYPE_BYTES(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
