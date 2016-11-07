package msginfo {
	import com.netease.protobuf.*;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import msginfo.am_client_type;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class am_user_type_and_id extends com.netease.protobuf.Message {
		public static const ID:FieldDescriptor$TYPE_SINT32 = new FieldDescriptor$TYPE_SINT32("msginfo.am_user_type_and_id.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var id$field:int;

		private var hasField$0:uint = 0;

		public function clearId():void {
			hasField$0 &= 0xfffffffe;
			id$field = new int();
		}

		public function get hasId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set id(value:int):void {
			hasField$0 |= 0x1;
			id$field = value;
		}

		public function get id():int {
			return id$field;
		}

		public static const CLIENT_TYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("msginfo.am_user_type_and_id.client_type", "clientType", (2 << 3) | com.netease.protobuf.WireType.VARINT, msginfo.am_client_type);

		private var client_type$field:int;

		public function clearClientType():void {
			hasField$0 &= 0xfffffffd;
			client_type$field = new int();
		}

		public function get hasClientType():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set clientType(value:int):void {
			hasField$0 |= 0x2;
			client_type$field = value;
		}

		public function get clientType():int {
			if(!hasClientType) {
				return msginfo.am_client_type.at_pc;
			}
			return client_type$field;
		}

		/**
		 *  @private
		 */
		override public final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_SINT32(output, id$field);
			}
			if (hasClientType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, client_type$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override public final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var id$count:uint = 0;
			var client_type$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_user_type_and_id.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read$TYPE_SINT32(input);
					break;
				case 2:
					if (client_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_user_type_and_id.clientType cannot be set twice.');
					}
					++client_type$count;
					this.clientType = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
