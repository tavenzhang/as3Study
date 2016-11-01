package taven.manager
{
	import com.taomee.plugins.pandaVersionManager.PandaVersionManager;
	
	/**
	 * 版本管理
	 * @author Taven
	 *
	 */
	public class VersionManager
	{
		private static var _pandaVersionManager:PandaVersionManager;
		
		public static function setup(manager:PandaVersionManager):void
		{
			_pandaVersionManager = manager;
		}
		
		/**
		 * 版本号 单位秒
		 * @return
		 *
		 */
		public static function get versionTime():Number
		{
			return (_pandaVersionManager.lastModifiedDate as Date).time * 0.001;
		}
		
		/**
		 * 版本显示
		 * @return
		 *
		 */
		public static function get version():String
		{
			var t:Date = _pandaVersionManager.lastModifiedDate as Date;
			var str:String = t.fullYear + "." + (t.getMonth() + 1) + "." + t.getDate() + " " + t.toLocaleTimeString();
			return str;
		}
		
		/**
		 * 带版本号的路径
		 * @param p
		 * @return
		 *
		 */
		public static function getURL(p:String):String
		{
			return PandaVersionManager.getVerURLByNameSpace(p) as String;
		}
	}
}