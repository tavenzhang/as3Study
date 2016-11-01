package taven.module
{
	import taven.log.Console;
	import taven.resource.SWFLoader;
	import flash.events.EventDispatcher;
	
	/**
	 * 模块代理
	 * @author Taven
	 * 
	 */
	public class ModuleProxy extends EventDispatcher
	{
		private var _url:String;
		private var _loader:SWFLoader;
		private var _module:IModule;
		
		private var _data:*;
		private var _progressHandler:Function;
		private var _completeHandler:Function;
		private var _errorHandler:Function;
		
		public function ModuleProxy(url:String, 
									data:* = null, 
									progressHandler:Function = null, 
									completeHandler:Function = null, 
									errorHandler:Function = null)
		{
			super(this);
			_url = url;
			_data = data;
			_progressHandler = progressHandler;
			_completeHandler = completeHandler;
			_errorHandler = errorHandler;
			//
			_loader = new SWFLoader();
			_loader.progressHandler = _progressHandler;
			_loader.completeHandler = onCompleteHandler;
			_loader.errorHandler = onErrorHandler;
			_loader.load(_url, true);
		}
		
		public function get module():IModule
		{
			return _module;
		}
		
		private function onErrorHandler(loader:SWFLoader):void
		{
			if (_errorHandler != null)
			{
				_errorHandler();
			}
			Console.write(_url + "模块加载失败!!!", Console.ERROR);
			ModuleManager.destroyModule(_url);
		}
		
		private function onCompleteHandler(loader:SWFLoader):void
		{
			_module = _loader.data as IModule;
			_loader.data.resUrl =_url;
			_module.setup();

			if (_completeHandler != null)
			{
				_completeHandler(_url, _module, _data);
			}
		}
		
		public function destroy():void
		{
			_loader.destroy();
			_loader = null;
			_progressHandler = null;
			_completeHandler = null;
			_errorHandler = null;
			//
			if (_module)
			{
				_module.destroy();
				_module = null;
			}
		}
	}
}