package  taven.movie
{
	import com.greensock.TweenLite;
	import taven.utils.StringUtils;
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 * 漫画播放类
	 * @author jerryli
	 */
	public class CartoonManager
	{
		private static var _callBack:Function;
		
		private static var _main:MovieClip;
		private static var _prev:SimpleButton;
		private static var _next:SimpleButton;
		private static var _lastFrame:int;
		
		private static var _arrow_offset:int;
		
		public function CartoonManager()
		{
			
		}
		
		/**
		 * 播放漫画
		 * @param cartoonMc
		 * @param changePageMc
		 * @param callBack
		 */		
		public static function play(cartoonMc:MovieClip, changePageMc:MovieClip, callBack:Function, arrow_offset:int = 0):void
		{
			_main = cartoonMc;
			_prev = changePageMc["btnPrev"];
			_next = changePageMc["btnNext"];
			
			_callBack = callBack;
			_arrow_offset = arrow_offset;
			
			if(_main && _prev && _next)
			{
				_prev.x -= _arrow_offset;
				_next.x += _arrow_offset;
				
				_prev.visible = false;
				
				_main.addEventListener(Event.FRAME_CONSTRUCTED, playCartoonEffect);
				_main.gotoAndStop(1);
				_prev.addEventListener(MouseEvent.CLICK, onPrevClick);
				_next.addEventListener(MouseEvent.CLICK, onNextClick);
			}
			else
			{
				throw new Error("漫画未包含相应的元件！");
			}
		}
		
		private static function onPrevClick(e:MouseEvent):void
		{
			if(_main.currentFrame == 1)
			{
				_prev.visible = false;
			}
			_main.prevFrame();
		}
		
		private static function onNextClick(e:MouseEvent):void
		{
			if(_main.currentFrame == _main.totalFrames)
			{
				destory();
			}
			else
			{
				_prev.visible = true;
				_main.nextFrame();
			}
		}
		
		private static function playCartoonEffect(e:Event):void
		{
			if(_lastFrame == _main.currentFrame) return;
			_lastFrame = _main.currentFrame;
			var num:int = _main.numChildren;
			var maxIndex:int = 0;
			var minIndex:int = 1000;
			var count:int = 0;
			for(var i:int = 0; i < num; i++)
			{
				var indexStr:String = _main.getChildAt(i).name.replace("mc","");
				if(StringUtils.isDigital(indexStr))
				{
					count++;
					var index:int = parseInt(indexStr);
					if(index > maxIndex) maxIndex = index;
					if(index < minIndex) minIndex = index;
				}
			}
			
			if(_main["mc" + minIndex]) 
			{
				for(i = minIndex; i <= maxIndex; i++)
				{
					if(_main["mc" + i])
					{
						_main["mc" + i].alpha = 0;
					}
				}
				TweenLite.to(_main["mc" + minIndex], 0.9, {alpha:1, onComplete:function():void{showNext(minIndex + 1);}});
			}
			
			function showNext(ind:int):void
			{
				if(ind > maxIndex) return;
				
				// 有可能先会执行destory
				// 这时候当缓动到这里的时候_main就是null了
				if (_main)
				{
					if(_main["mc" + ind])
					{
						TweenLite.to(_main["mc" + ind], 0.9, {alpha:1, onComplete:function():void{showNext(ind + 1);}});
					}
					else
					{
						showNext(ind + 1);
					}
				}
			}
		}
		
		private static function destory():void
		{	
			_prev.x += _arrow_offset;
			_next.x -= _arrow_offset;
			
			_main.removeEventListener(Event.FRAME_CONSTRUCTED, playCartoonEffect);
			_prev.removeEventListener(MouseEvent.CLICK, onPrevClick);
			_next.removeEventListener(MouseEvent.CLICK, onNextClick);
			
			if(_callBack != null)
			{
				_callBack();
			}
			
			_main = null;
			_prev = null;
			_next = null;
			_callBack = null;
			_lastFrame = 0;
		}
	}
}