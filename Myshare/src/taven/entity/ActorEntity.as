package taven.entity
{
	import taven.constant.Direction;
	import taven.entity.constant.AnimateType;
	import taven.entity.event.MoveEntityEvent;
	
	import flash.display.DisplayObject;
	import flash.geom.Point;

	/**
	 * 行动实体类: 可以移动并能播放动作
	 * @author Taven
	 */	
	public class ActorEntity extends MoveEntity
	{
		private var _animated:AnimateEntity;
		private var _direction:uint = Direction.LEFT;
		private var _faceto:uint = Direction.FRONT;
		private var _animateType:String = AnimateType.IDLE;
		
		public function ActorEntity(definition:EntityDefinition = null)
		{
			super(definition);
			addEventListener(MoveEntityEvent.START_MOVE, startMoveHandler);
			addEventListener(MoveEntityEvent.END_MOVE, endMoveHandler);
			_animated = new AnimateEntity(new EntityDefinition(definition.id, new Point()));
			addChild(_animated);
			playAction();
		}
		
		/**
		 * 设置资源路径 
		 * @param value
		 * 
		 */
		public function set resourceUrl(value:String):void
		{
			_animated.resourceUrl = value;
		}
		
		/**
		 * 获取资源路径
		 * @return 
		 * 
		 */
		public function get resourceUrl():String
		{
			return _animated.resourceUrl;
		}
		
		/**
		 * 开始行走事件侦听 
		 * @param event
		 * 
		 */
		protected function startMoveHandler(event:MoveEntityEvent):void
		{
			var destPos:Point = event.position;
			if (destPos.x != this.x || destPos.y != this.y)
			{
				direction = (this.x < destPos.x ? Direction.RIGHT : Direction.LEFT);
				faceto = (this.y < destPos.y ? Direction.FRONT : Direction.BACK);
			}
			animateType = AnimateType.WALK;
		}
		
		/**
		 * 停止行走事件侦听 
		 * @param event
		 * 
		 */
		protected function endMoveHandler(event:MoveEntityEvent):void
		{
			animateType = AnimateType.IDLE;
		}
		
		/**
		 * 设置方向 
		 * @param value
		 * 
		 */
		public function set direction(value:int):void
		{
			_direction = value;
			// TODO
			if (_animated)
			{
				if (_animated.animation)
				{
					(_animated.animation as DisplayObject).scaleX = (direction == Direction.LEFT ? 1 : -1);
				}
			}
		}
		
		/**
		 * 获取方向 
		 * @return 
		 * 
		 */
		public function get direction():int
		{
			return _direction;
		}
		
		/**
		 * 获取朝向
		 * @return 
		 * 
		 */
		public function get faceto():uint
		{
			return _faceto;
		}
		
		/**
		 * 设置朝向
		 * @param value
		 * 
		 */
		public function set faceto(value:uint):void
		{
			_faceto = value;
		}
		
		/**
		 * 设置动作类型: 此时会根据方向立即播放该类型动作 
		 * @param type
		 * 
		 */
		public function set animateType(type:String):void
		{
			_animateType = type;
			playAction();
		}
		
		protected function playAction():void
		{
			if(_animated) _animated.action = _animateType + "_" + (_faceto == Direction.FRONT ? AnimateType.DIR_FRONT : AnimateType.DIR_BACK);
		}
		
		/**
		 * 获取动作类型 
		 * @return 
		 * 
		 */
		public function get animateType():String
		{
			return _animateType;
		}
		
		/**
		 * 帧更新 
		 * 
		 */
		override public function update():void
		{
			if(_animated) _animated.update();
			super.update();
		}
		
		/**
		 * 释放 
		 * 
		 */
		override public function dispose():void
		{
			if(_animated)
			{
				_animated.dispose();
				_animated = null;
			}
			super.dispose();
		}

		public function get animated():AnimateEntity
		{
			return _animated;
		}
	}
}