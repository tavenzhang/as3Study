package taven.utils
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.utils.Dictionary;
	
	/**
	 * 调试用弹窗
	 * @author	Rock
	 */
	public class AlertUtils
	{
		// 所有MessageBox的列表
		private static var _messageList:Dictionary = new Dictionary();
		
		/**
		 * 显示一个MessageBox
		 * @param	text	文本内容
		 * @param	color	字体颜色
		 */
		public static function show(stage:Stage, text:String, color:int = 0xff0000):void
		{
			// 内容文本
			var textField:TextField = createTextField(text, color);
			textField.x = 25;
			textField.y = 25;
			
			var width:int = textField.width + 50;
			var height:int = 100;
			
			var container:Sprite = new Sprite();
			var backBitmap:Bitmap = new Bitmap();
			var backBitmapData:BitmapData = new BitmapData(stage.stageWidth, stage.stageHeight, true, 0x33ffffff);
			backBitmap.bitmapData = backBitmapData;
			
			var frame:Sprite = new Sprite();
			var frameBitmap:Bitmap = new Bitmap();
			var frameBitmapData:BitmapData = new BitmapData(width - 1, height - 1, true, 0x88ffffff);
			frameBitmap.bitmapData = frameBitmapData;
			frame.addChild(frameBitmap);
			
			// 确定按钮
			var button:SimpleButton = createButton("OK");
			button.x = (width - button.width) / 2;
			button.y = height - button.height - 10;
			button.addEventListener(MouseEvent.CLICK, onMouseClick);
			
			frame.addChild(textField);
			frame.addChild(button);
			
			frame.x = (stage.stageWidth - frame.width) / 2;
			frame.y = (stage.stageHeight - frame.height) / 2;
			
			frame.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			frame.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			
			container.addChild(backBitmap);
			container.addChild(frame);
			
			stage.addChild(container);
			_messageList[button] = container;
		}
		
		/**
		 * 创建显示Message的TextField
		 * @param	alertOptions
		 * @return
		 */
		private static function createTextField(text:String, color:int):TextField
		{
			var myTextField:TextField = new TextField();
			myTextField.mouseEnabled = false;
			myTextField.textColor = color;
			myTextField.multiline = true;
			myTextField.selectable = false;
			myTextField.autoSize = TextFieldAutoSize.CENTER;	
			myTextField.htmlText = '<font face="Verdana">' + text + '</font>';
			myTextField.filters = [new DropShadowFilter(0, 0, 0, 1, 2, 2, 1000)];
			return myTextField;
		}
		
		/**
		 * 创建一个按钮上的文本
		 * @param	text	文本内容
		 * @return	文本对象
		 */
		private static function createButtonTextField(text:String):TextField
		{
			var myTextField:TextField = new TextField();
			myTextField.textColor = 0xff000000;
			myTextField.selectable = false;
			myTextField.width = 50;
			myTextField.height = 20;
			
			var myTextFormat:TextFormat = new TextFormat();
			myTextFormat.align = TextFormatAlign.CENTER;
			myTextField.defaultTextFormat = myTextFormat;
			text = "<b>" + text + "</b>";
			
			myTextField.htmlText = '<font face="Verdana">' + text + '</font>';
			
			return myTextField;
		}
		
		/**
		 * 创建一个按钮
		 * @return
		 */
		private static function createButton(text:String):SimpleButton
		{
			var btnUpState:Sprite = new Sprite();
			btnUpState.graphics.lineStyle(1, 0xff000000);
			btnUpState.graphics.beginFill(0xffbbbbbb);
			btnUpState.graphics.drawRect(0, 0, 50, 20);
			btnUpState.graphics.endFill();
			var textUpState:TextField = createButtonTextField(text);
			textUpState.x = (btnUpState.width - textUpState.width) / 2;
			btnUpState.addChild(textUpState);
			
			var btnOverState:Sprite = new Sprite();
			btnOverState.graphics.lineStyle(1, 0xff000000);
			btnOverState.graphics.beginFill(0xffdddddd);
			btnOverState.graphics.drawRect(0, 0, 50, 20);
			btnOverState.graphics.endFill();
			var textOverState:TextField = createButtonTextField(text);
			textOverState.x = (btnOverState.width - textOverState.width) / 2;
			btnOverState.addChild(textOverState)
			
			var btnDownState:Sprite = new Sprite();
			btnDownState.graphics.lineStyle(1, 0xff000000);
			btnDownState.graphics.beginFill(0xff999999);
			btnDownState.graphics.drawRect(0, 0, 50, 20);
			btnDownState.graphics.endFill();
			var textDownState:TextField = createButtonTextField(text);
			textDownState.x = (btnDownState.width - textDownState.width) / 2;
			btnDownState.addChild(textDownState)
			
			var myButton:SimpleButton = new SimpleButton(btnUpState, btnOverState, btnDownState, btnOverState);
			myButton.name = text;
			return myButton;
		}
		
		/**
		 * 鼠标按下响应: 开始拖动
		 * @param	e
		 */
		private static function onMouseDown(event:MouseEvent):void
		{
			if (event.target is Sprite)
			{
				(event.target as Sprite).startDrag();
			}
		}
		
		/**
		 * 鼠标弹起响应: 停止拖动
		 * @param	e
		 */
		private static function onMouseUp(event:MouseEvent):void
		{
			if (event.target is Sprite)
			{
				(event.target as Sprite).stopDrag();
			}
		}
		
		/**
		 * 点击按钮响应: 关闭当前MessageBox
		 * @param	e
		 */
		private static function onMouseClick(event:MouseEvent):void
		{
			if (event.target is SimpleButton)
			{
				var container:Sprite = _messageList[event.target];
				if (container)
				{
					if (container.parent)
					{
						container.parent.removeChild(container);
					}
					_messageList[event.target] = null;
					delete _messageList[event.target];
				}
			}
		}
	}
}