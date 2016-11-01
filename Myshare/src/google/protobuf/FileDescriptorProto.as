package google.protobuf {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import google.protobuf.DescriptorProto;
	import google.protobuf.FileOptions;
	import google.protobuf.FieldDescriptorProto;
	import google.protobuf.SourceCodeInfo;
	import google.protobuf.EnumDescriptorProto;
	import google.protobuf.ServiceDescriptorProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class FileDescriptorProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("google.protobuf.FileDescriptorProto.name", "name", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const PACKAGE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("google.protobuf.FileDescriptorProto.package", "__package", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var package$field:String;

		public function clearPackage():void {
			package$field = null;
		}

		public function get hasPackage():Boolean {
			return package$field != null;
		}

		public function set __package(value:String):void {
			package$field = value;
		}

		public function get __package():String {
			return package$field;
		}

		/**
		 *  @private
		 */
		public static const DEPENDENCY:RepeatedFieldDescriptor$TYPE_STRING = new RepeatedFieldDescriptor$TYPE_STRING("google.protobuf.FileDescriptorProto.dependency", "dependency", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		[ArrayElementType("String")]
		public var dependency:Array = [];

		/**
		 *  @private
		 */
		public static const PUBLIC_DEPENDENCY:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("google.protobuf.FileDescriptorProto.public_dependency", "publicDependency", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var publicDependency:Array = [];

		/**
		 *  @private
		 */
		public static const WEAK_DEPENDENCY:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("google.protobuf.FileDescriptorProto.weak_dependency", "weakDependency", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var weakDependency:Array = [];

		/**
		 *  @private
		 */
		public static const MESSAGE_TYPE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("google.protobuf.FileDescriptorProto.message_type", "messageType", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return google.protobuf.DescriptorProto; });

		[ArrayElementType("google.protobuf.DescriptorProto")]
		public var messageType:Array = [];

		/**
		 *  @private
		 */
		public static const ENUM_TYPE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("google.protobuf.FileDescriptorProto.enum_type", "enumType", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return google.protobuf.EnumDescriptorProto; });

		[ArrayElementType("google.protobuf.EnumDescriptorProto")]
		public var enumType:Array = [];

		/**
		 *  @private
		 */
		public static const SERVICE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("google.protobuf.FileDescriptorProto.service", "service", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return google.protobuf.ServiceDescriptorProto; });

		[ArrayElementType("google.protobuf.ServiceDescriptorProto")]
		public var service:Array = [];

		/**
		 *  @private
		 */
		public static const EXTENSION:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("google.protobuf.FileDescriptorProto.extension", "extension", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return google.protobuf.FieldDescriptorProto; });

		[ArrayElementType("google.protobuf.FieldDescriptorProto")]
		public var extension:Array = [];

		/**
		 *  @private
		 */
		public static const OPTIONS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("google.protobuf.FileDescriptorProto.options", "options", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return google.protobuf.FileOptions; });

		private var options$field:google.protobuf.FileOptions;

		public function clearOptions():void {
			options$field = null;
		}

		public function get hasOptions():Boolean {
			return options$field != null;
		}

		public function set options(value:google.protobuf.FileOptions):void {
			options$field = value;
		}

		public function get options():google.protobuf.FileOptions {
			return options$field;
		}

		/**
		 *  @private
		 */
		public static const SOURCE_CODE_INFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("google.protobuf.FileDescriptorProto.source_code_info", "sourceCodeInfo", (9 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return google.protobuf.SourceCodeInfo; });

		private var source_code_info$field:google.protobuf.SourceCodeInfo;

		public function clearSourceCodeInfo():void {
			source_code_info$field = null;
		}

		public function get hasSourceCodeInfo():Boolean {
			return source_code_info$field != null;
		}

		public function set sourceCodeInfo(value:google.protobuf.SourceCodeInfo):void {
			source_code_info$field = value;
		}

		public function get sourceCodeInfo():google.protobuf.SourceCodeInfo {
			return source_code_info$field;
		}

		/**
		 *  @private
		 */
		public static const SYNTAX:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("google.protobuf.FileDescriptorProto.syntax", "syntax", (12 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var syntax$field:String;

		public function clearSyntax():void {
			syntax$field = null;
		}

		public function get hasSyntax():Boolean {
			return syntax$field != null;
		}

		public function set syntax(value:String):void {
			syntax$field = value;
		}

		public function get syntax():String {
			return syntax$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, name$field);
			}
			if (hasPackage) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, package$field);
			}
			for (var dependency$index:uint = 0; dependency$index < this.dependency.length; ++dependency$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.dependency[dependency$index]);
			}
			for (var publicDependency$index:uint = 0; publicDependency$index < this.publicDependency.length; ++publicDependency$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.publicDependency[publicDependency$index]);
			}
			for (var weakDependency$index:uint = 0; weakDependency$index < this.weakDependency.length; ++weakDependency$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.weakDependency[weakDependency$index]);
			}
			for (var messageType$index:uint = 0; messageType$index < this.messageType.length; ++messageType$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.messageType[messageType$index]);
			}
			for (var enumType$index:uint = 0; enumType$index < this.enumType.length; ++enumType$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.enumType[enumType$index]);
			}
			for (var service$index:uint = 0; service$index < this.service.length; ++service$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.service[service$index]);
			}
			for (var extension$index:uint = 0; extension$index < this.extension.length; ++extension$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.extension[extension$index]);
			}
			if (hasOptions) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, options$field);
			}
			if (hasSourceCodeInfo) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, source_code_info$field);
			}
			if (hasSyntax) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, syntax$field);
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
			var package$count:uint = 0;
			var options$count:uint = 0;
			var source_code_info$count:uint = 0;
			var syntax$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: FileDescriptorProto.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (package$count != 0) {
						throw new flash.errors.IOError('Bad data format: FileDescriptorProto.__package cannot be set twice.');
					}
					++package$count;
					this.__package = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					this.dependency.push(com.netease.protobuf.ReadUtils.read$TYPE_STRING(input));
					break;
				case 10:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT32, this.publicDependency);
						break;
					}
					this.publicDependency.push(com.netease.protobuf.ReadUtils.read$TYPE_INT32(input));
					break;
				case 11:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT32, this.weakDependency);
						break;
					}
					this.weakDependency.push(com.netease.protobuf.ReadUtils.read$TYPE_INT32(input));
					break;
				case 4:
					this.messageType.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new google.protobuf.DescriptorProto()));
					break;
				case 5:
					this.enumType.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new google.protobuf.EnumDescriptorProto()));
					break;
				case 6:
					this.service.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new google.protobuf.ServiceDescriptorProto()));
					break;
				case 7:
					this.extension.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new google.protobuf.FieldDescriptorProto()));
					break;
				case 8:
					if (options$count != 0) {
						throw new flash.errors.IOError('Bad data format: FileDescriptorProto.options cannot be set twice.');
					}
					++options$count;
					this.options = new google.protobuf.FileOptions();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.options);
					break;
				case 9:
					if (source_code_info$count != 0) {
						throw new flash.errors.IOError('Bad data format: FileDescriptorProto.sourceCodeInfo cannot be set twice.');
					}
					++source_code_info$count;
					this.sourceCodeInfo = new google.protobuf.SourceCodeInfo();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.sourceCodeInfo);
					break;
				case 12:
					if (syntax$count != 0) {
						throw new flash.errors.IOError('Bad data format: FileDescriptorProto.syntax cannot be set twice.');
					}
					++syntax$count;
					this.syntax = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
