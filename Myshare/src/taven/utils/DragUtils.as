package taven.utils
{
	import taven.ClientCore;
	
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.Dictionary;
	
	/**
	 * 拖动工具
	 * @author Taven
	 */
	public class DragUtils extends Object 
	{
		private static var _dragViewMap:Dictionary = new Dictionary();
		private static var _dragTarget:DisplayObject;
		private static var _startPosition:Point = new Point();
		private static var _viewPosition:Point = new Point();
		
		initialize();
		private static function initialize():void
		{
			ClientCore.stage.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
		}
		
		public static function addViewController(viewController:DisplayObject, view:DisplayObject):void
		{
			_dragViewMap[viewController] = view;
		}
		
		public static function removeViewController(viewController:DisplayObject):void
		{
			_dragViewMap[viewController] = null;
			delete _dragViewMap[viewController];
		}

		private static function mouseDownHandler(event:MouseEvent):void
		{
			var view:DisplayObject = _dragViewMap[event.target] as DisplayObject;
			if (view)
			{
				_dragTarget = event.target as DisplayObject;
				ClientCore.stage.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
				ClientCore.stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
				
				_startPosition.x = event.stageX;
				_startPosition.y = event.stageY;
				_viewPosition.x = view.x;
				_viewPosition.y = view.y;
			}
		}
		
		private static function mouseUpHandler(event:MouseEvent):void
		{
			_dragTarget = null;
			ClientCore.stage.removeEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
			ClientCore.stage.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
		}
		
		private static function mouseMoveHandler(event:MouseEvent):void
		{
			if (_dragTarget)
			{
				var view:DisplayObject = _dragViewMap[_dragTarget] as DisplayObject;
				view.x = _viewPosition.x + (event.stageX - _startPosition.x);
				view.y = _viewPosition.y + (event.stageY - _startPosition.y);
				
				/*var bounds:Rectangle = view.getRect(view);
				view.x = Math.max(view.x, -bounds.x);
				view.y = Math.max(view.y, -bounds.y);
				view.x = Math.min(view.x, ClientCore.stage.stageWidth - bounds.width - bounds.x);
				view.y = Math.min(view.y, ClientCore.stage.stageHeight - bounds.height - bounds.y);*/
			}
		}
	}
}