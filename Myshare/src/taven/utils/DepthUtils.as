package taven.utils
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	
	/**
	 * 深度工具类
	 * @author Taven
	 */
	public class DepthUtils 
	{
		/**
		 * 深度排序
		 * @param container
		 * 
		 */
		public static function swapDepthAll(container:DisplayObjectContainer):void
		{
			var len:int = container.numChildren;
			var arr:Array = [];
			for (var i:int = 0; i < len; i++)
			{
				arr.push(container.getChildAt(i));
			}
			
			arr.sort(sortHandler);
			for (i = 0; i < len; i++)
			{
				var obj:DisplayObject = arr[i];
				if(container.getChildAt(i) == obj)
				{
					continue;
				}
				container.setChildIndex(obj, i);
			}
		}
		
		/**
		 * 排序函数: 先Y轴再X轴
		 * @param obj1
		 * @param obj2
		 * @return 
		 * 
		 */
		private static function sortHandler(obj1:DisplayObject, obj2:DisplayObject):int
		{
			if(int(obj1.name) > 1000000000 || int(obj2.name) > 1000000000) //处理淘淘
			{
				return int(obj1.name) - int(obj2.name);
			}
			else if (obj1.y != obj2.y)
			{
				return obj1.y - obj2.y;
			}
			else if(obj1.x != obj2.x)
			{
				return obj1.x - obj2.x
			}
			return int(obj1.name) - int(obj2.name);
		}
	}
}
