package taven.entity.event
{
	import flash.events.Event;
	import flash.geom.Point;
	
	/**
	 * 可移动实体的事件
	 * @author Taven
	 */
	public class MoveEntityEvent extends Event 
	{
		// 开始行走
		public static const START_MOVE:String = "start move";
		// 行走结束
		public static const END_MOVE:String = "end move";
		
		private var _position:Point;
		
		public function MoveEntityEvent(type:String, position:Point = null, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			_position = position;
			super(type, bubbles, cancelable);
		}
		
		public override function clone():Event 
		{ 
			return new MoveEntityEvent(type, position, bubbles, cancelable);
		}
		
		public function get position():Point
		{
			return _position;
		}
	}
}