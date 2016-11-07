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
	public dynamic final class am_notify_materiel extends com.netease.protobuf.Message {
		public static const VERSION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("msginfo.am_notify_materiel.version", "version", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var version$field:uint;

		private var hasField$0:uint = 0;

		public function clearVersion():void {
			hasField$0 &= 0xfffffffe;
			version$field = new uint();
		}

		public function get hasVersion():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set version(value:uint):void {
			hasField$0 |= 0x1;
			version$field = value;
		}

		public function get version():uint {
			return version$field;
		}

		public static const URL:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("msginfo.am_notify_materiel.url", "url", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var url$field:flash.utils.ByteArray;

		public function clearUrl():void {
			url$field = null;
		}

		public function get hasUrl():Boolean {
			return url$field != null;
		}

		public function set url(value:flash.utils.ByteArray):void {
			url$field = value;
		}

		public function get url():flash.utils.ByteArray {
			return url$field;
		}

		/**
		 *  @private
		 */
		override public final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasVersion) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, version$field);
			}
			if (hasUrl) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_BYTES(output, url$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override public final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var version$count:uint = 0;
			var url$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (version$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_notify_materiel.version cannot be set twice.');
					}
					++version$count;
					this.version = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 2:
					if (url$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_notify_materiel.url cannot be set twice.');
					}
					++url$count;
					this.url = com.netease.protobuf.ReadUtils.read$TYPE_BYTES(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
