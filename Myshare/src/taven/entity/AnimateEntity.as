package taven.entity
{
	import taven.animation.FramePlayer;

	/**
	 * 动画播放实体
	 * @author Taven
	 */
	public class AnimateEntity extends Entity
	{
		// 动画接口
		private var _animation:FramePlayer;
		// 资源路径
		private var _resourceUrl:String;
		// 动作名
		private var _action:String;
		
		public function AnimateEntity(definition:EntityDefinition)
		{
			super(definition);
		}
		
		/**
		 * 获取动作播放对象 
		 * @return 
		 * 
		 */
		public function get animation():FramePlayer
		{
			return _animation;
		}

		/**
		 * 设置资源路径 
		 * @param value
		 * 
		 */
		public function set resourceUrl(value:String):void
		{
			if(value != null)
			{
				dispose();
				_resourceUrl = value;
				_animation = new FramePlayer(_resourceUrl);
				addChild(this.animation);
			}
		}
		
		/**
		 * 获取资源路径
		 * @return 
		 * 
		 */
		public function get resourceUrl():String
		{
			return _resourceUrl;
		}
		
		/**
		 * 播放 
		 * 
		 */
		public function play():void
		{
			if (_animation)
			{
				_animation.play();
			}
		}
		
		/**
		 * 停止 
		 * 
		 */
		public function stop():void
		{
			if (_animation)
			{
				_animation.stop();
			}
		}
		
		/**
		 * 跳转至某帧并停止 
		 * @param frameIndex
		 * 
		 */
		public function gotoAndStop(frameIndex:uint):void
		{
			if (_animation)
			{
				_animation.gotoAndStop(frameIndex);
			}
		}
		
		/**
		 * 跳转至某帧并播放
		 * @param frameIndex
		 * 
		 */
		public function gotoAndPlay(frameIndex:uint):void
		{
			if (_animation)
			{
				_animation.gotoAndPlay(frameIndex);
			}
		}
		
		/**
		 * 当前帧 
		 * @return 
		 * 
		 */
		public function get currentFrameIndex():uint
		{
			if (_animation)
			{
				return _animation.currentFrameIndex;
			}
			return 0;
		}
		
		/**
		 * 播放动作 
		 * @param value
		 * 
		 */
		public function set action(value:String):void
		{
			_action = value;
			if (_animation)
			{
				_animation.gotoLabel(action);
			}
		}
		
		/**
		 * 获取当前动作 
		 * @return 
		 * 
		 */
		public function get action():String
		{
			return _action;
		}
		
		/**
		 * 帧更新 
		 * 
		 */
		override public function update():void
		{
			if(_animation)
			{
				_animation.update();
			}
		}
		
		/**
		 * 释放 
		 * 
		 */
		override public function dispose():void
		{
			if(_animation)
			{
				if(contains(_animation)) removeChild(_animation);
				_animation.dispose();
				_animation = null;
			}
		}
	}
}