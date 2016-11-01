package taven.log
{

	/**
	 * 控制台工具类
	 * @author Taven
	 */
	public class Console
	{
		public static const INFO:String = "info";
		public static const WARNING:String = "warning";
		public static const ERROR:String = "error";
		
		private static var _writerList:Array = [];
		
		public function addWriter(value:IConsoleWriter):void
		{
			_writerList.push(value);
		}
		
		public static function write(msg:String, type:String = "info"):void
		{
			for each(var writer:IConsoleWriter in _writerList)
			{
				writer.write(msg, type);
			}
		}
	}
}