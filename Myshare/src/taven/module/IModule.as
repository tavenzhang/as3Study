package taven.module
{
	/**
	 * 模块接口
	 * @author Taven
	 */
	public interface IModule
	{
		/**
		 * 加载后的装配
		 */
		function setup():void;
		
		/**
		 * 销毁操作
		 */
		function destroy():void;
		
		/**
		 * 初始化操作
		 * @param	args	传递参数
		 */
		function init(args:* = null):void;
		
		/**
		 * 显示操作
		 */
		function show():void;
		
		/**
		 * 移除操作
		 */
		function hide():void;
	}
}