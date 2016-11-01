package taven.animation
{
	import taven.animation.frame.FrameInfo;
	import taven.animation.frame.FrameLabelInfo;
	import taven.animation.frame.FrameSequence;
	import taven.animation.frame.FrameSequenceManager;
	import taven.dataset.HashMap;
	
	import flash.display.Bitmap;
	import flash.display.PixelSnapping;
	import flash.events.Event;
	import flash.geom.Point;
	
	/**
	 * 位图序列播放器
	 * @author kramer
	 * 
	 */
	public class FramePlayer extends Bitmap implements IAnimation
	{
		// 动作初始化完成
		public static const ACTION_INITED:String = "action inited";
		// 动作帧开始
		public static const ACTION_START:String = "action start";
		// 动作帧结束
		public static const ACTION_END:String = "action end";
		
		private var _frameSequence:FrameSequence;
		private var _resourceUrl:String;
		
		private var _totalFrameNum:uint = 1;
		private var _currentFrameIndex:uint = 1;//start from 1
		private var _currentStartIndex:uint = 1;//start from 1
		private var _currentEndIndex:uint = 1;//start from 1
		private var _drawedFrameIndex:uint = 0;
		private var _currentLabel:String;
		private var _labelMap:HashMap;
		
		private var _currentFrameInfo:FrameInfo;
		
		private var _initialized:Boolean = false;
		private var _isPlaying:Boolean = true;
		
		private var _scaleX:Number;
		private var _scaleY:Number;
		
		
		public function FramePlayer(resourceUrl:String = null)
		{
			_resourceUrl = resourceUrl;
			initialize();
			_labelMap = new HashMap();
		}
		
		protected function initialize():void
		{
			_scaleX = 1;
			_scaleY = 1;
			this.smoothing = true;
			this.pixelSnapping = PixelSnapping.AUTO;
			initFrameSequence();
		}
		
		protected function initFrameSequence():void
		{
			if(_resourceUrl != null)
			{
				_frameSequence = FrameSequenceManager.getFrameSequence(_resourceUrl, 1)[0];
			}
		}
		
		public function set frameSequence(sequence:FrameSequence):void
		{
			_frameSequence = sequence;
			_initialized = false;
			_drawedFrameIndex = 0;
		}
		
		public function get frameSequence():FrameSequence
		{
			return _frameSequence;
		}
		
		public function get resourceUrl():String
		{
			return _resourceUrl;
		}
		
		public function get totalFrameNum():uint
		{
			if(_frameSequence.isReady == true)
			{
				return _frameSequence.getTotalFrameNum();
			}
			return 1;
		}
		
		public function get currentFrameIndex():uint
		{
			return _currentFrameIndex;
		}
		
		public function get currentFrameLabel():String
		{
			return _currentLabel;
		}
		
		public function get currentStartIndex():uint
		{
			return _currentStartIndex;
		}
		
		public function get currentEndIndex():uint
		{
			return _currentEndIndex;
		}
		
		public function play():void
		{
			updateFrameIndex();
			gotoAndPlay(_currentFrameIndex);
		}
		
		public function stop():void
		{
			gotoAndStop(_currentFrameIndex);
		}
		
		public function gotoAndPlay(frameIndex:uint):void
		{
			_isPlaying = true;
			if(_frameSequence && _frameSequence.isReady)
			{
				updateFrameIndexRange();
			}
			_currentFrameIndex = Math.min(Math.max(frameIndex + _currentStartIndex, _currentStartIndex), _currentEndIndex);
		}
		
		public function gotoAndStop(frameIndex:uint):void
		{
			_isPlaying = false;
			_currentFrameIndex = frameIndex;
			_currentStartIndex = frameIndex;
			_currentEndIndex = frameIndex;
		}
		
		public function hasLabel(label:String):Boolean
		{
			return _labelMap.containsKey(label);
		}
		
		public function gotoLabel(label:String):void
		{
			if(_currentLabel == label)
			{
				return;
			}
			_currentLabel = label;
			if (_currentLabel)
			{
				if(_initialized == true)
				{
					updateIndexRangeByLabel();
				}
				dispatchActionEvent(ACTION_START);
			}
		}
		
		public function get initialized():Boolean
		{
			return _initialized;
		}
		
		private function updateIndexRangeByLabel():void
		{
			var frameLabelInfo:FrameLabelInfo = _labelMap.getValue(_currentLabel) as FrameLabelInfo;
			if(frameLabelInfo != null)
			{
				_currentStartIndex = frameLabelInfo.startIndex;
				_currentFrameIndex = _currentStartIndex;
				_currentEndIndex = frameLabelInfo.endIndex;
			}
		}
		
		public function update():void
		{
			if(_frameSequence && _frameSequence.isReady)
			{
				if(_initialized == false)
				{
					updateFrameIndexRange();
				}
				updateFrame();
				updateFrameIndex();
				if(_initialized == false)
				{
					dispatchActionEvent(ACTION_INITED);
					_initialized = true;
				}
			}
		}
		
		private function updateFrameIndex():void
		{
			_currentFrameIndex++;
			if(_currentFrameIndex > _currentEndIndex)
			{
				dispatchActionEvent(ACTION_END);
				_currentFrameIndex = _currentStartIndex;
			}
		}
		
		private function dispatchActionEvent(type:String):void
		{
			if (hasEventListener(type))
			{
				dispatchEvent(new Event(type));
			}
		}
		
		private function updateFrame():void
		{
			if(_currentFrameIndex == _drawedFrameIndex)
			{
				return;
			}
			_currentFrameInfo = _frameSequence.getFrameInfoByIndex(_currentFrameIndex);
			drawFrame();
			_drawedFrameIndex = _currentFrameIndex;
		}
		
		private function drawFrame():void
		{
			if(_currentFrameInfo != null)
			{
				var anchor:Point = _frameSequence.anchor;
				this.x = -anchor.x * _scaleX;
				this.y = -anchor.y * _scaleY;
				this.x += _currentFrameInfo.offsetX * _scaleX;
				this.y += _currentFrameInfo.offsetY * _scaleY;
				this.bitmapData = _currentFrameInfo.bitmapData;
			}
		}
		
		private function updateFrameIndexRange():void
		{
			_labelMap = _frameSequence.getLabelMap();
			if(_isPlaying == true)
			{
				if(_currentLabel != null)
				{
					updateIndexRangeByLabel()
				}
				else
				{
					_currentEndIndex = _frameSequence.getTotalFrameNum();
				}
			}
		}
		
		override public function get scaleX():Number
		{
			return _scaleX;
		}
		
		override public function set scaleX(value:Number):void
		{
			_scaleX = value;
			super.scaleX = value;
			drawFrame();
		}
		
		override public function get scaleY():Number
		{
			return _scaleY;
		}
		
		override public function set scaleY(value:Number):void
		{
			_scaleY = value;
			super.scaleY = value;
			drawFrame();
		}
		
		protected function releaseFrameSequence():void
		{
			if(_frameSequence)
			{
				FrameSequenceManager.recyleFrameSequence(_frameSequence);
				_frameSequence = null;
				this.bitmapData = null;
			}
		}
		
		public function dispose():void
		{
			releaseFrameSequence();
			_currentFrameInfo = null;
			this.bitmapData = null;
		}
	}
}