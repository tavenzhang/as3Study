package taven.utils
{
	import flash.display.MovieClip;

	/**
	 * 卡帧纠错类
	 * @author jerryli
	 */
	public class FrameDebugUtils
	{
		private static var _frame:int;
		private static var _mc:MovieClip;
		
		public function FrameDebugUtils()
		{
			
		}
		
		public static function debug(mc:MovieClip):void
		{
			if(_mc != mc)
			{
				_mc = mc;
				_frame = mc.currentFrame;
			}
			else
			{
				if(mc && _frame == mc.currentFrame && mc.currentFrame != mc.totalFrames)
				{
					mc.gotoAndPlay(mc.currentFrame + 1);
				}
				else
				{
					_frame = mc.currentFrame;
				}
			}
		}
		
		public static function destroy():void
		{
			_mc = null;
		}
	}
}