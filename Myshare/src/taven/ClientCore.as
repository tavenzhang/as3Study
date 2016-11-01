package taven
{
	import flash.display.Stage;

	/**
	 * 核心配置
	 * @author Taven
	 */
	public class ClientCore
	{
		private static var _stage:Stage;
		
		public static function setup(stage:Stage):void
		{
			_stage = stage;
		}
		
		public static function get stage():Stage
		{
			return _stage;
		}
	}
}