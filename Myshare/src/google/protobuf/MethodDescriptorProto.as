package google.protobuf {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import google.protobuf.MethodOptions;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class MethodDescriptorProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("google.protobuf.MethodDescriptorProto.name", "name", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var name$field:String;

		public function clearName():void {
			name$field = null;
		}

		public function get hasName():Boolean {
			return name$field != null;
		}

		public function set name(value:String):void {
			name$field = value;
		}

		public function get name():String {
			return name$field;
		}

		/**
		 *  @private
		 */
		public static const INPUT_TYPE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("google.protobuf.MethodDescriptorProto.input_type", "inputType", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var input_type$field:String;

		public function clearInputType():void {
			input_type$field = null;
		}

		public function get hasInputType():Boolean {
			return input_type$field != null;
		}

		public function set inputType(value:String):void {
			input_type$field = value;
		}

		public function get inputType():String {
			return input_type$field;
		}

		/**
		 *  @private
		 */
		public static const OUTPUT_TYPE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("google.protobuf.MethodDescriptorProto.output_type", "outputType", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var output_type$field:String;

		public function clearOutputType():void {
			output_type$field = null;
		}

		public function get hasOutputType():Boolean {
			return output_type$field != null;
		}

		public function set outputType(value:String):void {
			output_type$field = value;
		}

		public function get outputType():String {
			return output_type$field;
		}

		/**
		 *  @private
		 */
		public static const OPTIONS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("google.protobuf.MethodDescriptorProto.options", "options", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return google.protobuf.MethodOptions; });

		private var options$field:google.protobuf.MethodOptions;

		public function clearOptions():void {
			options$field = null;
		}

		public function get hasOptions():Boolean {
			return options$field != null;
		}

		public function set options(value:google.protobuf.MethodOptions):void {
			options$field = value;
		}

		public function get options():google.protobuf.MethodOptions {
			return options$field;
		}

		/**
		 *  @private
		 */
		public static const CLIENT_STREAMING:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("google.protobuf.MethodDescriptorProto.client_streaming", "clientStreaming", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var client_streaming$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearClientStreaming():void {
			hasField$0 &= 0xfffffffe;
			client_streaming$field = new Boolean();
		}

		public function get hasClientStreaming():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set clientStreaming(value:Boolean):void {
			hasField$0 |= 0x1;
			client_streaming$field = value;
		}

		public function get clientStreaming():Boolean {
			if(!hasClientStreaming) {
				return false;
			}
			return client_streaming$field;
		}

		/**
		 *  @private
		 */
		public static const SERVER_STREAMING:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("google.protobuf.MethodDescriptorProto.server_streaming", "serverStreaming", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var server_streaming$field:Boolean;

		public function clearServerStreaming():void {
			hasField$0 &= 0xfffffffd;
			server_streaming$field = new Boolean();
		}

		public function get hasServerStreaming():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set serverStreaming(value:Boolean):void {
			hasField$0 |= 0x2;
			server_streaming$field = value;
		}

		public function get serverStreaming():Boolean {
			if(!hasServerStreaming) {
				return false;
			}
			return server_streaming$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, name$field);
			}
			if (hasInputType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, input_type$field);
			}
			if (hasOutputType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, output_type$field);
			}
			if (hasOptions) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, options$field);
			}
			if (hasClientStreaming) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, client_streaming$field);
			}
			if (hasServerStreaming) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, server_streaming$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var name$count:uint = 0;
			var input_type$count:uint = 0;
			var output_type$count:uint = 0;
			var options$count:uint = 0;
			var client_streaming$count:uint = 0;
			var server_streaming$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: MethodDescriptorProto.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (input_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: MethodDescriptorProto.inputType cannot be set twice.');
					}
					++input_type$count;
					this.inputType = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (output_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: MethodDescriptorProto.outputType cannot be set twice.');
					}
					++output_type$count;
					this.outputType = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					if (options$count != 0) {
						throw new flash.errors.IOError('Bad data format: MethodDescriptorProto.options cannot be set twice.');
					}
					++options$count;
					this.options = new google.protobuf.MethodOptions();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.options);
					break;
				case 5:
					if (client_streaming$count != 0) {
						throw new flash.errors.IOError('Bad data format: MethodDescriptorProto.clientStreaming cannot be set twice.');
					}
					++client_streaming$count;
					this.clientStreaming = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 6:
					if (server_streaming$count != 0) {
						throw new flash.errors.IOError('Bad data format: MethodDescriptorProto.serverStreaming cannot be set twice.');
					}
					++server_streaming$count;
					this.serverStreaming = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
