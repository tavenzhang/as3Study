package taven.entity
{
	import taven.entity.event.MoveEntityEvent;
	import taven.map.AStar;
	import taven.utils.GeomUtils;
	
	import flash.geom.Point;

	/**
	 * 可移动实体类
	 * @author Taven
	 */	
	public class MoveEntity extends Entity
	{
		private var _speed:int;
		private var _currentPos:Point;
		private var _srcPos:Point;
		private var _destPos:Point;
		private var _pathList:Array = [];
		private var _moveing:Boolean;
		
		public function MoveEntity(definition:EntityDefinition)
		{
			super(definition);
		}
		
		/**
		 * 获取移动速度 
		 * @return 
		 * 
		 */
		public function get speed():int
		{
			return _speed;
		}

		/**
		 * 设置移动速度
		 * @param value
		 * 
		 */
		public function set speed(value:int):void
		{
			_speed = value;
		}
		
		/**
		 * 移动至目标点 
		 * @param pos
		 * 
		 */
		public function moveTo(pos:Point):void
		{
			var pathList:Array = AStar.find(new Point(this.x, this.y), pos);
			if (pathList && pathList.length > 0)
			{
				pathList.shift();
				if (pathList.length)
				{
					_pathList.length = 0;
					_pathList = _pathList.concat(pathList);
					_pathList[_pathList.length - 1].x = pos.x;
					_pathList[_pathList.length - 1].y = pos.y;
					moveNext();
				}
				else
				{
					stop();
				}
			}
		}
		
		/**
		 * 停止移动
		 * 
		 */
		public function stop():void
		{
			if (_destPos)
			{
				if(_moveing)
				{
					dispatchEvent(new MoveEntityEvent(MoveEntityEvent.START_MOVE, new Point(this.x, this.y)));
				}
				_moveing = false;
				dispatchEvent(new MoveEntityEvent(MoveEntityEvent.END_MOVE));
			}
			_pathList.length = 0;
			_destPos = null;
		}
		
		/**
		 * 移动至下一个路径点
		 * 
		 */
		private function moveNext():void
		{
			if (_pathList.length > 0)
			{
				_destPos = _pathList.shift();
				_currentPos = new Point(this.x, this.y);
				_srcPos = _currentPos.clone();
				_moveing = true;
				dispatchEvent(new MoveEntityEvent(MoveEntityEvent.START_MOVE, _destPos));
			}
		}
		
		/**
		 * 帧更新 
		 * 
		 */
		override public function update():void
		{
			super.update();
			if (_destPos)
			{
				if(Point.distance(_currentPos, _destPos) > _speed)
				{
					var ratioPoint:Point = GeomUtils.angleSpeed(_srcPos, _destPos);
					var stepDisX:Number = ratioPoint.x * _speed;
					var stepDisY:Number = ratioPoint.y * _speed;
					_currentPos.x -= stepDisX;
					_currentPos.y -= stepDisY;	
				}
				else
				{
					_srcPos = _destPos;
					_destPos = null;
					_currentPos.x = _srcPos.x;
					_currentPos.y = _srcPos.y;
				}
				this.x = _currentPos.x;
				this.y = _currentPos.y;
				
				if (!_destPos)
				{
					if (_pathList.length > 0)
					{
						moveNext();
					}
					else
					{
						_moveing = false;
						dispatchEvent(new MoveEntityEvent(MoveEntityEvent.END_MOVE));
					}
				}
			}
		}
		
		/**
		 * 释放 
		 * 
		 */
		override public function dispose():void
		{
			_pathList.length = 0;
			super.dispose();
		}

		public function get moveing():Boolean
		{
			return _moveing;
		}
	}
}