package msginfo {
	import com.netease.protobuf.*;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import flash.utils.ByteArray;
	import msginfo.am_user_type_and_id;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class am_req_client_login_text extends com.netease.protobuf.Message {
		public static const USER_ID:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("msginfo.am_req_client_login_text.user_id", "userId", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, msginfo.am_user_type_and_id);

		public var userId:msginfo.am_user_type_and_id;

		public static const LOGIN_KEY:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("msginfo.am_req_client_login_text.login_key", "loginKey", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var loginKey:flash.utils.ByteArray;

		/**
		 *  @private
		 */
		override public final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.userId);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_BYTES(output, this.loginKey);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override public final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var user_id$count:uint = 0;
			var login_key$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (user_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_req_client_login_text.userId cannot be set twice.');
					}
					++user_id$count;
					this.userId = new msginfo.am_user_type_and_id();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.userId);
					break;
				case 2:
					if (login_key$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_req_client_login_text.loginKey cannot be set twice.');
					}
					++login_key$count;
					this.loginKey = com.netease.protobuf.ReadUtils.read$TYPE_BYTES(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
