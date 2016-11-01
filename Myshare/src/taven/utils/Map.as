package taven.utils
{
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.geom.Matrix;
	import flash.geom.Point;

	public class Map
	{
		
		/**
		 * 基于像素点的碰撞检测  拷贝而来  有不完善
		 * @param	point
		 * @return
		 */
		public static function hitTest(point:Point,targetMc:DisplayObject):Boolean
		{
			var bmapData:BitmapData = new BitmapData(1, 1, true, 0x00000000);
		  var sMatrix:Matrix = new Matrix();
			sMatrix.a = targetMc.scaleX;
			sMatrix.tx = -point.x;
			sMatrix.ty = -point.y;
			bmapData.draw(targetMc, sMatrix);
			 var sPoint:Point = new Point();
			return bmapData.hitTest(sPoint, 1, sPoint);
		}
		
	}
}