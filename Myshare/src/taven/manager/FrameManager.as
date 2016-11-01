package taven.manager
{
	import taven.dataset.HashMap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.getTimer;
	
	/**
	 * 帧管理器
	 * @author Taven
	 * 可以注册帧响应回调与定时器的响应回调
	 */
	public class FrameManager
	{
		// 当前时间
		private static var _tick:int;
		// 最后一次时间
		private static var _lastTick:int = 0;
		// 当前日期与时间
		private static var _now:Date;
		// 用于侦听帧事件
		private static var _obj:Sprite;
		// 帧回调项的列表
		private static var _frameItemMap:HashMap;
		// 定时回调项的列表
		private static var _tickItemMap:HashMap;
		// 数帧回调项的列表
		private static var _delayFrameItemMap:HashMap;
		// 帧频
		private static var _fps:uint;
		private static var _fpsDelay:uint = 0;
		private static var _fpsLast:uint = 0;
		
		public function FrameManager(blocker:Blocker)
		{
		}
		
		initialize();
		
		private static function initialize():void
		{
			_obj = new Sprite();
			_obj.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
			_tick = getTimer();
			_lastTick = _tick;
			_fpsLast = _tick;
			_now = new Date();
			_frameItemMap = new HashMap();
			_tickItemMap = new HashMap();
			_delayFrameItemMap = new HashMap();
		}
		
		/**
		 * 增加一个定时回调的侦听
		 * @param delay
		 * @param callback
		 * @param args
		 * @param repeat	0为不限制次数, >0限制次数并最后自动移除
		 */
		public static function addTickListener(delay:int, callback:Function, args:* = null, repeat:int = 0):void
		{
			if (delay > 0 && callback != null)
			{
				if (!_tickItemMap.containsKey(callback))
				{
					var item:FrameItem = new FrameItem();
					item.delay = delay;
					item.args = args;
					item.last = _tick;
					item.repeat = repeat;
					_tickItemMap.add(callback, item);
				}
			}
		}
		
		/**
		 * 移除定时回调的侦听
		 * @param callback
		 * 
		 */
		public static function removeTickListener(callback:Function):void
		{
			_tickItemMap.remove(callback);
		}
		
		/**
		 * 增加每帧回调的侦听
		 * @param callback
		 * @param args
		 * @param repeat	0为不限制次数, >0限制次数并最后自动移除
		 */
		public static function addFrameListener(callback:Function, args:* = null, repeat:int = 0):void
		{
			if (callback != null)
			{
				if (!_frameItemMap.containsKey(callback))
				{
					var item:FrameItem = new FrameItem();
					item.args = args;
					item.repeat = repeat;
					_frameItemMap.add(callback, item);
				}
			}
		}
		
		/**
		 * 移除每帧回调的侦听
		 * @param callback
		 * 
		 */
		public static function removeFrameListener(callback:Function):void
		{
			_frameItemMap.remove(callback);
		}
		
		
		/**
		 * 增加数帧后的回调
		 * @param callback
		 * @param args
		 * @param delayFrames	delayFrames帧后回调并最后自动移除
		 */
		public static function addDelayFramesListener(callback:Function, args:* = null, delayFrames:int = 1):void
		{
			if(callback != null)
			{
				if(!_delayFrameItemMap.containsKey(callback))
				{
					var item:FrameItem = new FrameItem();
					item.args = args;
					item.repeat = delayFrames;
					_delayFrameItemMap.add(callback, item);
				}
			}
		}
		
		public static function removeDelayFrameListener(callback:Function):void
		{
			_delayFrameItemMap.remove(callback);
		}
		
		private static function enterFrameHandler(event:Event):void
		{
			_tick = getTimer();
			_fpsDelay++;
			if (_fpsDelay >= 10)
			{
				_fpsDelay = 0;
				_fps = int(10000 / (_tick - _fpsLast));
				_fpsLast = _tick;
			}

			_now.time += (_tick - _lastTick);
			_lastTick = _tick;
			_tickItemMap.eachKey(tickItemHandler);
			_frameItemMap.eachKey(frameItemHandler);
			_delayFrameItemMap.eachKey(delayFrameItemHandler);
		}
		
		private static function tickItemHandler(callback:Function):void
		{
			var item:FrameItem = _tickItemMap.getValue(callback);
			if (_tick - item.last >= item.delay)
			{
				item.last = _tick;
				(item.args != null && callback.length > 0) ? callback(item.args) : callback();
				if (item.repeat > 0)
				{
					(item.repeat == 1) ? removeTickListener(callback) : item.repeat--;
				}
			}
		}
		
		private static function frameItemHandler(callback:Function):void
		{
			var item:FrameItem = _frameItemMap.getValue(callback);
			(item.args != null && callback.length > 0) ? callback(item.args) : callback();
			if (item.repeat > 0)
			{
				(item.repeat == 1) ? removeFrameListener(callback) : item.repeat--;
			}
		}
		
		private static function delayFrameItemHandler(callback:Function):void
		{
			var item:FrameItem = _delayFrameItemMap.getValue(callback);
			if (item.repeat > 0)
			{
				item.repeat--;
			}
			else
			{
				(item.args != null && callback.length > 0) ? callback(item.args) : callback();
				removeDelayFrameListener(callback);
			}
		}
		
		public static function syncTime(time:Number):void
		{
			_now.time = time;
		}

		public static function get now():Date
		{
			return _now;
		}

		public static function get tick():int
		{
			return _tick;
		}
		
		public static function get fps():uint
		{
			return _fps;
		}
	}
}

class Blocker{}

class FrameItem
{
	public var args:* = null;
	public var delay:int = 0;
	public var repeat:int = 0;
	public var last:int = 0;
}