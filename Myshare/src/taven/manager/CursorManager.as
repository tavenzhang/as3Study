package taven.manager
{
	import taven.ClientCore;
	import taven.utils.DisplayUtils;
	
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;

	/**
	 * 光标的管理器
	 * @author Taven
	 */
	public class CursorManager
	{
		// 指针的字典
		private static var _cursorMap:Array = [];
		// 显示容器
		private static var _viewContainer:Sprite;
		// 当前
		private static var _currentCursorView:Bitmap;
		//**当前的光标类型*/
		private static var _curCursor:String; 
		
		initialize();
		private static function initialize():void
		{
			_viewContainer = new Sprite();
			_viewContainer.mouseEnabled = false;
			_viewContainer.mouseChildren = false;
		}
		
		public static function setupCursor(type:String, cursorView:MovieClip):void
		{
			_cursorMap[type] = DisplayUtils.copyDisplayAsBmp(cursorView);
		}
		
		private static function viewMouseMoveHandler(event:MouseEvent):void
		{
			_viewContainer.x = event.stageX;
			_viewContainer.y = event.stageY;
			if(!_viewContainer.visible)
				_viewContainer.visible=true;
		}
		
		/**
		 * 显示
		 * @param	type
		 */
		public static function showCursor(type:String):void
		{
			if (type)
			{
				_curCursor = type
				_viewContainer.removeChildren();
				_currentCursorView = _cursorMap[type];
				_viewContainer.addChild(_currentCursorView);
				//_currentCursorView.gotoAndPlay(1);
				Mouse.hide();
				ClientCore.stage.addChild(_viewContainer);
				ClientCore.stage.addEventListener(MouseEvent.MOUSE_MOVE, viewMouseMoveHandler);
			}
			else
			{
				hideCursor();
			}
		}
		
		public static function hideCursor():void
		{
			_curCursor = ""
			DisplayUtils.removeFromParent(_viewContainer);
			/*if (_currentCursorView)
			{
				//_currentCursorView.stop();
			}*/
			Mouse.show();
			ClientCore.stage.removeEventListener(MouseEvent.MOUSE_MOVE, viewMouseMoveHandler);
		}

		
		public static function showCustomCursion(displayObj:Bitmap,type:String="coustom"):void
		{
			_curCursor= type;
			_viewContainer.removeChildren();
			_currentCursorView = displayObj;
			_viewContainer.addChild(_currentCursorView);
			_viewContainer.visible =false; 
			Mouse.hide();
			ClientCore.stage.addChild(_viewContainer);
			ClientCore.stage.addEventListener(MouseEvent.MOUSE_MOVE, viewMouseMoveHandler);
		}
		
		/**当前的光标类型*/
		public static function get curCursor():String
		{
			return _curCursor;
		}

	}
}