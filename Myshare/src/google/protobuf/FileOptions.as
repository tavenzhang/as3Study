package google.protobuf {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import google.protobuf.UninterpretedOption;
	import google.protobuf.FileOptions.OptimizeMode;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class FileOptions extends com.netease.protobuf.Message {
		[ArrayElementType("Function")]
		public static const extensionReadFunctions:Array = [];

		/**
		 *  @private
		 */
		public static const JAVA_PACKAGE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("google.protobuf.FileOptions.java_package", "javaPackage", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var java_package$field:String;

		public function clearJavaPackage():void {
			java_package$field = null;
		}

		public function get hasJavaPackage():Boolean {
			return java_package$field != null;
		}

		public function set javaPackage(value:String):void {
			java_package$field = value;
		}

		public function get javaPackage():String {
			return java_package$field;
		}

		/**
		 *  @private
		 */
		public static const JAVA_OUTER_CLASSNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("google.protobuf.FileOptions.java_outer_classname", "javaOuterClassname", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var java_outer_classname$field:String;

		public function clearJavaOuterClassname():void {
			java_outer_classname$field = null;
		}

		public function get hasJavaOuterClassname():Boolean {
			return java_outer_classname$field != null;
		}

		public function set javaOuterClassname(value:String):void {
			java_outer_classname$field = value;
		}

		public function get javaOuterClassname():String {
			return java_outer_classname$field;
		}

		/**
		 *  @private
		 */
		public static const JAVA_MULTIPLE_FILES:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("google.protobuf.FileOptions.java_multiple_files", "javaMultipleFiles", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var java_multiple_files$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearJavaMultipleFiles():void {
			hasField$0 &= 0xfffffffe;
			java_multiple_files$field = new Boolean();
		}

		public function get hasJavaMultipleFiles():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set javaMultipleFiles(value:Boolean):void {
			hasField$0 |= 0x1;
			java_multiple_files$field = value;
		}

		public function get javaMultipleFiles():Boolean {
			if(!hasJavaMultipleFiles) {
				return false;
			}
			return java_multiple_files$field;
		}

		/**
		 *  @private
		 */
		public static const JAVA_GENERATE_EQUALS_AND_HASH:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("google.protobuf.FileOptions.java_generate_equals_and_hash", "javaGenerateEqualsAndHash", (20 << 3) | com.netease.protobuf.WireType.VARINT);

		private var java_generate_equals_and_hash$field:Boolean;

		public function clearJavaGenerateEqualsAndHash():void {
			hasField$0 &= 0xfffffffd;
			java_generate_equals_and_hash$field = new Boolean();
		}

		public function get hasJavaGenerateEqualsAndHash():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set javaGenerateEqualsAndHash(value:Boolean):void {
			hasField$0 |= 0x2;
			java_generate_equals_and_hash$field = value;
		}

		public function get javaGenerateEqualsAndHash():Boolean {
			if(!hasJavaGenerateEqualsAndHash) {
				return false;
			}
			return java_generate_equals_and_hash$field;
		}

		/**
		 *  @private
		 */
		public static const JAVA_STRING_CHECK_UTF8:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("google.protobuf.FileOptions.java_string_check_utf8", "javaStringCheckUtf8", (27 << 3) | com.netease.protobuf.WireType.VARINT);

		private var java_string_check_utf8$field:Boolean;

		public function clearJavaStringCheckUtf8():void {
			hasField$0 &= 0xfffffffb;
			java_string_check_utf8$field = new Boolean();
		}

		public function get hasJavaStringCheckUtf8():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set javaStringCheckUtf8(value:Boolean):void {
			hasField$0 |= 0x4;
			java_string_check_utf8$field = value;
		}

		public function get javaStringCheckUtf8():Boolean {
			if(!hasJavaStringCheckUtf8) {
				return false;
			}
			return java_string_check_utf8$field;
		}

		/**
		 *  @private
		 */
		public static const OPTIMIZE_FOR:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("google.protobuf.FileOptions.optimize_for", "optimizeFor", (9 << 3) | com.netease.protobuf.WireType.VARINT, google.protobuf.FileOptions.OptimizeMode);

		private var optimize_for$field:int;

		public function clearOptimizeFor():void {
			hasField$0 &= 0xfffffff7;
			optimize_for$field = new int();
		}

		public function get hasOptimizeFor():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set optimizeFor(value:int):void {
			hasField$0 |= 0x8;
			optimize_for$field = value;
		}

		public function get optimizeFor():int {
			if(!hasOptimizeFor) {
				return google.protobuf.FileOptions.OptimizeMode.SPEED;
			}
			return optimize_for$field;
		}

		/**
		 *  @private
		 */
		public static const GO_PACKAGE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("google.protobuf.FileOptions.go_package", "goPackage", (11 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var go_package$field:String;

		public function clearGoPackage():void {
			go_package$field = null;
		}

		public function get hasGoPackage():Boolean {
			return go_package$field != null;
		}

		public function set goPackage(value:String):void {
			go_package$field = value;
		}

		public function get goPackage():String {
			return go_package$field;
		}

		/**
		 *  @private
		 */
		public static const CC_GENERIC_SERVICES:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("google.protobuf.FileOptions.cc_generic_services", "ccGenericServices", (16 << 3) | com.netease.protobuf.WireType.VARINT);

		private var cc_generic_services$field:Boolean;

		public function clearCcGenericServices():void {
			hasField$0 &= 0xffffffef;
			cc_generic_services$field = new Boolean();
		}

		public function get hasCcGenericServices():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set ccGenericServices(value:Boolean):void {
			hasField$0 |= 0x10;
			cc_generic_services$field = value;
		}

		public function get ccGenericServices():Boolean {
			if(!hasCcGenericServices) {
				return false;
			}
			return cc_generic_services$field;
		}

		/**
		 *  @private
		 */
		public static const JAVA_GENERIC_SERVICES:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("google.protobuf.FileOptions.java_generic_services", "javaGenericServices", (17 << 3) | com.netease.protobuf.WireType.VARINT);

		private var java_generic_services$field:Boolean;

		public function clearJavaGenericServices():void {
			hasField$0 &= 0xffffffdf;
			java_generic_services$field = new Boolean();
		}

		public function get hasJavaGenericServices():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set javaGenericServices(value:Boolean):void {
			hasField$0 |= 0x20;
			java_generic_services$field = value;
		}

		public function get javaGenericServices():Boolean {
			if(!hasJavaGenericServices) {
				return false;
			}
			return java_generic_services$field;
		}

		/**
		 *  @private
		 */
		public static const PY_GENERIC_SERVICES:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("google.protobuf.FileOptions.py_generic_services", "pyGenericServices", (18 << 3) | com.netease.protobuf.WireType.VARINT);

		private var py_generic_services$field:Boolean;

		public function clearPyGenericServices():void {
			hasField$0 &= 0xffffffbf;
			py_generic_services$field = new Boolean();
		}

		public function get hasPyGenericServices():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set pyGenericServices(value:Boolean):void {
			hasField$0 |= 0x40;
			py_generic_services$field = value;
		}

		public function get pyGenericServices():Boolean {
			if(!hasPyGenericServices) {
				return false;
			}
			return py_generic_services$field;
		}

		/**
		 *  @private
		 */
		public static const DEPRECATED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("google.protobuf.FileOptions.deprecated", "deprecated", (23 << 3) | com.netease.protobuf.WireType.VARINT);

		private var deprecated$field:Boolean;

		public function clearDeprecated():void {
			hasField$0 &= 0xffffff7f;
			deprecated$field = new Boolean();
		}

		public function get hasDeprecated():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set deprecated(value:Boolean):void {
			hasField$0 |= 0x80;
			deprecated$field = value;
		}

		public function get deprecated():Boolean {
			if(!hasDeprecated) {
				return false;
			}
			return deprecated$field;
		}

		/**
		 *  @private
		 */
		public static const CC_ENABLE_ARENAS:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("google.protobuf.FileOptions.cc_enable_arenas", "ccEnableArenas", (31 << 3) | com.netease.protobuf.WireType.VARINT);

		private var cc_enable_arenas$field:Boolean;

		public function clearCcEnableArenas():void {
			hasField$0 &= 0xfffffeff;
			cc_enable_arenas$field = new Boolean();
		}

		public function get hasCcEnableArenas():Boolean {
			return (hasField$0 & 0x100) != 0;
		}

		public function set ccEnableArenas(value:Boolean):void {
			hasField$0 |= 0x100;
			cc_enable_arenas$field = value;
		}

		public function get ccEnableArenas():Boolean {
			if(!hasCcEnableArenas) {
				return false;
			}
			return cc_enable_arenas$field;
		}

		/**
		 *  @private
		 */
		public static const OBJC_CLASS_PREFIX:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("google.protobuf.FileOptions.objc_class_prefix", "objcClassPrefix", (36 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var objc_class_prefix$field:String;

		public function clearObjcClassPrefix():void {
			objc_class_prefix$field = null;
		}

		public function get hasObjcClassPrefix():Boolean {
			return objc_class_prefix$field != null;
		}

		public function set objcClassPrefix(value:String):void {
			objc_class_prefix$field = value;
		}

		public function get objcClassPrefix():String {
			return objc_class_prefix$field;
		}

		/**
		 *  @private
		 */
		public static const CSHARP_NAMESPACE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("google.protobuf.FileOptions.csharp_namespace", "csharpNamespace", (37 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var csharp_namespace$field:String;

		public function clearCsharpNamespace():void {
			csharp_namespace$field = null;
		}

		public function get hasCsharpNamespace():Boolean {
			return csharp_namespace$field != null;
		}

		public function set csharpNamespace(value:String):void {
			csharp_namespace$field = value;
		}

		public function get csharpNamespace():String {
			return csharp_namespace$field;
		}

		/**
		 *  @private
		 */
		public static const UNINTERPRETED_OPTION:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("google.protobuf.FileOptions.uninterpreted_option", "uninterpretedOption", (999 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return google.protobuf.UninterpretedOption; });

		[ArrayElementType("google.protobuf.UninterpretedOption")]
		public var uninterpretedOption:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasJavaPackage) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, java_package$field);
			}
			if (hasJavaOuterClassname) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, java_outer_classname$field);
			}
			if (hasJavaMultipleFiles) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, java_multiple_files$field);
			}
			if (hasJavaGenerateEqualsAndHash) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 20);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, java_generate_equals_and_hash$field);
			}
			if (hasJavaStringCheckUtf8) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 27);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, java_string_check_utf8$field);
			}
			if (hasOptimizeFor) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, optimize_for$field);
			}
			if (hasGoPackage) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, go_package$field);
			}
			if (hasCcGenericServices) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 16);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, cc_generic_services$field);
			}
			if (hasJavaGenericServices) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 17);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, java_generic_services$field);
			}
			if (hasPyGenericServices) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 18);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, py_generic_services$field);
			}
			if (hasDeprecated) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 23);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, deprecated$field);
			}
			if (hasCcEnableArenas) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 31);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, cc_enable_arenas$field);
			}
			if (hasObjcClassPrefix) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 36);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, objc_class_prefix$field);
			}
			if (hasCsharpNamespace) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 37);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, csharp_namespace$field);
			}
			for (var uninterpretedOption$index:uint = 0; uninterpretedOption$index < this.uninterpretedOption.length; ++uninterpretedOption$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 999);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.uninterpretedOption[uninterpretedOption$index]);
			}
			for (var fieldKey:* in this) {
				super.writeExtensionOrUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var java_package$count:uint = 0;
			var java_outer_classname$count:uint = 0;
			var java_multiple_files$count:uint = 0;
			var java_generate_equals_and_hash$count:uint = 0;
			var java_string_check_utf8$count:uint = 0;
			var optimize_for$count:uint = 0;
			var go_package$count:uint = 0;
			var cc_generic_services$count:uint = 0;
			var java_generic_services$count:uint = 0;
			var py_generic_services$count:uint = 0;
			var deprecated$count:uint = 0;
			var cc_enable_arenas$count:uint = 0;
			var objc_class_prefix$count:uint = 0;
			var csharp_namespace$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (java_package$count != 0) {
						throw new flash.errors.IOError('Bad data format: FileOptions.javaPackage cannot be set twice.');
					}
					++java_package$count;
					this.javaPackage = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 8:
					if (java_outer_classname$count != 0) {
						throw new flash.errors.IOError('Bad data format: FileOptions.javaOuterClassname cannot be set twice.');
					}
					++java_outer_classname$count;
					this.javaOuterClassname = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 10:
					if (java_multiple_files$count != 0) {
						throw new flash.errors.IOError('Bad data format: FileOptions.javaMultipleFiles cannot be set twice.');
					}
					++java_multiple_files$count;
					this.javaMultipleFiles = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 20:
					if (java_generate_equals_and_hash$count != 0) {
						throw new flash.errors.IOError('Bad data format: FileOptions.javaGenerateEqualsAndHash cannot be set twice.');
					}
					++java_generate_equals_and_hash$count;
					this.javaGenerateEqualsAndHash = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 27:
					if (java_string_check_utf8$count != 0) {
						throw new flash.errors.IOError('Bad data format: FileOptions.javaStringCheckUtf8 cannot be set twice.');
					}
					++java_string_check_utf8$count;
					this.javaStringCheckUtf8 = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 9:
					if (optimize_for$count != 0) {
						throw new flash.errors.IOError('Bad data format: FileOptions.optimizeFor cannot be set twice.');
					}
					++optimize_for$count;
					this.optimizeFor = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 11:
					if (go_package$count != 0) {
						throw new flash.errors.IOError('Bad data format: FileOptions.goPackage cannot be set twice.');
					}
					++go_package$count;
					this.goPackage = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 16:
					if (cc_generic_services$count != 0) {
						throw new flash.errors.IOError('Bad data format: FileOptions.ccGenericServices cannot be set twice.');
					}
					++cc_generic_services$count;
					this.ccGenericServices = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 17:
					if (java_generic_services$count != 0) {
						throw new flash.errors.IOError('Bad data format: FileOptions.javaGenericServices cannot be set twice.');
					}
					++java_generic_services$count;
					this.javaGenericServices = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 18:
					if (py_generic_services$count != 0) {
						throw new flash.errors.IOError('Bad data format: FileOptions.pyGenericServices cannot be set twice.');
					}
					++py_generic_services$count;
					this.pyGenericServices = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 23:
					if (deprecated$count != 0) {
						throw new flash.errors.IOError('Bad data format: FileOptions.deprecated cannot be set twice.');
					}
					++deprecated$count;
					this.deprecated = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 31:
					if (cc_enable_arenas$count != 0) {
						throw new flash.errors.IOError('Bad data format: FileOptions.ccEnableArenas cannot be set twice.');
					}
					++cc_enable_arenas$count;
					this.ccEnableArenas = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 36:
					if (objc_class_prefix$count != 0) {
						throw new flash.errors.IOError('Bad data format: FileOptions.objcClassPrefix cannot be set twice.');
					}
					++objc_class_prefix$count;
					this.objcClassPrefix = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 37:
					if (csharp_namespace$count != 0) {
						throw new flash.errors.IOError('Bad data format: FileOptions.csharpNamespace cannot be set twice.');
					}
					++csharp_namespace$count;
					this.csharpNamespace = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 999:
					this.uninterpretedOption.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new google.protobuf.UninterpretedOption()));
					break;
				default:
					super.readExtensionOrUnknown(extensionReadFunctions, input, tag);
					break;
				}
			}
		}

	}
}
