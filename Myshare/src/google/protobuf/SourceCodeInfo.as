package google.protobuf {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import google.protobuf.SourceCodeInfo.Location;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class SourceCodeInfo extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const LOCATION:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("google.protobuf.SourceCodeInfo.location", "location", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return google.protobuf.SourceCodeInfo.Location; });

		[ArrayElementType("google.protobuf.SourceCodeInfo.Location")]
		public var location:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var location$index:uint = 0; location$index < this.location.length; ++location$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.location[location$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					this.location.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new google.protobuf.SourceCodeInfo.Location()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
