package taven.camera
{
	import flash.geom.Rectangle;
	/**
	 * 
	 * @author kramer
	 * 摄像头，地图滚屏的时候，由摄像头控制显示的区间
	 */	
	public class Camera
	{
		private static const OFFSET_X:int = 250;
		private static const OFFSET_Y:int = 150;
		private var _trackTarget:ICameraTarget;
		private var _sceneBoundary:Rectangle;
		
		private var _viewport:Rectangle;
		private var _trackRect:Rectangle;
		
		private var _x:int;
		private var _y:int;
		
		public function Camera(viewport:Rectangle)
		{
			var viewportWidth:int = viewport.width;
			var viewportHeight:int = viewport.height;
			_viewport = new Rectangle(0, 0, viewportWidth, viewportHeight); //可见区域
			_trackRect = new Rectangle(OFFSET_X, OFFSET_Y, viewportWidth - 2* OFFSET_X, viewportHeight - 2*OFFSET_Y); //移动区域
			reset();
		}
		
		public function reset():void
		{
			_x = 0;
			_y = 0;
			_viewport.x = _x;
			_viewport.y = _y;
			_trackRect.x = OFFSET_X;
			_trackRect.y = OFFSET_Y;
		}
		
		public function setTrackTarget(target:ICameraTarget):void
		{
			_trackTarget = target;
		}
		
		public function getTrackTarget():ICameraTarget
		{
			return _trackTarget;
		}
		
		public function setSceneBoundary(rect:Rectangle):void
		{
			_sceneBoundary = rect;
		}
		
		public function set x(value:int):void
		{
			if(value < 0)
			{
				_x = 0;
			}
			else if((value + _viewport.width) > _sceneBoundary.width) 
			{
				_x = _sceneBoundary.width - _viewport.width;
			}
			else
			{
				_x = value;
			}
			updateViewport();
		}
		
		public function get x():int
		{
			//trace("_x=" +_x)
			return _x;
		}
		
		public function set y(value:int):void
		{
			if(value < 0)
			{
				_y = 0;
			}
			else if((value + _viewport.height) > _sceneBoundary.height) 
			{
				_y = _sceneBoundary.height - _viewport.height;
			}
			else
			{
				_y = value;
			}
			updateViewport();
		}
		
		public function get y():int
		{
			return _y;
		}
		
		private function updateViewport():void
		{
			_viewport.x = _x;
			_viewport.y = _y;
			_trackRect.x = _viewport.x + OFFSET_X; 
			_trackRect.y = _viewport.y + OFFSET_Y;
		}
		
		public function update():void
		{
			//trace("_trackTarget.x=" +_trackTarget.x +"-----trackTarget.y="+_trackTarget.y);
			if(_trackTarget == null)
			{
				return;
			}
			if(_trackRect.contains(_trackTarget.x, _trackTarget.y))
			{
				return;
			}
			if(_trackTarget.x < _trackRect.left)
			{
				x -= (_trackRect.left - _trackTarget.x);
				
			}
			else if(_trackTarget.x > _trackRect.right)
			{
				x += (_trackTarget.x - _trackRect.right);
			
			}
			if(_trackTarget.y < _trackRect.top)
			{
				y -= (_trackRect.top - _trackTarget.y);
			}
			else if(_trackTarget.y > _trackRect.bottom)
			{
				y += (_trackTarget.y - _trackRect.bottom);
			}
		}
		
		public function getViewport():Rectangle
		{
			return _viewport;
		}
	}
}