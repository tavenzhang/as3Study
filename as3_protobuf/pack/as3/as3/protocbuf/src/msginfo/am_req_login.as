package msginfo {
	import com.netease.protobuf.*;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import flash.utils.ByteArray;
	import msginfo.am_login_type;
	import msginfo.am_client_type;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class am_req_login extends com.netease.protobuf.Message {
		public static const ACCOUNT:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("msginfo.am_req_login.account", "account", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var account$field:flash.utils.ByteArray;

		public function clearAccount():void {
			account$field = null;
		}

		public function get hasAccount():Boolean {
			return account$field != null;
		}

		public function set account(value:flash.utils.ByteArray):void {
			account$field = value;
		}

		public function get account():flash.utils.ByteArray {
			return account$field;
		}

		public static const USER_ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("msginfo.am_req_login.user_id", "userId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var user_id$field:uint;

		private var hasField$0:uint = 0;

		public function clearUserId():void {
			hasField$0 &= 0xfffffffe;
			user_id$field = new uint();
		}

		public function get hasUserId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set userId(value:uint):void {
			hasField$0 |= 0x1;
			user_id$field = value;
		}

		public function get userId():uint {
			return user_id$field;
		}

		public static const PASSWORD:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("msginfo.am_req_login.password", "password", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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

		public static const LOGIN_TYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("msginfo.am_req_login.login_type", "loginType", (4 << 3) | com.netease.protobuf.WireType.VARINT, msginfo.am_login_type);

		private var login_type$field:int;

		public function clearLoginType():void {
			hasField$0 &= 0xfffffffd;
			login_type$field = new int();
		}

		public function get hasLoginType():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set loginType(value:int):void {
			hasField$0 |= 0x2;
			login_type$field = value;
		}

		public function get loginType():int {
			if(!hasLoginType) {
				return msginfo.am_login_type.lt_tt;
			}
			return login_type$field;
		}

		public static const MACHINE_ID:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("msginfo.am_req_login.machine_id", "machineId", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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

		public static const EXE_VER:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("msginfo.am_req_login.exe_ver", "exeVer", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var exe_ver$field:flash.utils.ByteArray;

		public function clearExeVer():void {
			exe_ver$field = null;
		}

		public function get hasExeVer():Boolean {
			return exe_ver$field != null;
		}

		public function set exeVer(value:flash.utils.ByteArray):void {
			exe_ver$field = value;
		}

		public function get exeVer():flash.utils.ByteArray {
			return exe_ver$field;
		}

		public static const INI_VER:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("msginfo.am_req_login.ini_ver", "iniVer", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var ini_ver$field:flash.utils.ByteArray;

		public function clearIniVer():void {
			ini_ver$field = null;
		}

		public function get hasIniVer():Boolean {
			return ini_ver$field != null;
		}

		public function set iniVer(value:flash.utils.ByteArray):void {
			ini_ver$field = value;
		}

		public function get iniVer():flash.utils.ByteArray {
			return ini_ver$field;
		}

		public static const CLIENT_TYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("msginfo.am_req_login.client_type", "clientType", (8 << 3) | com.netease.protobuf.WireType.VARINT, msginfo.am_client_type);

		private var client_type$field:int;

		public function clearClientType():void {
			hasField$0 &= 0xfffffffb;
			client_type$field = new int();
		}

		public function get hasClientType():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set clientType(value:int):void {
			hasField$0 |= 0x4;
			client_type$field = value;
		}

		public function get clientType():int {
			if(!hasClientType) {
				return msginfo.am_client_type.at_pc;
			}
			return client_type$field;
		}

		public static const NICKNAME:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("msginfo.am_req_login.nickname", "nickname", (9 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var nickname$field:flash.utils.ByteArray;

		public function clearNickname():void {
			nickname$field = null;
		}

		public function get hasNickname():Boolean {
			return nickname$field != null;
		}

		public function set nickname(value:flash.utils.ByteArray):void {
			nickname$field = value;
		}

		public function get nickname():flash.utils.ByteArray {
			return nickname$field;
		}

		public static const GAME_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("msginfo.am_req_login.game_id", "gameId", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var game_id$field:int;

		public function clearGameId():void {
			hasField$0 &= 0xfffffff7;
			game_id$field = new int();
		}

		public function get hasGameId():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set gameId(value:int):void {
			hasField$0 |= 0x8;
			game_id$field = value;
		}

		public function get gameId():int {
			return game_id$field;
		}

		public static const SERVER_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("msginfo.am_req_login.server_id", "serverId", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var server_id$field:int;

		public function clearServerId():void {
			hasField$0 &= 0xffffffef;
			server_id$field = new int();
		}

		public function get hasServerId():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set serverId(value:int):void {
			hasField$0 |= 0x10;
			server_id$field = value;
		}

		public function get serverId():int {
			return server_id$field;
		}

		public static const TIME:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("msginfo.am_req_login.time", "time", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		private var time$field:int;

		public function clearTime():void {
			hasField$0 &= 0xffffffdf;
			time$field = new int();
		}

		public function get hasTime():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set time(value:int):void {
			hasField$0 |= 0x20;
			time$field = value;
		}

		public function get time():int {
			return time$field;
		}

		public static const CLIENT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("msginfo.am_req_login.client", "client", (13 << 3) | com.netease.protobuf.WireType.VARINT);

		private var client$field:int;

		public function clearClient():void {
			hasField$0 &= 0xffffffbf;
			client$field = new int();
		}

		public function get hasClient():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set client(value:int):void {
			hasField$0 |= 0x40;
			client$field = value;
		}

		public function get client():int {
			return client$field;
		}

		public static const PLATFORM:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("msginfo.am_req_login.platform", "platform", (14 << 3) | com.netease.protobuf.WireType.VARINT);

		private var platform$field:int;

		public function clearPlatform():void {
			hasField$0 &= 0xffffff7f;
			platform$field = new int();
		}

		public function get hasPlatform():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set platform(value:int):void {
			hasField$0 |= 0x80;
			platform$field = value;
		}

		public function get platform():int {
			return platform$field;
		}

		public static const SIGN:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("msginfo.am_req_login.sign", "sign", (15 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var sign$field:flash.utils.ByteArray;

		public function clearSign():void {
			sign$field = null;
		}

		public function get hasSign():Boolean {
			return sign$field != null;
		}

		public function set sign(value:flash.utils.ByteArray):void {
			sign$field = value;
		}

		public function get sign():flash.utils.ByteArray {
			return sign$field;
		}

		/**
		 *  @private
		 */
		override public final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasAccount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_BYTES(output, account$field);
			}
			if (hasUserId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, user_id$field);
			}
			if (hasPassword) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_BYTES(output, password$field);
			}
			if (hasLoginType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, login_type$field);
			}
			if (hasMachineId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_BYTES(output, machine_id$field);
			}
			if (hasExeVer) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_BYTES(output, exe_ver$field);
			}
			if (hasIniVer) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_BYTES(output, ini_ver$field);
			}
			if (hasClientType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, client_type$field);
			}
			if (hasNickname) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_BYTES(output, nickname$field);
			}
			if (hasGameId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, game_id$field);
			}
			if (hasServerId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, server_id$field);
			}
			if (hasTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, time$field);
			}
			if (hasClient) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 13);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, client$field);
			}
			if (hasPlatform) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 14);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, platform$field);
			}
			if (hasSign) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 15);
				com.netease.protobuf.WriteUtils.write$TYPE_BYTES(output, sign$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override public final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var account$count:uint = 0;
			var user_id$count:uint = 0;
			var password$count:uint = 0;
			var login_type$count:uint = 0;
			var machine_id$count:uint = 0;
			var exe_ver$count:uint = 0;
			var ini_ver$count:uint = 0;
			var client_type$count:uint = 0;
			var nickname$count:uint = 0;
			var game_id$count:uint = 0;
			var server_id$count:uint = 0;
			var time$count:uint = 0;
			var client$count:uint = 0;
			var platform$count:uint = 0;
			var sign$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (account$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_req_login.account cannot be set twice.');
					}
					++account$count;
					this.account = com.netease.protobuf.ReadUtils.read$TYPE_BYTES(input);
					break;
				case 2:
					if (user_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_req_login.userId cannot be set twice.');
					}
					++user_id$count;
					this.userId = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 3:
					if (password$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_req_login.password cannot be set twice.');
					}
					++password$count;
					this.password = com.netease.protobuf.ReadUtils.read$TYPE_BYTES(input);
					break;
				case 4:
					if (login_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_req_login.loginType cannot be set twice.');
					}
					++login_type$count;
					this.loginType = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 5:
					if (machine_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_req_login.machineId cannot be set twice.');
					}
					++machine_id$count;
					this.machineId = com.netease.protobuf.ReadUtils.read$TYPE_BYTES(input);
					break;
				case 6:
					if (exe_ver$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_req_login.exeVer cannot be set twice.');
					}
					++exe_ver$count;
					this.exeVer = com.netease.protobuf.ReadUtils.read$TYPE_BYTES(input);
					break;
				case 7:
					if (ini_ver$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_req_login.iniVer cannot be set twice.');
					}
					++ini_ver$count;
					this.iniVer = com.netease.protobuf.ReadUtils.read$TYPE_BYTES(input);
					break;
				case 8:
					if (client_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_req_login.clientType cannot be set twice.');
					}
					++client_type$count;
					this.clientType = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 9:
					if (nickname$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_req_login.nickname cannot be set twice.');
					}
					++nickname$count;
					this.nickname = com.netease.protobuf.ReadUtils.read$TYPE_BYTES(input);
					break;
				case 10:
					if (game_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_req_login.gameId cannot be set twice.');
					}
					++game_id$count;
					this.gameId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 11:
					if (server_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_req_login.serverId cannot be set twice.');
					}
					++server_id$count;
					this.serverId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 12:
					if (time$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_req_login.time cannot be set twice.');
					}
					++time$count;
					this.time = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 13:
					if (client$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_req_login.client cannot be set twice.');
					}
					++client$count;
					this.client = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 14:
					if (platform$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_req_login.platform cannot be set twice.');
					}
					++platform$count;
					this.platform = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 15:
					if (sign$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_req_login.sign cannot be set twice.');
					}
					++sign$count;
					this.sign = com.netease.protobuf.ReadUtils.read$TYPE_BYTES(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
