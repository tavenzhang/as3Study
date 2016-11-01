package taven.resource
{
	import taven.manager.FrameManager;

	/**
	 * 资源加载器
	 * @author Taven
	 */
	public class RESLoader 
	{
		// 进度回调
		public var progressHandler:Function;
        // 完成回调
		public var completeHandler:Function;
        // 异常回调
		public var errorHandler:Function;		
		// 资源地址
        private var _url:String;
		// 重试次数
		private var _reloadCount:int = 2;
		// 是否用当前应用程序域
		protected var _currentdomain:Boolean;
		// 随机重试
        protected var _urlRnd:int = 0;
		
		public function load(url:String, currentdomain:Boolean = false):void
		{
            _url = url;
			_currentdomain = currentdomain;
			startListener();
		}
		
		protected function startListener():void
		{
			
		}
		
		protected function stopListener():void
		{
			
		}
		
		protected function delayToLoad():void
		{
			if (_reloadCount <= 0)
            {
                stopListener();
                if (errorHandler != null)
                {
                    errorHandler(this);
                }
                return;
            }
            
			_reloadCount--;
			FrameManager.addTickListener(100, reload, null, 1);
		}
		
		private function reload():void
        {
            _urlRnd++;
            load(_url);
        }
		
		public function get url():String
		{
			return _url;
		}
		
		protected function get loadurl():String
		{
			if (_urlRnd > 0)
			{
				return _url;
			}
			else
			{
				if (_url.indexOf("?") >= 0)
				{
					return _url + "&rnd=" + _urlRnd;
				}
				else
				{
					return _url + "?rnd=" + _urlRnd;
				}
			}
		}
		
		public function clear():void
		{
			stopListener();
		}
		
		public function get data():*
		{
			return null;
		}
		
		public function destroy():void
		{
			progressHandler = null;
			completeHandler = null;
			errorHandler = null;
		}
	}
}