package  taven.movie
{
	import taven.dataset.HashMap;
	import taven.log.Console;
	import taven.manager.FrameManager;
	import taven.sound.SoundManager;
	import taven.utils.FrameDebugUtils;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	/**
	 * 动画播放管理器
	 * @author jerryli
	 */
	public class AnimateManager
	{
		private static var _isInit:Boolean;
		private static var _fullFun:Function;
		private static var _fullStopMapSound:Boolean;
		private static var _fullMc:MovieClip;
		
		private static var _frameMap:HashMap = new HashMap(true);
		private static var _specialActHandler:Function;
		
		private static var _frameListener:Boolean = false;
		
		public function AnimateManager(specialActHandler:Function)
		{
			if (!_isInit)
			{
				_isInit = true;
				_specialActHandler = specialActHandler;
			}
		}
		
		/**
		 * 播放全屏动画
		 * @param url 全屏动画路径
		 * @param fun 要执行的回调方法
		 * @param stopMapSound 是否关闭地图背景音乐
		 * @param soundMute 如果不关闭背景音乐，则背景音乐音量为soundMute
		 */		
		public static function playFullScreenAnimate(fulMc:MovieClip, fun:Function = null, stopMapSound:Boolean = true, soundMute:Number = 1.0):void
		{
			_fullMc = fulMc;
			_fullStopMapSound = stopMapSound;
			_fullFun = fun;
			
			if(_fullMc == null)
			{
				throw new Error("影片剪辑不能为空对象！");
			}
			else
			{
				if(_fullStopMapSound)
				{
					SoundManager.pauseSound();
				}
				else
				{
					SoundManager.mute = soundMute;
				}
								
				if(_fullMc["close_btn"])
				{
					_fullMc["close_btn"].addEventListener(MouseEvent.CLICK, onFullCloseClick);
					_fullMc["close_btn"].visible = false;
				}
				
				_frameListener = true;
				FrameManager.addFrameListener(onFullEnterFrame);
				_fullMc.gotoAndPlay(2);
			}
		}
		
		private static function onFullCloseClick(e:MouseEvent):void
		{
			destoryFullAnimate();
		}
		
		private static function onFullEnterFrame():void
		{
//			trace(_fullMc.currentFrame + "******" + _fullMc.totalFrames);
			FrameDebugUtils.debug(_fullMc);
			
			if(_frameListener && _fullMc.currentFrame > _fullMc.totalFrames)
			{
				_frameListener = false;
				Console.write("全屏播放时已记录帧数已经超过总帧数！", Console.ERROR);
			}
			
			if (_fullMc.currentFrameLabel && _specialActHandler != null)
			{
				_specialActHandler(_fullMc);
			}
			
			if(_fullMc.currentFrame == 72 && _fullMc["close_btn"])
			{
				_fullMc["close_btn"].visible = true;
			}
			
			if (_fullMc.currentFrame == _fullMc.totalFrames)
			{
				_frameListener = false;
				destoryFullAnimate();
			}
		}
		
		private static function destoryFullAnimate():void
		{
			FrameDebugUtils.destroy();
			
			if(_fullStopMapSound)
			{
				SoundManager.continueSound();
			}
			else
			{
				SoundManager.mute = 1;
			}
			
			if(_fullMc)
			{
				if(_fullMc["close_btn"])
				{
					_fullMc["close_btn"].removeEventListener(MouseEvent.CLICK, onFullCloseClick);
				}
				FrameManager.removeFrameListener(onFullEnterFrame);
				
				_fullMc = null;
			}
			
			if(_fullFun != null)
			{
				_fullFun();
			}
		}
		
		/**
		 * 播放场景动画
		 * @param mc 父级影片剪辑
		 * @param frame 子级影片剪辑位于第几帧
		 * @param fun 要执行的回调方法
		 * @param toLastFrame 是否直接跳到最后一帧
		 * 
		 */		
		public static function playMcAnimate(mc:MovieClip, frame:Object = 0, fun:Function = null, toLastFrame:Boolean = false):void
		{
			if(mc == null)
			{
				throw new Error("影片剪辑为空对象！");
			}
			else
			{
				// SoundManager.eaxVolume = 0;
				if(frame == 0)
				{
					if(_frameMap.containsKey(mc))
					{
						Console.write("影片剪辑重复播放[1]！", Console.ERROR);
					}
					else
					{
						_frameMap.add(mc, fun);
						
						FrameManager.addFrameListener(onFrameEnterFrame, mc);
						mc.gotoAndPlay(2);
					}
				}
				else
				{
					FrameManager.addFrameListener(function(obj:Object):void
					{
						FrameManager.removeFrameListener(arguments.callee);
						playAnimateContent(obj);
					}, {"mc":mc, "fun":fun, "toLastFrame":toLastFrame});
					mc.gotoAndStop(frame);
				}
			}
		}
		
		private static function playAnimateContent(obj:Object):void
		{
			var mc:MovieClip = obj["mc"] as MovieClip;
			var fun:Function = obj["fun"] as Function;
			var toLastFrame:Boolean = Boolean(obj["toLastFrame"]);
			
			var child:MovieClip = mc.getChildAt(0) as MovieClip;
			
			if (child != null)
			{
				if(_frameMap.containsKey(child))
				{
					Console.write("影片剪辑重复播放[2]！", Console.ERROR);
				}
				else
				{
					_frameMap.add(child, fun);
					
					if(toLastFrame)
					{
						FrameManager.addFrameListener(onFrameEnterFrame, child);
						child.gotoAndStop(child.totalFrames);
					}
					else
					{
						FrameManager.addFrameListener(onFrameEnterFrame, child);
						child.gotoAndPlay(2);
					}
				}
			}
		}
		
		public static function playMcEndHandler(mc:MovieClip, handler:Function):void
		{
			mc.addFrameScript(mc.totalFrames - 1, function():void
			{
				if (mc)
				{
					mc.stop();
					mc.addFrameScript(mc.totalFrames - 1, null);
					if (handler != null)
					{
						handler.call();
					}
				}
			});
			mc.gotoAndPlay(1);
		}
		
		private static function onFrameEnterFrame(mc:MovieClip):void
		{
			FrameDebugUtils.debug(mc);
//			trace(mc.currentFrame + " **** " + mc.totalFrames);
			
			if (mc.currentFrameLabel && _specialActHandler != null)
			{
				_specialActHandler(mc);
			}
			
			if (mc.currentFrame == mc.totalFrames)
			{
				mc.stop();
				FrameManager.removeFrameListener(onFrameEnterFrame);
				destoryFrameAnimate(mc);
			}
		}
		
		private static function destoryFrameAnimate(mc:MovieClip):void
		{
			FrameDebugUtils.destroy();
			SoundManager.eaxVolume = 60;
			var fun:Function = _frameMap.remove(mc) as Function;
			if (fun != null)
			{
				fun();
			}
		}
	}
}