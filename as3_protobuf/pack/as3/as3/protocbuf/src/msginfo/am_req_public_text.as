package msginfo {
	import com.netease.protobuf.*;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import msginfo.am_text_message;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class am_req_public_text extends com.netease.protobuf.Message {
		public static const TEXT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("msginfo.am_req_public_text.text", "text", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, msginfo.am_text_message);

		private var text$field:msginfo.am_text_message;

		public function clearText():void {
			text$field = null;
		}

		public function get hasText():Boolean {
			return text$field != null;
		}

		public function set text(value:msginfo.am_text_message):void {
			text$field = value;
		}

		public function get text():msginfo.am_text_message {
			return text$field;
		}

		/**
		 *  @private
		 */
		override public final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasText) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, text$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override public final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var text$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 2:
					if (text$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_req_public_text.text cannot be set twice.');
					}
					++text$count;
					this.text = new msginfo.am_text_message();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.text);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
