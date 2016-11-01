package taven.utils
{
	import com.greensock.TweenMax;
	
	import flash.display.DisplayObject;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.GlowFilter;

	/**
	 * 滤镜工具
	 * @author Taven
	 */
	public class FilterUtils
	{
		public static const DEFAULT_FILTER:GlowFilter = new GlowFilter(0x003366, 1, 3, 3, 6, BitmapFilterQuality.LOW);
		
		public static const WHITE_GLOW:GlowFilter = new GlowFilter(0xffffff, 0.8, 6, 6, 5);
		
		// 闪动列表
		private static var _flashList:Array = [];
		
		public static function setGlowFilter(view:DisplayObject):void
		{
			view.filters = [DEFAULT_FILTER];
		}
		
		public static function setWhiteGlowFilter(view:DisplayObject):void
		{
			view.filters = [WHITE_GLOW];
		}
		
		/**
		 * 注册一个对象闪动
		 * @param	displayObject
		 */
		public static function registerFlash(displayObject:DisplayObject, color:int = 0xff3399):void
		{
			if (_flashList.indexOf(displayObject) < 0)
			{
				TweenMax.to(displayObject, 0.5, { glowFilter: { color: color, alpha: 1, blurX: 10, blurY: 10, strength: 2, remove: true }, yoyo: true, repeat: -1 } );
				_flashList.push(displayObject);
			}
		}
		
		/**
		 * 反注册一个对象闪动
		 * @param	displayObject
		 */
		public static function unregisterFlash(displayObject:DisplayObject):void
		{
			if (_flashList.indexOf(displayObject) >= 0)
			{
				TweenMax.killTweensOf(displayObject, true);
				_flashList.splice(_flashList.indexOf(displayObject), 1);
			}
		}
	}
}