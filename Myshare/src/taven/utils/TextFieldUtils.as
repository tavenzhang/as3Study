package taven.utils
{
	import taven.ClientCore;
	
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	/**
	 * 文本工具类
	 * @author Taven
	 */
	public class TextFieldUtils 
	{
		/**
		 * 创建一个自定义的文本对象
		 * @param size
		 * @param color
		 * @param bold
		 * @return 
		 * 
		 */
		public static function createTextField(size:int = 12, color:int = 0xff3399, bold:Boolean = false):TextField
		{
			var textField:TextField = new TextField();
			textField.wordWrap = false;
			textField.autoSize = TextFieldAutoSize.LEFT;
			
			var textFormat:TextFormat = textField.defaultTextFormat;
			textFormat.size = size;
			textFormat.color = color;
			textFormat.bold = bold;
			textField.defaultTextFormat = textFormat;
			return textField;
		}
		
		/**
		 * 焦点设置出现光标并移至最后
		 * @param textField
		 */
		public static function focusAndCaretToLast(textField:TextField):void
		{
			ClientCore.stage.focus = textField;
			textField.setSelection(textField.text.length, textField.text.length);
		}
		
		/**
		 * 重置文本框的字母间距
		 * @param	textField
		 */
		public static function setTextFieldSpace(textField:TextField, space:int):void
		{
			var textFormat:TextFormat = textField.defaultTextFormat;
			textFormat.letterSpacing = space;
			textField.defaultTextFormat = textFormat;
		}
		
		/**
		 * 设置文本框的字母颜色
		 * @param textField
		 * @param color
		 */
		public static function setTextFieldColor(textField:TextField, color:int):void
		{
			var textFormat:TextFormat = textField.defaultTextFormat;
			textFormat.color = color;
			textField.defaultTextFormat = textFormat;
		}
		
		/**
		 * 清理掉相关Html的内容
		 * @param text
		 * @return 
		 */
		public static function clearHtmlText(text:String):String
		{
			var textField:TextField = new TextField();
			textField.htmlText = text;
			return StringUtils.replace(textField.text, " ", "");
		}
	}
}
