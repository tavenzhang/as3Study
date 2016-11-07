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
	public dynamic final class am_req_enter_channel extends com.netease.protobuf.Message {
		public static const USER_ID:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("msginfo.am_req_enter_channel.user_id", "userId", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, msginfo.am_user_type_and_id);

		public var userId:msginfo.am_user_type_and_id;

		public static const CHANNEL_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("msginfo.am_req_enter_channel.channel_id", "channelId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var channelId:UInt64;

		public static const ROOM_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("msginfo.am_req_enter_channel.room_id", "roomId", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var room_id$field:UInt64;

		public function clearRoomId():void {
			room_id$field = null;
		}

		public function get hasRoomId():Boolean {
			return room_id$field != null;
		}

		public function set roomId(value:UInt64):void {
			room_id$field = value;
		}

		public function get roomId():UInt64 {
			return room_id$field;
		}

		public static const CLIENT_ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("msginfo.am_req_enter_channel.client_id", "clientId", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var client_id$field:uint;

		private var hasField$0:uint = 0;

		public function clearClientId():void {
			hasField$0 &= 0xfffffffe;
			client_id$field = new uint();
		}

		public function get hasClientId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set clientId(value:uint):void {
			hasField$0 |= 0x1;
			client_id$field = value;
		}

		public function get clientId():uint {
			return client_id$field;
		}

		public static const MACHINE_ID:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("msginfo.am_req_enter_channel.machine_id", "machineId", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var machine_id$field:flash.utils.ByteArray;

		public function clearMachineId():void {
			machine_id$field = null;
		}

		public function get hasMachineId():Boolean {
			return machine_id$field != null;
		}

		public function set machineId(value:flash.utils.ByteArray):void {
			machine_id$field = value;
		}

		public function get machineId():flash.utils.ByteArray {
			return machine_id$field;
		}

		public static const CLUSTER_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("msginfo.am_req_enter_channel.cluster_id", "clusterId", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var cluster_id$field:UInt64;

		public function clearClusterId():void {
			cluster_id$field = null;
		}

		public function get hasClusterId():Boolean {
			return cluster_id$field != null;
		}

		public function set clusterId(value:UInt64):void {
			cluster_id$field = value;
		}

		public function get clusterId():UInt64 {
			return cluster_id$field;
		}

		public static const CLUSTER_VER:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("msginfo.am_req_enter_channel.cluster_ver", "clusterVer", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var cluster_ver$field:UInt64;

		public function clearClusterVer():void {
			cluster_ver$field = null;
		}

		public function get hasClusterVer():Boolean {
			return cluster_ver$field != null;
		}

		public function set clusterVer(value:UInt64):void {
			cluster_ver$field = value;
		}

		public function get clusterVer():UInt64 {
			return cluster_ver$field;
		}

		public static const PASSWORD:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("msginfo.am_req_enter_channel.password", "password", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var password$field:flash.utils.ByteArray;

		public function clearPassword():void {
			password$field = null;
		}

		public function get hasPassword():Boolean {
			return password$field != null;
		}

		public function set password(value:flash.utils.ByteArray):void {
			password$field = value;
		}

		public function get password():flash.utils.ByteArray {
			return password$field;
		}

		public static const LOGIN_KEY:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("msginfo.am_req_enter_channel.login_key", "loginKey", (9 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var login_key$field:flash.utils.ByteArray;

		public function clearLoginKey():void {
			login_key$field = null;
		}

		public function get hasLoginKey():Boolean {
			return login_key$field != null;
		}

		public function set loginKey(value:flash.utils.ByteArray):void {
			login_key$field = value;
		}

		public function get loginKey():flash.utils.ByteArray {
			return login_key$field;
		}

		/**
		 *  @private
		 */
		override public final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.userId);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, this.channelId);
			if (hasRoomId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, room_id$field);
			}
			if (hasClientId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, client_id$field);
			}
			if (hasMachineId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_BYTES(output, machine_id$field);
			}
			if (hasClusterId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, cluster_id$field);
			}
			if (hasClusterVer) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, cluster_ver$field);
			}
			if (hasPassword) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_BYTES(output, password$field);
			}
			if (hasLoginKey) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_BYTES(output, login_key$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override public final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var user_id$count:uint = 0;
			var channel_id$count:uint = 0;
			var room_id$count:uint = 0;
			var client_id$count:uint = 0;
			var machine_id$count:uint = 0;
			var cluster_id$count:uint = 0;
			var cluster_ver$count:uint = 0;
			var password$count:uint = 0;
			var login_key$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (user_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_req_enter_channel.userId cannot be set twice.');
					}
					++user_id$count;
					this.userId = new msginfo.am_user_type_and_id();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.userId);
					break;
				case 2:
					if (channel_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_req_enter_channel.channelId cannot be set twice.');
					}
					++channel_id$count;
					this.channelId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 3:
					if (room_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_req_enter_channel.roomId cannot be set twice.');
					}
					++room_id$count;
					this.roomId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 4:
					if (client_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_req_enter_channel.clientId cannot be set twice.');
					}
					++client_id$count;
					this.clientId = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 5:
					if (machine_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_req_enter_channel.machineId cannot be set twice.');
					}
					++machine_id$count;
					this.machineId = com.netease.protobuf.ReadUtils.read$TYPE_BYTES(input);
					break;
				case 6:
					if (cluster_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_req_enter_channel.clusterId cannot be set twice.');
					}
					++cluster_id$count;
					this.clusterId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 7:
					if (cluster_ver$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_req_enter_channel.clusterVer cannot be set twice.');
					}
					++cluster_ver$count;
					this.clusterVer = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 8:
					if (password$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_req_enter_channel.password cannot be set twice.');
					}
					++password$count;
					this.password = com.netease.protobuf.ReadUtils.read$TYPE_BYTES(input);
					break;
				case 9:
					if (login_key$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_req_enter_channel.loginKey cannot be set twice.');
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
