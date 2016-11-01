package google.protobuf.SourceCodeInfo {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class Location extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const PATH:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("google.protobuf.SourceCodeInfo.Location.path", "path", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		[ArrayElementType("int")]
		public var path:Array = [];

		/**
		 *  @private
		 */
		public static const SPAN:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("google.protobuf.SourceCodeInfo.Location.span", "span", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		[ArrayElementType("int")]
		public var span:Array = [];

		/**
		 *  @private
		 */
		public static const LEADING_COMMENTS:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("google.protobuf.SourceCodeInfo.Location.leading_comments", "leadingComments", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var leading_comments$field:String;

		public function clearLeadingComments():void {
			leading_comments$field = null;
		}

		public function get hasLeadingComments():Boolean {
			return leading_comments$field != null;
		}

		public function set leadingComments(value:String):void {
			leading_comments$field = value;
		}

		public function get leadingComments():String {
			return leading_comments$field;
		}

		/**
		 *  @private
		 */
		public static const TRAILING_COMMENTS:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("google.protobuf.SourceCodeInfo.Location.trailing_comments", "trailingComments", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var trailing_comments$field:String;

		public function clearTrailingComments():void {
			trailing_comments$field = null;
		}

		public function get hasTrailingComments():Boolean {
			return trailing_comments$field != null;
		}

		public function set trailingComments(value:String):void {
			trailing_comments$field = value;
		}

		public function get trailingComments():String {
			return trailing_comments$field;
		}

		/**
		 *  @private
		 */
		public static const LEADING_DETACHED_COMMENTS:RepeatedFieldDescriptor$TYPE_STRING = new RepeatedFieldDescriptor$TYPE_STRING("google.protobuf.SourceCodeInfo.Location.leading_detached_comments", "leadingDetachedComments", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		[ArrayElementType("String")]
		public var leadingDetachedComments:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (this.path != null && this.path.length > 0) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.writePackedRepeated(output, com.netease.protobuf.WriteUtils.write$TYPE_INT32, this.path);
			}
			if (this.span != null && this.span.length > 0) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.writePackedRepeated(output, com.netease.protobuf.WriteUtils.write$TYPE_INT32, this.span);
			}
			if (hasLeadingComments) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, leading_comments$field);
			}
			if (hasTrailingComments) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, trailing_comments$field);
			}
			for (var leadingDetachedComments$index:uint = 0; leadingDetachedComments$index < this.leadingDetachedComments.length; ++leadingDetachedComments$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.leadingDetachedComments[leadingDetachedComments$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var leading_comments$count:uint = 0;
			var trailing_comments$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT32, this.path);
						break;
					}
					this.path.push(com.netease.protobuf.ReadUtils.read$TYPE_INT32(input));
					break;
				case 2:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT32, this.span);
						break;
					}
					this.span.push(com.netease.protobuf.ReadUtils.read$TYPE_INT32(input));
					break;
				case 3:
					if (leading_comments$count != 0) {
						throw new flash.errors.IOError('Bad data format: Location.leadingComments cannot be set twice.');
					}
					++leading_comments$count;
					this.leadingComments = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					if (trailing_comments$count != 0) {
						throw new flash.errors.IOError('Bad data format: Location.trailingComments cannot be set twice.');
					}
					++trailing_comments$count;
					this.trailingComments = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 6:
					this.leadingDetachedComments.push(com.netease.protobuf.ReadUtils.read$TYPE_STRING(input));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
