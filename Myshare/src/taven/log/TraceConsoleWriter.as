package taven.log
{
	/**
	 * 通过trace输出日志类
	 * @author Taven 
	 */	
	public class TraceConsoleWriter implements IConsoleWriter
	{
		public function write(msg:String, type:String):void
		{
			trace(msg);
		}
	}
}