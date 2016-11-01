package taven.manager
{
	import taven.ClientCore;
	import taven.utils.TextFieldUtils;
	
	import flash.display.InteractiveObject;
	import flash.events.KeyboardEvent;
	import flash.text.TextField;
	import flash.ui.Keyboard;
	
	/**
	 * 焦点管理器
	 * 响应回车键焦点响应
	 * @author Taven
	 */
	public class FocusManager
	{
		private static var _targetList:Array = [];
		
		public static function setup():void
		{
			ClientCore.stage.addEventListener(KeyboardEvent.KEY_DOWN, function(event:KeyboardEvent):void
			{
				if (event.keyCode == Keyboard.ENTER)
				{
					for (var i:int = _targetList.length - 1; i >= 0; i--)
					{
						var target:InteractiveObject = _targetList[i];
						if (target.stage)
						{
							if (ClientCore.stage.focus == target)
							{
								break;
							}
							else
							{
								ClientCore.stage.focus = target;
								if (target is TextField)
								{
									TextFieldUtils.focusAndCaretToLast(target as TextField);
								}
								event.stopImmediatePropagation();
							}
							break;
						}
					}
				}
			});
		}
		
		public static function registerFocus(target:InteractiveObject):void
		{
			if (_targetList.indexOf(target) < 0)
			{
				_targetList.push(target);
			}
		}
		
		public static function unregisterFocus(target:InteractiveObject):void
		{
			var index:int = _targetList.indexOf(target);
			if (index >= 0)
			{
				_targetList.splice(index, 1);
			}
		}
	}
}