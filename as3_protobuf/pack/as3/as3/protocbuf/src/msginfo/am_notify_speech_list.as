package msginfo {
	import com.netease.protobuf.*;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import msginfo.am_user_room_basic_info;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class am_notify_speech_list extends com.netease.protobuf.Message {
		public static const SPEECH_LEFT_TIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("msginfo.am_notify_speech_list.speech_left_time", "speechLeftTime", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var speech_left_time$field:uint;

		private var hasField$0:uint = 0;

		public function clearSpeechLeftTime():void {
			hasField$0 &= 0xfffffffe;
			speech_left_time$field = new uint();
		}

		public function get hasSpeechLeftTime():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set speechLeftTime(value:uint):void {
			hasField$0 |= 0x1;
			speech_left_time$field = value;
		}

		public function get speechLeftTime():uint {
			return speech_left_time$field;
		}

		public static const USER_BASIC_INFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("msginfo.am_notify_speech_list.user_basic_info", "userBasicInfo", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, msginfo.am_user_room_basic_info);

		[ArrayElementType("msginfo.am_user_room_basic_info")]
		public var userBasicInfo:Array = [];

		/**
		 *  @private
		 */
		override public final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasSpeechLeftTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, speech_left_time$field);
			}
			for (var userBasicInfo$index:uint = 0; userBasicInfo$index < this.userBasicInfo.length; ++userBasicInfo$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.userBasicInfo[userBasicInfo$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override public final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var speech_left_time$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (speech_left_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: am_notify_speech_list.speechLeftTime cannot be set twice.');
					}
					++speech_left_time$count;
					this.speechLeftTime = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 2:
					this.userBasicInfo.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new msginfo.am_user_room_basic_info()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
