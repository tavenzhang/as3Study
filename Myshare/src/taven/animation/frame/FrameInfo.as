package taven.animation.frame
{
	import flash.display.BitmapData;
	/**
	 * 
	 * @author kramer
	 * 记录位图序列每一帧的信息
	 */
	/**
	 * 
	 * @author kramer
	 * 	____frameW___________
	 * |	 ___________	 |
	 * f    |contentW	|	 |
	 * r	|			|	 |
	 * a	|			|	 |
	 * m    |contetnH	|	 |
	 * e	|___________|	 |
	 * H_____________________|
	 */	
	public class FrameInfo
	{
		//start from 1
		//作为关键帧的编号
		public var keyNum:uint;
		public var offsetX:uint;
		public var offsetY:uint;
		public var contentWidth:uint;
		public var contentHeight:uint;
		//start from 0
		//在FrameSheet中的索引号
		public var sheetIndex:uint;
		public var bitmapData:BitmapData;
	}
}