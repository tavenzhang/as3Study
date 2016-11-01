package taven.module
{
	import taven.dataset.HashMap;

	/**
	 * 模块管理器
	 * @author Taven
	 * 
	 */
	public class ModuleManager
	{
		private static var _moduleMap:HashMap;
		
		private static var _manualModuleMap:HashMap;
		
		initialize();
		
		private static function initialize():void
		{
			_moduleMap = new HashMap();
			_manualModuleMap = new HashMap();
		}
		
		public static function addManualModule(url:String, module:IModule):void
		{
			if (!_manualModuleMap.getValue(url))
			{
				_manualModuleMap.add(url, module);
				module.setup();
			}
		}
		
		public static function getModule(url:String):IModule
		{
			var moduleProxy:ModuleProxy = _moduleMap.getValue(url) as ModuleProxy;
			if (moduleProxy != null)
			{
				return moduleProxy.module;
			}
			return _manualModuleMap.getValue(url) as IModule;
		}
		
		/**
		 * 加载模块
		 * @param url
		 * @param progressHandler
		 * @param completeHandler
		 * @param errorHandler
		 * 
		 */
		public static function loadModule(url:String, 
										  data:* = null, 
										  progressHandler:Function = null, 
										  completeHandler:Function = null, 
										  errorHandler:Function = null):void
		{
			var moduleProxy:ModuleProxy = _moduleMap.getValue(url) as ModuleProxy;
			if (moduleProxy != null)
			{
				if (completeHandler != null)
				{
					completeHandler(url, moduleProxy.module, data);
				}
			}
			else
			{
				var module:IModule = _manualModuleMap.getValue(url) as IModule;
				if (module)
				{
					if (completeHandler != null)
					{
						completeHandler(url, module, data);
					}
				}
				else
				{
					moduleProxy = new ModuleProxy(url, data, progressHandler, completeHandler, errorHandler);
					_moduleMap.add(url, moduleProxy);
				}
			}
		}
		
		/**
		 * 销毁模块
		 * @param url
		 * 
		 */
		public static function destroyModule(url:String):void
		{
			var moduleProxy:ModuleProxy = _moduleMap.getValue(url) as ModuleProxy;
			if (moduleProxy)
			{
				moduleProxy.destroy();
				_moduleMap.remove(url);
			}
		}
	}
}