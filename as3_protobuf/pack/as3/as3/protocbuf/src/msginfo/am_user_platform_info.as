package msginfo {
	import com.netease.protobuf.*;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import msginfo.am_sex_type;
	import flash.utils.ByteArray;
	import msginfo.am_user_type_and_id;
	import msginfo.am_member_info;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class am_user_platform_info extends com.netease.protobuf.Message {
		public static const USER_ID:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("msginfo.am_user_platform_info.user_id", "userId", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, msginfo.am_user_type_and_id);

		private var user_id$field:msginfo.am_user_type_and_id;

		public function clearUserId():void {
			user_id$field = null;
		}

		public function get hasUserId():Boolean {
			return user_id$field != null;
		}

		public function set userId(value:msginfo.am_user_type_and_id):void {
			user_id$field = value;
		}

		public function get userId():msginfo.am_user_type_and_id {
			return user_id$field;
		}

		public static const VERSION:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("msginfo.am_user_platform_info.version", "version", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var version$field:UInt64;

		public function clearVersion():void {
			version$field = null;
		}

		public function get hasVersion():Boolean {
			return version$field != null;
		}

		public function set version(value:UInt64):void {
			version$field = value;
		}

		public function get version():UInt64 {
			if(!hasVersion) {
				return new UInt64(0, 0);
			}
			return version$field;
		}

		public static const NICKNAME:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("msginfo.am_user_platform_info.nickname", "nickname", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
			if(!hasNickname) {
				return stringToByteArray("");
			}
			return nickname$field;
		}

		public static const SEX:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("msginfo.am_user_platform_info.sex", "sex", (4 << 3) | com.netease.protobuf.WireType.VARINT, msginfo.am_sex_type);

		private var sex$field:int;

		private var hasField$0:uint = 0;

		public function clearSex():void {
			hasField$0 &= 0xfffffffe;
			sex$field = new int();
		}

		public function get hasSex():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set sex(value:int):void {
			hasField$0 |= 0x1;
			sex$field = value;
		}

		public function get sex():int {
			if(!hasSex) {
				return msginfo.am_sex_type.ast_secret;
			}
			return sex$field;
		}

		public static const NOT_SYSTEM_ADMINISTRATOR:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("msginfo.am_user_platform_info.not_system_administrator", "notSystemAdministrator", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var not_system_administrator$field:Boolean;

		public function clearNotSystemAdministrator():void {
			hasField$0 &= 0xfffffffd;
			not_system_administrator$field = new Boolean();
		}

		public function get hasNotSystemAdministrator():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set notSystemAdministrator(value:Boolean):void {
			hasField$0 |= 0x2;
			not_system_administrator$field = value;
		}

		public function get notSystemAdministrator():Boolean {
			if(!hasNotSystemAdministrator) {
				return true;
			}
			return not_system_administrator$field;
		}

		public static const NOT_AUDIO_HIDDEN_USER:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("msginfo.am_user_platform_info.not_audio_hidden_user", "notAudioHiddenUser", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var not_audio_hidden_user$field:Boolean;

		public function clearNotAudioHiddenUser():void {
			hasField$0 &= 0xfffffffb;
			not_audio_hidden_user$field = new Boolean();
		}

		public function get hasNotAudioHiddenUser():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set notAudioHiddenUser(value:Boolean):void {
			hasField$0 |= 0x4;
			not_audio_hidden_user$field = value;
		}

		public function get notAudioHiddenUser():Boolean {
			if(!hasNotAudioHiddenUser) {
				return false;
			}
			return not_audio_hidden_user$field;
		}

		public static const MEMBER_INFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("msginfo.am_user_platform_info.member_info", "memberInfo", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, msginfo.am_member_info);

		private var member_info$field:msginfo.am_member_info;

		public function clearMemberInfo():void {
			member_info$field = null;
		}

		public function get hasMemberInfo():Boolean {
			return member_info$field != null;
		}

		public function set memberInfo(value:msginfo.am_member_info):void {
			member_info$field = value;
		}

		public function get memberInfo():msginfo.am_member_info {
			return member_info$field;
		}

		public static const PARTNER_ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("msginfo.am_user_platform_info.partner_id", "partnerId", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var partner_id$field:uint;

		public function clearPartnerId():void {
			hasField$0 &= 0xfffffff7;
			partner_id$field = new uint();
		}

		public function get hasPartnerId():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set partnerId(value:uint):void {
			hasField$0 |= 0x8;
			partner_id$field = value;
		}

		public function get partnerId():uint {
			return partner_id$field;
		}

		public static const VOICE_STATUS:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("msginfo.am_user_platform_info.voice_status", "voiceStatus", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var voice_status$field:Boolean;

		public function clearVoiceStatus():void {
			hasField$0 &= 0xffffffef;
			voice_status$field = new Boolean();
		}

		public function get hasVoiceStatus():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set voiceStatus(value:Boolean):void {
			hasField$0 |= 0x10;
			voice_status$field = value;
		}

		public function get voiceStatus():Boolean {
			return voice_status$field;
		}

		public static const TEXT_STATUS:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("msginfo.am_user_platform_info.text_status", "textStatus", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var text_status$field:Boolean;

		public function clearTextStatus():void {
			hasField$0 &= 0xffffffdf;
			text_status$field = new Boolean();
		}

		public function get hasTextStatus():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set textStatus(value:Boolean):void {
			hasField$0 |= 0x20;
			text_status$field = value;
		}

		public function get textStatus():Boolean {
			return text_status$field;
		}

		public static const VIP_LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("msginfo.am_user_platform_info.vip_level", "vipLevel", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var vip_level$field:uint;

		public function clearVipLevel():void {
			hasField$0 &= 0xffffffbf;
			vip_level$field = new uint();
		}

		public function get hasVipLevel():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set vipLevel(value:uint):void {
			hasField$0 |= 0x40;
			vip_level$field = value;
		}

		public function get vipLevel():uint {
			return vip_level$field;
		}

		public static const SIGN_STATUS_ID:FieldDescriptor$TYPE_SINT32 = new FieldDescriptor$TYPE_SINT32("msginfo.am_user_platform_info.sign_status_id", "signStatusId", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		private var sign_status_id$field:int;

		public function clearSignStatusId():void {
			hasField$0 &= 0xffffff7f;
			sign_status_id$field = new int();
		}

		public function get hasSignStatusId():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set signStatusId(value:int):void {
			hasField$0 |= 0x80;
			sign_status_id$field = value;
		}

		public function get signStatusId():int {
			if(!hasSignStatusId) {
				return -1;
			}
			return sign_status_id$field;
		}

		/**
		 *  @private
		 */
		override public final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasUserId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, user_id$field);
			}
			if (hasVersion) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, version$field);
			}
			if (hasNickname) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_BYTES(output, nickname$field);
			}
			if (hasSex) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, sex$field);
			}
			if (hasNotSystemAdministrator) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, not_system_administrator$field);
			}
			if (hasNotAudioHiddenUser) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, not_audio_hidden_user$field);
			}
			if (hasMemberInfo) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, member_info$field);
			}
			if (hasPartnerId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, partner_id$field);
			}
			if (hasVoiceStatus) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, voice_status$field);
			}
			if (hasTextStatus) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, text_status$field);
			}
			if (hasVipLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, vip_level$field);
			}
			if (hasSignStatusId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_SINT32(output, sign_status_id$field);
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
			var version$count:uint = 0;
			var nickname$count:uint = 0;
			var sex$count:uint = 0;
			var not_system_administrator$count:uint = 0;
			var not_audio_hidden_user$count:uint = 0;
			var member_info$count:uint = 0;
			var partner_id$count:uint = 0;
			var voice_status$count:uint = 0;
			var text_status$count:uint = 0;
			var vip_level$count:uint = 0;
			var sign_status_id$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (user_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_user_platform_info.userId cannot be set twice.');
					}
					++user_id$count;
					this.userId = new msginfo.am_user_type_and_id();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.userId);
					break;
				case 2:
					if (version$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_user_platform_info.version cannot be set twice.');
					}
					++version$count;
					this.version = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 3:
					if (nickname$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_user_platform_info.nickname cannot be set twice.');
					}
					++nickname$count;
					this.nickname = com.netease.protobuf.ReadUtils.read$TYPE_BYTES(input);
					break;
				case 4:
					if (sex$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_user_platform_info.sex cannot be set twice.');
					}
					++sex$count;
					this.sex = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 5:
					if (not_system_administrator$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_user_platform_info.notSystemAdministrator cannot be set twice.');
					}
					++not_system_administrator$count;
					this.notSystemAdministrator = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 6:
					if (not_audio_hidden_user$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_user_platform_info.notAudioHiddenUser cannot be set twice.');
					}
					++not_audio_hidden_user$count;
					this.notAudioHiddenUser = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 7:
					if (member_info$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_user_platform_info.memberInfo cannot be set twice.');
					}
					++member_info$count;
					this.memberInfo = new msginfo.am_member_info();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.memberInfo);
					break;
				case 8:
					if (partner_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_user_platform_info.partnerId cannot be set twice.');
					}
					++partner_id$count;
					this.partnerId = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 9:
					if (voice_status$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_user_platform_info.voiceStatus cannot be set twice.');
					}
					++voice_status$count;
					this.voiceStatus = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 10:
					if (text_status$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_user_platform_info.textStatus cannot be set twice.');
					}
					++text_status$count;
					this.textStatus = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 11:
					if (vip_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_user_platform_info.vipLevel cannot be set twice.');
					}
					++vip_level$count;
					this.vipLevel = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 12:
					if (sign_status_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_user_platform_info.signStatusId cannot be set twice.');
					}
					++sign_status_id$count;
					this.signStatusId = com.netease.protobuf.ReadUtils.read$TYPE_SINT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
