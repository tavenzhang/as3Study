package taven.utils
{
	import com.greensock.TweenMax;
	import taven.manager.FrameManager;
	
	import flash.display.BitmapData;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import flash.utils.Dictionary;
	
	/**
	 * 影片剪辑工具类
	 * @author Taven
	 */
	public class MovieClipUtils
	{
		/**
		 * 播放一次
		 * @param mc
		 */
		public static function playOnce(mc:MovieClip, remove:Boolean, callback:Function = null, args:* = null):void
		{
			mc.addEventListener(Event.ENTER_FRAME, function(event:Event):void
			{
				if (mc.currentFrame == mc.totalFrames)
				{
					mc.stop();
					if (remove)
					{
						DisplayUtils.removeFromParent(mc);
					}
					mc.removeEventListener(Event.ENTER_FRAME, arguments.callee);
					if (callback != null && args == null)
					{
						callback();
					}
					else if (callback != null && args != null)
					{
						callback(args);
					}
						
				}
			});
			mc.gotoAndPlay(1);
		}
        
        public static function playFrom(mc:MovieClip, startFrame:* = 1, endFrameLabel:* = "end",callback:Function = null):void
        {
            mc.addEventListener(Event.ENTER_FRAME, function(event:Event):void
            {
                //trace(mc.currentFrame + "-" + mc.currentFrameLabel);
                if (mc.currentFrameLabel == endFrameLabel || mc.currentFrame == mc.totalFrames)
                {
                    mc.stop();
                    mc.removeEventListener(Event.ENTER_FRAME, arguments.callee);
                    if (callback != null)
                    {
                        callback();
                    }
                }
            });
            mc.gotoAndPlay(startFrame);
        }
		
		/**
		 * 从某一个关键处开始播放一次
		 * @param mc
		 */
		public static function playOnceFrom(mc:MovieClip, remove:Boolean, startFrame:* = 1, callback:Function = null):void
		{
			mc.addEventListener(Event.ENTER_FRAME, function(event:Event):void
			{
				if (mc.currentFrame == mc.totalFrames)
				{
					mc.stop();
					if (remove)
					{
						DisplayUtils.removeFromParent(mc);
					}
					mc.removeEventListener(Event.ENTER_FRAME, arguments.callee);
					if (callback != null)
					{
						callback();
					}
				}
			});
			mc.gotoAndPlay(startFrame);
		}
		
		/**
		 * 获取容器的子影片剪辑并停止
		 * @param obj
		 * @param frame
		 * @param level
		 *
		 */
		public static function childStop(obj:DisplayObjectContainer, frame:Object, level:uint = 0):void
		{
			var count:int = 0;
			var num:int = obj.numChildren;
			if (num == 0)
			{
				return;
			}
			if (level >= num)
			{
				level = num - 1;
			}
			obj.addEventListener(Event.ENTER_FRAME, function(e:Event):void
			{
				var mc:MovieClip = obj.getChildAt(level) as MovieClip;
				if (mc)
				{
					obj.removeEventListener(Event.ENTER_FRAME, arguments.callee);
					mc.gotoAndStop(frame);
				}
				else
				{
					if (count > 2)
					{
						obj.removeEventListener(Event.ENTER_FRAME, arguments.callee);
					}
				}
				count++;
			});
		}
		
		/**
		 * 获取容器的子影片剪辑并播放
		 * @param obj
		 * @param frame
		 * @param level
		 *
		 */
		public static function childPlay(obj:DisplayObjectContainer, frame:Object, level:uint = 0):void
		{
			var count:int = 0;
			var num:int = obj.numChildren;
			if (num == 0)
			{
				return;
			}
			if (level >= num)
			{
				level = num - 1;
			}
			obj.addEventListener(Event.ENTER_FRAME, function(e:Event):void
			{
				var mc:MovieClip = obj.getChildAt(level) as MovieClip;
				if (mc)
				{
					obj.removeEventListener(Event.ENTER_FRAME, arguments.callee);
					mc.gotoAndPlay(frame);
				}
				else
				{
					if (count > 2)
					{
						obj.removeEventListener(Event.ENTER_FRAME, arguments.callee);
					}
				}
				count++;
			});
		}
		/**
		 * 影片剪辑淡入、播放、淡出
		 * @param mc	
		 * @param startDuration 淡入时间
		 * @param mediumDuration 播放时间
		 * @param endDuration 淡出时间
		 * @param startAlpha 初始透明度
		 * @param mediumAlpha 播放透明度
		 * @param endAlpha	最终透明度
		 * 
		 */		
		public static function easingPlay(mc:MovieClip, startDuration:Number, mediumDuration:Number,endDuration:Number, startAlpha:Number = 0.0,mediumAlpha:Number = 1.0, endAlpha:Number = 0.0):void
		{
			if(TweenMax.isTweening(mc))
			{
				TweenMax.killTweensOf(mc, false);
				mc.gotoAndStop(1);
			}			
			TweenUtils.fade(mc, startDuration, startAlpha, mediumAlpha, 
				function():void
				{
					
					TweenMax.to(mc, mediumDuration,
						{																				
							frame : mc.totalFrames,
							onComplete : function ():void
							{
								TweenUtils.fade(mc, endDuration, mediumAlpha, endAlpha,
									function():void
									{
										//view.alpha = 1.0;		
										mc.gotoAndStop(1);
										DisplayUtils.removeFromParent(mc);
									});																										
							}	
						})
				})
		}
		
		/**
		 * 设置一系列以name开头, 以0~num后缀的子元件播放至value对应的位的那帧
		 * @param obj
		 * @param name
		 * @param num
		 * @param value
		 * @param showZero
		 * 
		 */
		public static function setChildValue(obj:DisplayObjectContainer, name:String, count:uint, value:uint, showZero:Boolean = false):void
		{
			var strValue:String = value.toString();
			var strLen:int = strValue.length;
			var index:int = 0;
			for (var i:int = 0; i < count; i++)
			{
				var mc:MovieClip = obj.getChildByName(name + i) as MovieClip;
				if (mc)
				{
					if (strLen >= count - i)
					{
						var num:int = parseInt(strValue.charAt(index++));
						mc.visible = true;
						mc.gotoAndStop(num + 1);
					}
					else
					{
						mc.gotoAndStop(1);
						mc.visible = showZero;
					}
				}
			}
		}
		
		/**
		 * 同上, 不同的就是从第一个开始
		 * @param obj
		 * @param name
		 * @param count
		 * @param value
		 */
		public static function setChildValueFromFirst(obj:DisplayObjectContainer, name:String, count:uint, value:uint):void
		{
			var strValue:String = value.toString();
			var strLen:int = strValue.length;
			for (var i:int = 0; i < count; i++)
			{
				var mc:MovieClip = obj.getChildByName(name + i) as MovieClip;
				if (mc)
				{
					if (strLen > i)
					{
						var num:int = parseInt(strValue.charAt(i));
						mc.visible = true;
						mc.gotoAndStop(num + 1);
					}
					else
					{
						mc.gotoAndStop(1);
						mc.visible = false;
					}
				}
			}
		}
		
		/**
		 * 使数字滚动显示到某个值
		 * @param obj
		 * @param name
		 * @param count
		 * @param startValue
		 * @param endValue
		 * @param durationFrame
		 */
		/*public static function scrollToChildValue(obj:DisplayObjectContainer, name:String, count:uint, startValue:uint, endValue:uint, durationFrame:uint = 30):void
		{
			var value:Number = startValue;
			obj.addEventListener(Event.ENTER_FRAME, function():void
			{
				value += (endValue - startValue) / durationFrame;
				if(value >= endValue)
				{
					value = endValue;
					obj.removeEventListener(Event.ENTER_FRAME, arguments.callee);
					setChildValue(obj, name, count, int(value));
					return;
				}
				else
				{
					setChildValue(obj, name, count, int(value));
				}
			});
			setChildValue(obj, name, count, int(value));
		}*/
		
		
		private static var _scrollObjMap:Dictionary = new Dictionary();
		public static function scrollToChildValue(obj:DisplayObjectContainer, name:String, count:uint, startValue:uint, endValue:uint,
												  durationFrame:uint = 30, fromFirst:Boolean = false):void
		{
			function scrollHandler(data:Object):void
			{
				data.value += (data.endValue - data.startValue) / data.durationFrame;
				if (data.value >= endValue)
				{
					data.value = data.endValue;
					FrameManager.removeFrameListener(_scrollObjMap[obj]);
					_scrollObjMap[obj] = null;
					delete _scrollObjMap[obj];
					
					if (fromFirst)
					{
						setChildValueFromFirst(data.obj, data.name, data.count, int(data.value));
					}
					else
					{
						setChildValue(data.obj, data.name, data.count, int(data.value));
					}
				}
				else
				{
					if (fromFirst)
					{
						setChildValueFromFirst(data.obj, data.name, data.count, int(data.value));
					}
					else
					{
						setChildValue(data.obj, data.name, data.count, int(data.value));
					}
				}
			}
			if (_scrollObjMap[obj])
			{
				FrameManager.removeFrameListener(_scrollObjMap[obj]);
				_scrollObjMap[obj] = null;
				delete _scrollObjMap[obj];
			}
			var value:Number = startValue;
			_scrollObjMap[obj] = scrollHandler;
			FrameManager.addFrameListener(scrollHandler, { value: startValue, obj: obj, name: name, count: count, startValue: startValue, endValue: endValue,
				durationFrame: durationFrame, fromFirst: fromFirst });
			if (fromFirst)
			{
				setChildValueFromFirst(obj, name, count, int(value));
			}
			else
			{
				setChildValue(obj, name, count, int(value));
			}
		}
		
		/**
		 * 缓存MC某一帧成位图数据
		 * @param mc
		 * @param frame
		 * @return 
		 */
		public static function cacheFrame(mc:MovieClip, frame:int):BitmapData
		{
			var isPlaying:Boolean = mc.isPlaying;
			mc.gotoAndStop(frame);
			var rect:Rectangle = mc.getBounds(mc);
			var bitmapData:BitmapData = new BitmapData(rect.width, rect.height, true, 0x00);
			bitmapData.draw(mc, new Matrix(1, 0, 0, 1, -rect.x, -rect.y));
			if (isPlaying)
			{
				mc.play();
			}
			return bitmapData;
		}
		
		/**
		 * 顺序滚动抽奖效果 
		 * @param data 
		 * 	time:第几次（初始为0），round ：第几轮（初始为0）， count:几个元件参与滚动， totalRound:总共几轮，index：停在第几个, func, 滚动时元件的效果函数， callback：停止后的回调
		 * 
		 * example: MovieClipUtils.gamblingEffect({round: 0, time: 0, count:3, totalRound: 4, index: index, func: func, callback: callback});
		 */
		public static function gamblingEffect(data:*):void
		{
			data.func(data.time % data.count);
			
			if (data.round == data.totalRound && data.time == (data.count + data.index))
			{
				data.callback();
				FrameManager.removeTickListener(gamblingEffect);
			}
			else if ((data.time == 0 && data.round == 0) || (data.round < data.totalRound && data.time == (data.count * (data.totalRound - data.round + 1)- 1)))
			{
				FrameManager.removeTickListener(gamblingEffect);
				FrameManager.addTickListener((data.round + 1) * 100, gamblingEffect, {func:data.func, round:data.round + 1, time: 0, count:data.count, totalRound: data.totalRound, index: data.index, callback: data.callback});
			}
			data.time++;
		}
	}
}
