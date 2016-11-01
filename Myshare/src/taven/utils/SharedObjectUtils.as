package taven.utils
{
	import flash.net.SharedObject;

	/**
	 * SO工具类
	 * @author Taven
	 *
	 */
	public class SharedObjectUtils
	{
		/**
		 * 设置SO数据
		 * @param key
		 * @param value
		 * 
		 */
		public static function setData(key:*, value:*):void
		{
			var so:SharedObject = SharedObject.getLocal("blitz_data");
			so.data[key] = value;
			so.flush();
		}
		
		/**
		 * 获取SO数据
		 * @param key
		 * @return 
		 * 
		 */
		public static function getData(key:*):*
		{
			var so:SharedObject = SharedObject.getLocal("blitz_data");
			return so.data[key];
		}
	}
}