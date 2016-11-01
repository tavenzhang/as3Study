package taven.utils
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.InteractiveObject;
	import flash.display.MovieClip;
	import flash.display.PixelSnapping;
	import flash.display.Shape;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.geom.Transform;
	import flash.text.TextField;

	import taven.ClientCore;
	import taven.constant.Align;
	import taven.manager.TipsManager;

	/**
	 * 显示对象的一些常规、频繁操作
	 * @author kramer
	 *
	 */
	public class DisplayUtils
	{
		/**
		 * 将目标移至最上层
		 * @param target
		 *
		 */
		public static function bringToTop(obj:DisplayObject):void
		{
			var parent:DisplayObjectContainer=obj.parent;
			if (parent != null)
			{
				parent.setChildIndex(obj, parent.numChildren - 1);
			}
		}

		/**
		 * 将目标移至最下层
		 * @param target
		 *
		 */
		public static function bringToBottom(obj:DisplayObject):void
		{
			var parent:DisplayObjectContainer=obj.parent;
			if (parent != null)
			{
				parent.setChildIndex(obj, 0);
			}
		}

		/**
		 * 启用/禁用某个按钮的鼠标响应事件
		 * @param obj
		 * @param enabled
		 */
		public static function enableButton(obj:SimpleButton, enabled:Boolean):void
		{
			obj.filters=enabled ? null : [ColorUtils.setSaturation(-100)];
			obj.mouseEnabled=enabled;
			obj.enabled=enabled;
		}

		/**
		 * 启用/禁用某个按钮的鼠标响应事件
		 * @param obj
		 * @param enabled
		 */
		public static function enableInteractiveObject(obj:Sprite, enabled:Boolean):void
		{
			obj.mouseEnabled=enabled;
			obj.mouseChildren=enabled;
		}

		public static function enableTextField(obj:TextField, enabled:Boolean):void
		{
			obj.mouseEnabled=enabled;
		}

		/**
		 * 从父容器移除
		 * @param displayObj
		 */
		public static function removeFromParent(obj:DisplayObject):void
		{
			if (obj && obj.parent != null)
			{
				obj.parent.removeChild(obj);
			}
		}

		/**
		 * 清理图片数据
		 * @param bitmap
		 */
		public static function disposeBitmap(bitmap:Bitmap):void
		{
			if (bitmap && bitmap.bitmapData)
			{
				bitmap.bitmapData.dispose();
			}
		}

		/**
		 * 获取某个对象是某个根容器下在的子元件的子元件
		 * @param root
		 * @param obj
		 * @return
		 */
		public static function getChildIndexForContainer(root:DisplayObjectContainer, obj:DisplayObject):int
		{
			var childNum:int=root.numChildren;
			for (var i:int=0; i < childNum; i++)
			{
				var child:DisplayObjectContainer=root.getChildAt(i) as DisplayObjectContainer;
				if (child)
				{
					if (obj == child || child.contains(obj))
					{
						return i;
					}
				}
			}
			return -1;
		}

		/**
		 * 对应显示对象
		 * @param obj
		 * @param type
		 * @param rect
		 * @param offset
		 *
		 */
	/*	public static function alignView(obj:DisplayObject, type:int, rect:Rectangle=null, offset:Point=null, forceRect:Rectangle=null):void
		{
			if (rect == null)
			{
				rect=new Rectangle(0, 0, ClientCore.stage.stageWidth, ClientCore.stage.stageHeight);
			}
			if (offset)
			{
				rect.offsetPoint(offset);
			}
			var viewRect:Rectangle=forceRect; //某些图形 有多帧， 直接obj.getRect(obj) 有问题 用强制矩形
			if (forceRect == null)
				viewRect=obj.getRect(obj);
			var width:Number=rect.width - viewRect.width;
			var height:Number=rect.height - viewRect.height;
			switch (type)
			{
				case Align.TOPLEFT:
				{
					obj.x=rect.x - viewRect.x;
					obj.y=rect.y - viewRect.y;
					break;
				}
				case Align.TOP:
				{
					obj.x=rect.x + width / 2 - viewRect.x;
					obj.y=rect.y - viewRect.y;
					break;
				}
				case Align.TOPRIGHT:
				{
					obj.x=rect.x + width - viewRect.x;
					obj.y=rect.y - viewRect.y;
					break;
				}
				case Align.LEFT:
				{
					obj.x=rect.x - viewRect.x;
					obj.y=rect.y + height / 2 - viewRect.y;
					break;
				}
				case Align.CENTER:
				{
					obj.x=rect.x + width / 2 - viewRect.x;
					obj.y=rect.y + height / 2 - viewRect.y;
					break;
				}
				case Align.RIGHT:
				{
					obj.x=rect.x + width - viewRect.x;
					obj.y=rect.y + height / 2 - viewRect.y;
					break;
				}
				case Align.LEFTBOTTOM:
				{
					obj.x=rect.x - viewRect.x;
					;
					obj.y=rect.y + height - viewRect.y;
					break;
				}
				case Align.BOTTOM:
				{
					obj.x=rect.x + width / 2 - viewRect.x;
					obj.y=rect.y + height - viewRect.y;
					break;
				}
				case Align.RIGHTBOTTOM:
				{
					obj.x=rect.x + width - viewRect.x;
					obj.y=rect.y + height - viewRect.y;
					break;
				}
			}
		}
*/
		/**
		 * 创建遮挡层
		 * @param alpha
		 * @return
		 *
		 */
		public static function createCoverLayer(alpha:Number=0.5):Sprite
		{
			var maskLayer:Sprite=new Sprite();
			var mask:Shape=new Shape();
			mask.graphics.beginFill(0x00, alpha);
			mask.graphics.drawRect(0, 0, ClientCore.stage.stageWidth, ClientCore.stage.stageHeight);
			mask.graphics.endFill();
			maskLayer.addChild(mask);
			return maskLayer;
		}

		/**
		 * 调整坐标结构
		 * @param obj
		 *
		 */
		public static function ajustCoordinate(obj:DisplayObject):void
		{
			var parent:DisplayObjectContainer=obj.parent;
			if (parent == null)
			{
				return;
			}
			var rect:Rectangle=obj.getBounds(parent);
			obj.x=-rect.left - rect.width / 2;
			obj.y=-rect.top - rect.height;
		}

		/**
		 * 禁用所有没有名字的子对象
		 * @param container
		 *
		 */
		public static function disableNonameChildren(container:DisplayObjectContainer):void
		{
			var len:int=container.numChildren;
			for (var i:int=0; i < len; i++)
			{
				var child:InteractiveObject=container.getChildAt(i) as InteractiveObject;
				if (child == null)
				{
					continue;
				}

				var defaultNamePrefix:String="instance";
				var name:String=child.name;
				if ((name == null) || (name == "") || StringUtils.startsWith(name, defaultNamePrefix))
				{
					child.mouseEnabled=false;
					if (child is DisplayObjectContainer)
					{
						(child as DisplayObjectContainer).mouseChildren=false;
					}
				}
			}
		}

		/**
		 * 停止一个容器里的所有MovieClip,如果当前容器是MovieClip，也停止
		 * @param dis
		 */
		public static function stopAllMovieClip(dis:DisplayObjectContainer):void
		{
			var mc:MovieClip=dis as MovieClip;
			if (mc != null)
			{
				mc.stop();
				mc=null;
			}
			var num:int=dis.numChildren - 1;
			if (num < 0)
			{
				return;
			}
			var child:DisplayObjectContainer;
			for (var i:int=num; i >= 0; i--)
			{
				child=dis.getChildAt(i) as DisplayObjectContainer;
				if (child != null)
				{
					stopAllMovieClip(child);
				}
			}
		}

		/**
		 * 开始一个容器里所有MovieClip
		 * @param dis
		 */
		public static function startAllMovieClip(dis:DisplayObjectContainer):void
		{
			var mc:MovieClip=dis as MovieClip;
			if (mc != null)
			{
				mc.play();
				mc=null;

				var num:int=dis.numChildren - 1;
				if (num < 0)
				{
					return;
				}
				var child:DisplayObjectContainer;
				for (var i:int=num; i >= 0; i--)
				{
					child=dis.getChildAt(i) as DisplayObjectContainer;
					if (child != null)
					{
						startAllMovieClip(child);
					}
				}
			}
		}

		/**
		 * 删除一个容器中所有的子显示对象
		 */
		public static function removeAllChild(dis:DisplayObjectContainer):void
		{
			var num:int=dis.numChildren - 1;
			if (num < 0)
			{
				return;
			}
			var child:DisplayObject;
			for (var i:int=num; i >= 0; i--)
			{
				child=dis.getChildAt(i);
				if (child != null)
				{
					removeFromParent(child);
				}
			}
		}

		/**
		 * 获取显示对象指定位置的颜色
		 * @param src
		 * @param x
		 * @param y
		 * @param getAlpha
		 * @return
		 *
		 */
		public static function getColor(target:DisplayObject, x:uint=0, y:uint=0, getAlpha:Boolean=false):uint
		{
			var bmp:BitmapData=new BitmapData(target.width, target.height);
			bmp.draw(target);
			var color:uint=(!getAlpha) ? bmp.getPixel(int(x), int(y)) : bmp.getPixel32(int(x), int(y));
			bmp.dispose();
			return color;
		}

		/**
		 * 等比缩放指定大小
		 * @param target
		 * @param num
		 *
		 */
		public static function uniformScale(target:DisplayObject, num:Number):void
		{
			if (target.width >= target.height)
			{
				target.width=num;
				target.scaleY=target.scaleX;
			}
			else
			{
				target.height=num;
				target.scaleX=target.scaleY;
			}
		}

		/**
		 * 将显示对象用bitmapdata draw成一张位图，返回的位图坐标与原先的display对象内部元素的X，Y坐标相同
		 * @return
		 *
		 */
		public static function copyDisplayAsBmp(dis:DisplayObject, smoothing:Boolean=true):Bitmap
		{
			var oldX:Number;
			var oldY:Number;

			oldY=dis.scaleY;
			oldX=dis.scaleX;

			var bmpdata:BitmapData=new BitmapData(dis.width, dis.height, true, 0);
			var rect:Rectangle=dis.getRect(dis);
			var matrix:Matrix=new Matrix();
			//matrix.translate(-rect.x,-rect.y);
			if (oldX < 0)
				dis.scaleX=-dis.scaleX;
			if (oldY < 0)
				dis.scaleY=-dis.scaleY;
			matrix.createBox(dis.scaleX, dis.scaleY, 0, -rect.x * dis.scaleX, -rect.y * dis.scaleY);
			bmpdata.draw(dis, matrix);

			dis.scaleX=oldX;
			dis.scaleY=oldY;

			var bmp:Bitmap=new Bitmap(bmpdata, PixelSnapping.AUTO, smoothing);
			if (oldX < 0)
				bmp.scaleX=-1;
			if (oldY < 0)
				bmp.scaleY=-1;
			bmp.x=rect.x * dis.scaleX;
			bmp.y=rect.y * dis.scaleY;
			return bmp;
		}

		private static const START_TYPE_LEFT:uint=0;
		private static const START_TYPE_RIGHT:uint=1;
		private static const START_TYPE_TOP:uint=2;
		private static const START_TYPE_BUTTOM:uint=3;

		/**
		 * 获取实际的显示尺寸
		 * @param source
		 * @return
		 */
		public static function getActualViewSize(source:DisplayObject):Point
		{
			var rect:Rectangle=source.getBounds(source);
			var bitmapData:BitmapData=new BitmapData(rect.width, rect.height, true, 0x00);
			bitmapData.draw(source);

			var lineLeft:uint=getValidLine(bitmapData, START_TYPE_LEFT);
			var lineRight:uint=getValidLine(bitmapData, START_TYPE_RIGHT);
			var lineTop:uint=getValidLine(bitmapData, START_TYPE_TOP);
			var lineButtom:uint=getValidLine(bitmapData, START_TYPE_BUTTOM);

			bitmapData.dispose();
			bitmapData=null;

			return new Point(lineRight - lineLeft + 1, lineButtom - lineTop + 1);
		}

		/**
		 * 获取有效的线的位置
		 * @param bmpd
		 * @param startType
		 * @return
		 */
		private static function getValidLine(bmpd:BitmapData, startType:uint):uint
		{
			var i:int;
			var j:int;
			var height:int=bmpd.height;
			var width:int=bmpd.width;

			switch (startType)
			{
				case START_TYPE_LEFT:
					for (i=0; i < width; i++)
					{
						for (j=0; j < height; j++)
						{
							if (bmpd.getPixel32(i, j) != 0)
							{
								return i;
							}
						}
					}
					break;
				case START_TYPE_RIGHT:
					for (i=width - 1; i >= 0; i--)
					{
						for (j=0; j < height; j++)
						{
							if (bmpd.getPixel32(i, j) != 0)
							{
								return i;
							}
						}
					}
					break;
				case START_TYPE_TOP:
					for (j=0; j < height; j++)
					{
						for (i=0; i < width; i++)
						{
							if (bmpd.getPixel32(i, j) != 0)
							{
								return j;
							}
						}
					}
					break;
				case START_TYPE_BUTTOM:
					for (j=height - 1; j >= 0; j--)
					{
						for (i=0; i < width; i++)
						{
							if (bmpd.getPixel32(i, j) != 0)
							{
								return j;
							}
						}
					}
					break;
			}
			return 0;
		}

		/**
		 * 灰置显示对象并加以原因的tips
		 */
		public static function setGray(dis:DisplayObject, tips:String="", removeTips:Boolean=false):void
		{
			dis.filters=[ColorUtils.setGrayscale()];
			if (tips != "")
			{
				TipsManager.unRegister(dis);
				TipsManager.register(TipsManager.DEFAULT, dis, tips);
			}
			if (removeTips)
			{
				TipsManager.unRegister(dis);
			}
		}

		/**
		 * 重新亮起显示对象并加以tips
		 */
		public static function revertFromGray(dis:DisplayObject, tips:String="", removeTips:Boolean=false):void
		{
			dis.filters=[];
			if (tips != "")
			{
				TipsManager.unRegister(dis);
				TipsManager.register(TipsManager.DEFAULT, dis, tips);
			}
			if (removeTips)
			{
				TipsManager.unRegister(dis);
			}
		}

		/**
		 * 复制一个显示对象
		 * @param target:目标对象
		 * @param autoAdd:自动添加到与目标同一级的显示列表中
		 */
		public static function clone(target:DisplayObject, autoAdd:Boolean=false):DisplayObject
		{
			var targetClass:Class=Object(target).constructor;

			var duplicate:DisplayObject=new targetClass();

			// 复制属性
			duplicate.transform=target.transform;
			duplicate.filters=target.filters;
			duplicate.cacheAsBitmap=target.cacheAsBitmap;
			duplicate.opaqueBackground=target.opaqueBackground;

			if (target.scale9Grid)
			{
				var rect:Rectangle=target.scale9Grid;

				//处理九宫格切片20倍放大的bug
				rect.x/=20, rect.y/=20, rect.width/=20, rect.height/=20;
				duplicate.scale9Grid=rect;
			}

			if (autoAdd && target.parent)
			{
				target.parent.addChild(duplicate);
			}
			return duplicate;
		}

		/** As3显示对象scrollRect设置之后 高度不对问题  滚动问题*/
		public static function getFullBounds(displayObject:DisplayObject):Rectangle
		{
			var bounds:Rectangle;
			var transform:Transform;
			var toGlobalMatrix:Matrix;
			var currentMatrix:Matrix;
			transform=displayObject.transform;
			currentMatrix=transform.matrix;
			toGlobalMatrix=transform.concatenatedMatrix;
			toGlobalMatrix.invert();
			transform.matrix=toGlobalMatrix;
			bounds=transform.pixelBounds.clone();
			transform.matrix=currentMatrix;
			return bounds;
		}
		
		/** 替换mc  交换位置和层级*/
		public static function replaceDisplayer(srcMc:DisplayObject,target:DisplayObject):void
		{
			if(srcMc&&target)
			{
				target.x=srcMc.x;
				target.y=srcMc.y
				if(srcMc.parent)
				{
					srcMc.parent.addChildAt(target,srcMc.parent.getChildIndex(srcMc));
					srcMc.parent.removeChild(srcMc);
				}
			}
		}
		



	}
}
