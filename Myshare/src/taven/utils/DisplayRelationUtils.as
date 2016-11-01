package taven.utils
{
	import taven.ClientCore;
	
	import flash.display.BitmapData;
	import flash.display.BlendMode;
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;

	/**
	 * 显示对象展现上的联系处理
	 * @author jerryli
	 */
	public class DisplayRelationUtils
	{
		private static var _relationViewList:Array = [];
		private static var _callBackList:Array = [];
		
		/**
		 * 将两个显示对象做鼠标Over的关联
		 * @param trigView:触发对象
		 * @param popupView:弹出对象
		 * @param addFunc:自定义添加弹出对象的方式
		 * @param removeFunc:自定义移除弹出对象的方式
		 * @param firstMouseOver:加上关联的第一下是否执行一次鼠标over
		 */
		public static function mouseOverCascade(trigView:DisplayObject, popupView:DisplayObject, addFunc:Function = null, removeFunc:Function = null, firstMouseOver:Boolean = true):void
		{
			_relationViewList = [];
			_relationViewList.push(trigView);
			_relationViewList.push(popupView);
			
			_callBackList = [];
			_callBackList.push(addFunc);
			_callBackList.push(removeFunc);
			
			_relationViewList[0].addEventListener(MouseEvent.MOUSE_OVER, onTrigViewMouseOver);
			if(firstMouseOver) onTrigViewMouseOver(null);
		}
		
		private static function onTrigViewMouseOver(e:MouseEvent):void
		{
			if(_relationViewList[0].parent && !_relationViewList[0].parent.contains(_relationViewList[1]))
			{
				ClientCore.stage.addEventListener(MouseEvent.MOUSE_MOVE, onOverMouseMove);
				if(_callBackList[0] == null)
				{
					_relationViewList[0].parent.addChild(_relationViewList[1]);
					_relationViewList[1].x = _relationViewList[0].x;
					_relationViewList[1].y = _relationViewList[0].y;
				}
				else
				{
					(_callBackList[0] as Function).call();
				}
			}
		}
		
		private static function onOverMouseMove(e:MouseEvent):void
		{
			if(_relationViewList[0])
			{
				if(_relationViewList[0].hitTestPoint(e.stageX, e.stageY))
				{
					return;
				}
				else
				{
					if(_relationViewList[1])
					{
						if(_relationViewList[1].hitTestPoint(e.stageX, e.stageY))
						{
							return;
						}
						else
						{
							ClientCore.stage.removeEventListener(MouseEvent.MOUSE_MOVE, onOverMouseMove);
							if(_callBackList[1] == null)
							{
								DisplayUtils.removeFromParent(_relationViewList[1]);
							}
							else
							{
								(_callBackList[1] as Function).call();
							}
						}
					}
				}
			}
		}
		
		/**
		 * 基于共有像素（叠加色）的精确碰撞检测，适宜于非矩形形体
		 * @target1: 目标物体1
		 * @target2: 目标物体2
		 * @accurracy:准确度
		 */
		public static function complexHitTestObject( target1:DisplayObject, target2:DisplayObject,  accurracy:Number = 1 ):Boolean
		{
			return complexIntersectionRectangle( target1, target2, accurracy ).width != 0;
		}
		
		private static function intersectionRectangle( target1:DisplayObject, target2:DisplayObject ):Rectangle
		{
			// 如果对象没有舞台引用或者矩形边界都无法发生碰撞，则肯定不碰撞
			if( !target1.root || !target2.root || !target1.hitTestObject( target2 ) ) return new Rectangle();
			
			// 获取目标边界
			var bounds1:Rectangle = target1.getBounds( target1.root );
			var bounds2:Rectangle = target2.getBounds( target2.root );
			
			// 计算两个物体交界的范围
			var intersection:Rectangle = new Rectangle();
			intersection.x 		= Math.max( bounds1.x, bounds2.x );
			intersection.y		= Math.max( bounds1.y, bounds2.y );
			intersection.width 	= Math.min( ( bounds1.x + bounds1.width ) - intersection.x, ( bounds2.x + bounds2.width ) - intersection.x );
			intersection.height = Math.min( ( bounds1.y + bounds1.height ) - intersection.y, ( bounds2.y + bounds2.height ) - intersection.y );
			
			return intersection;
		}
		
		private static function complexIntersectionRectangle( target1:DisplayObject, target2:DisplayObject, accurracy:Number = 1 ):Rectangle
		{			
			if( accurracy <= 0 ) throw new Error( "ArgumentError: Error #5001: Invalid value for accurracy", 5001 );
			
			if( !target1.hitTestObject( target2 ) ) return new Rectangle();
			
			var hitRectangle:Rectangle = intersectionRectangle( target1, target2 );
			if( hitRectangle.width * accurracy < 1 || hitRectangle.height * accurracy < 1 ) return new Rectangle();
			
			var bitmapData:BitmapData = new BitmapData( hitRectangle.width * accurracy, hitRectangle.height * accurracy, false, 0x000000 );	
			
			// 绘制第一个物体
			bitmapData.draw( target1, getDrawMatrix( target1, hitRectangle, accurracy ), new ColorTransform( 1, 1, 1, 1, 255, -255, -255, 255 ) );
			// 将第二个物体盖上去
			bitmapData.draw( target2, getDrawMatrix( target2, hitRectangle, accurracy ), new ColorTransform( 1, 1, 1, 1, 255, 255, 255, 255 ), BlendMode.DIFFERENCE );
			
			// 通过叠加色找碰撞区域
			var intersection:Rectangle = bitmapData.getColorBoundsRect( 0xFFFFFFFF,0xFF00FFFF );
			
			bitmapData.dispose();
			
			// 修改位置与宽度以补偿准确度
			if( accurracy != 1 )
			{
				intersection.x /= accurracy;
				intersection.y /= accurracy;
				intersection.width /= accurracy;
				intersection.height /= accurracy;
			}
			
			intersection.x += hitRectangle.x;
			intersection.y += hitRectangle.y;
			
			return intersection;
		}
		
		
		private static function getDrawMatrix( target:DisplayObject, hitRectangle:Rectangle, accurracy:Number ):Matrix
		{
			var localToGlobal:Point;;
			var matrix:Matrix;
			
			var rootConcatenatedMatrix:Matrix = target.root.transform.concatenatedMatrix;
			
			localToGlobal = target.localToGlobal( new Point( ) );
			matrix = target.transform.concatenatedMatrix;
			matrix.tx = localToGlobal.x - hitRectangle.x;
			matrix.ty = localToGlobal.y - hitRectangle.y;
			
			matrix.a = matrix.a / rootConcatenatedMatrix.a;
			matrix.d = matrix.d / rootConcatenatedMatrix.d;
			if( accurracy != 1 ) matrix.scale( accurracy, accurracy );
			
			return matrix;
		}
	}
}