package taven.log
{
	import taven.ClientCore;
	import taven.utils.AlertUtils;

	/**
	 * 通过工具弹出窗输出日志类
	 * @author Taven 
	 */	
	public class AlertConsoleWriter implements IConsoleWriter
	{
		public function write(msg:String, type:String):void
		{
			AlertUtils.show(ClientCore.stage, msg);
		}
	}
}