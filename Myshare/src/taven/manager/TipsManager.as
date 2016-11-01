package taven.manager
{
	import taven.ClientCore;
	import taven.utils.DisplayUtils;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.utils.Dictionary;

	/**
	 * 提示面板的管理器
	 * @author Taven
	 */
	public class TipsManager
	{
		// 默认的
		public static const DEFAULT:int = 0;
		// 精灵的
		public static const PET:int = 1;
		// 道具的
		public static const ITEM:int = 2;		
		// 推荐符文的
		public static const RECOMMENDRUNE:int = 3;
		// 符文的
		public static const RUNE:int = 4;
		// 运宝的
		public static const ESCORT:int = 5;
		// 勇者之剑的
		public static const SWORD:int = 6;
		// 属性
		public static const ATTR:int = 7;
		// 技能
		public static const SKILL:int = 8;
		// 带ICON的
		public static const WITHICON:int = 9;
		// 商城的
		public static const SHOP:int = 10;

		// Tips创建者的字典
		private static var _creatorMap:Array = [];
		// 注意的视图字典
		private static var _viewMap:Dictionary;
		// 显示容器
		private static var _viewContainer:Sprite;
		// 当前显示目标
		private static var _currentTarget:DisplayObject;
		
		initialize();
		private static function initialize():void
		{
			_viewMap = new Dictionary();
			_viewContainer = new Sprite();
			_viewContainer.mouseEnabled = false;
			_viewContainer.mouseChildren = false;
		}
		
		public static function setupCreator(type:int, creator:ITipsCreator):void
		{
			_creatorMap[type] = creator;
		}
		
		public static function register(type:int, view:DisplayObject, args:*):void
		{
			if (!_viewMap[view])
			{
				var item:TipsItem = new TipsItem();
				item.type = type;
				item.args = args;
				_viewMap[view] = item;
				view.addEventListener(MouseEvent.ROLL_OVER, viewMouseOverHandler);
				view.addEventListener(MouseEvent.ROLL_OUT, viewMouseOutHandler);
				//ClientCore.stage.addEventListener(MouseEvent.MOUSE_MOVE, viewMouseMoveHandler);
			}
		}
		
		public static function unRegister(view:DisplayObject):void
		{
			if (_viewMap[view])
			{
				view.removeEventListener(MouseEvent.ROLL_OVER, viewMouseOverHandler);
				view.removeEventListener(MouseEvent.ROLL_OUT, viewMouseOutHandler);
				//ClientCore.stage.removeEventListener(MouseEvent.MOUSE_MOVE, viewMouseMoveHandler);
				if (_currentTarget == view)
				{
					DisplayUtils.removeFromParent(_viewContainer);
					_currentTarget = null;
				}
				var item:TipsItem = _viewMap[view];
				item.args = null;
				_viewMap[view] = null;
				delete _viewMap[view];
			}
		}
		
		private static function viewMouseOverHandler(event:MouseEvent):void
		{
			var view:DisplayObject = event.target as DisplayObject;
			if (view)
			{
				var tipsItem:TipsItem = _viewMap[view];
				if (tipsItem)
				{
					_currentTarget = view;
					showTips(tipsItem);
					ClientCore.stage.addEventListener(MouseEvent.MOUSE_MOVE, viewMouseMoveHandler);
				}
			}
		}
		
		private static function viewMouseMoveHandler(event:MouseEvent):void
		{
			if (_currentTarget)
			{
				updateTipsPosition(_viewContainer);
			}
		}
		
		private static function viewMouseOutHandler(event:MouseEvent):void
		{
			var view:DisplayObject = event.target as DisplayObject;
			if (view)
			{
				if (_currentTarget == view)
				{
					DisplayUtils.removeFromParent(_viewContainer);
					_currentTarget = null;
				}
			}
			ClientCore.stage.removeEventListener(MouseEvent.MOUSE_MOVE, viewMouseMoveHandler);
		}
		
		/**
		 * 主动刷新Tips的内容
		 */
		public static function refreshTips():void
		{
			var tipsItem:TipsItem = _viewMap[_currentTarget];
			if (tipsItem)
			{
				showTips(tipsItem);
			}
		}
		
		/**
		 * 显示Tips
		 * @param	tipsItem
		 */
		private static function showTips(tipsItem:TipsItem):void
		{
			_viewContainer.removeChildren();
			
			var tipsCreator:ITipsCreator = _creatorMap[tipsItem.type];
			if (tipsCreator)
			{
				var view:DisplayObject = tipsCreator.getView(tipsItem.args);
				if (view)
				{
					_viewContainer.addChild(view);
					ClientCore.stage.addChild(_viewContainer);
					updateTipsPosition(_viewContainer);
				}
			}
		}
		
		/**
		 * 更新Tips的位置
		 * @param	view
		 */
		public static function updateTipsPosition(viewContainer:DisplayObject):void
		{
			var rect:Rectangle = viewContainer.getRect(viewContainer);
			viewContainer.x = ClientCore.stage.mouseX - rect.x + 15;
			viewContainer.y = ClientCore.stage.mouseY - rect.y + 15;
			if (viewContainer.y + rect.y + rect.height > ClientCore.stage.stageHeight)
			{
				viewContainer.y = ClientCore.stage.mouseY - rect.y - rect.height - 10;
			}
			
			if (viewContainer.x + rect.x + rect.width > ClientCore.stage.stageWidth)
			{
				viewContainer.x = ClientCore.stage.mouseX - rect.x - rect.width - 10;
			}
		}
	}
}

class TipsItem
{
	public var type:int;
	public var args:*;
}