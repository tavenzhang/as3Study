package msginfo {
	import com.netease.protobuf.*;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import flash.utils.ByteArray;
	import msginfo.am_user_extend_info;
	import msginfo.am_user_platform_info;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class am_res_login extends com.netease.protobuf.Message {
		public static const ERROR_CODE:FieldDescriptor$TYPE_SINT32 = new FieldDescriptor$TYPE_SINT32("msginfo.am_res_login.error_code", "errorCode", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var errorCode:int;

		public static const USER_INFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("msginfo.am_res_login.user_info", "userInfo", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, msginfo.am_user_platform_info);

		private var user_info$field:msginfo.am_user_platform_info;

		public function clearUserInfo():void {
			user_info$field = null;
		}

		public function get hasUserInfo():Boolean {
			return user_info$field != null;
		}

		public function set userInfo(value:msginfo.am_user_platform_info):void {
			user_info$field = value;
		}

		public function get userInfo():msginfo.am_user_platform_info {
			return user_info$field;
		}

		public static const EXTEND_INFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("msginfo.am_res_login.extend_info", "extendInfo", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, msginfo.am_user_extend_info);

		private var extend_info$field:msginfo.am_user_extend_info;

		public function clearExtendInfo():void {
			extend_info$field = null;
		}

		public function get hasExtendInfo():Boolean {
			return extend_info$field != null;
		}

		public function set extendInfo(value:msginfo.am_user_extend_info):void {
			extend_info$field = value;
		}

		public function get extendInfo():msginfo.am_user_extend_info {
			return extend_info$field;
		}

		public static const LOGIN_KEY:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("msginfo.am_res_login.login_key", "loginKey", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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

		public static const EXE_VER:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("msginfo.am_res_login.exe_ver", "exeVer", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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

		public static const LOWEST_VER:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("msginfo.am_res_login.lowest_ver", "lowestVer", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var lowest_ver$field:flash.utils.ByteArray;

		public function clearLowestVer():void {
			lowest_ver$field = null;
		}

		public function get hasLowestVer():Boolean {
			return lowest_ver$field != null;
		}

		public function set lowestVer(value:flash.utils.ByteArray):void {
			lowest_ver$field = value;
		}

		public function get lowestVer():flash.utils.ByteArray {
			return lowest_ver$field;
		}

		public static const LATEST_EXE_URL:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("msginfo.am_res_login.latest_exe_url", "latestExeUrl", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var latest_exe_url$field:flash.utils.ByteArray;

		public function clearLatestExeUrl():void {
			latest_exe_url$field = null;
		}

		public function get hasLatestExeUrl():Boolean {
			return latest_exe_url$field != null;
		}

		public function set latestExeUrl(value:flash.utils.ByteArray):void {
			latest_exe_url$field = value;
		}

		public function get latestExeUrl():flash.utils.ByteArray {
			return latest_exe_url$field;
		}

		/**
		 *  @private
		 */
		override public final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_SINT32(output, this.errorCode);
			if (hasUserInfo) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, user_info$field);
			}
			if (hasExtendInfo) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, extend_info$field);
			}
			if (hasLoginKey) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_BYTES(output, login_key$field);
			}
			if (hasExeVer) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_BYTES(output, exe_ver$field);
			}
			if (hasLowestVer) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_BYTES(output, lowest_ver$field);
			}
			if (hasLatestExeUrl) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_BYTES(output, latest_exe_url$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override public final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var error_code$count:uint = 0;
			var user_info$count:uint = 0;
			var extend_info$count:uint = 0;
			var login_key$count:uint = 0;
			var exe_ver$count:uint = 0;
			var lowest_ver$count:uint = 0;
			var latest_exe_url$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (error_code$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_res_login.errorCode cannot be set twice.');
					}
					++error_code$count;
					this.errorCode = com.netease.protobuf.ReadUtils.read$TYPE_SINT32(input);
					break;
				case 2:
					if (user_info$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_res_login.userInfo cannot be set twice.');
					}
					++user_info$count;
					this.userInfo = new msginfo.am_user_platform_info();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.userInfo);
					break;
				case 3:
					if (extend_info$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_res_login.extendInfo cannot be set twice.');
					}
					++extend_info$count;
					this.extendInfo = new msginfo.am_user_extend_info();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.extendInfo);
					break;
				case 4:
					if (login_key$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_res_login.loginKey cannot be set twice.');
					}
					++login_key$count;
					this.loginKey = com.netease.protobuf.ReadUtils.read$TYPE_BYTES(input);
					break;
				case 5:
					if (exe_ver$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_res_login.exeVer cannot be set twice.');
					}
					++exe_ver$count;
					this.exeVer = com.netease.protobuf.ReadUtils.read$TYPE_BYTES(input);
					break;
				case 6:
					if (lowest_ver$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_res_login.lowestVer cannot be set twice.');
					}
					++lowest_ver$count;
					this.lowestVer = com.netease.protobuf.ReadUtils.read$TYPE_BYTES(input);
					break;
				case 7:
					if (latest_exe_url$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_res_login.latestExeUrl cannot be set twice.');
					}
					++latest_exe_url$count;
					this.latestExeUrl = com.netease.protobuf.ReadUtils.read$TYPE_BYTES(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
