package taven.input
{
	import flash.display.InteractiveObject;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.KeyboardEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.ui.Keyboard;

	/**
	 *
	 * @author lynx
	 */
	public class KeyboardManager extends EventDispatcher
	{
		private static var _instance:KeyboardManager = new KeyboardManager();
		//
		private var _inputObj:InteractiveObject;
		private var _stage:Stage;

		public static function get instance():KeyboardManager
		{
			return _instance;
		}

		public function KeyboardManager()
		{
			if (_instance != null)
				throw new Error();
		}

		public function init(inputObj:InteractiveObject):void
		{
			if (_inputObj != null)
			{
				_inputObj.removeEventListener(KeyboardEvent.KEY_DOWN, _keyDownHandler);
				_inputObj.removeEventListener(KeyboardEvent.KEY_UP, _keyUpHandler);
				_stage = null;
			}
			_inputObj = inputObj;
			if (_inputObj != null)
			{
				_stage = _inputObj.stage;
				_inputObj.addEventListener(KeyboardEvent.KEY_DOWN, _keyDownHandler);
				_inputObj.addEventListener(KeyboardEvent.KEY_UP, _keyUpHandler);
			}
		}

		private function _keyDownHandler(e:KeyboardEvent):void
		{
			dispatchEvent(e);
		}

		private function _keyUpHandler(e:KeyboardEvent):void
		{
			dispatchEvent(e);
		}

		public override function dispatchEvent(e:Event):Boolean
		{
			var tf:TextField = _stage.focus as TextField;
			if (tf != null && tf.type == TextFieldType.INPUT)
				return false;
			return super.dispatchEvent(e);
		}
	}
}
