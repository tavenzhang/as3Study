package taven.resource
{
    import flash.display.Loader;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.events.ProgressEvent;
    import flash.events.SecurityErrorEvent;
    import flash.net.URLRequest;
    import flash.system.ApplicationDomain;
    import flash.system.LoaderContext;

    /**
     * SWF文件加载者
     */
    public class SWFLoader extends RESLoader
    {
		// 加载器
		private var _loader:Loader;
		
        /**
         * 侦听加载事件
         */
		override protected function startListener():void 
		{
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, complete);
			_loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, progress);
			_loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			_loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
		}

        /**
         * 移除侦听
         */
        override protected function stopListener():void
        {
			_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, complete);
			_loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, progress);
			_loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			_loader.contentLoaderInfo.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
        }

        /**
         * 开始加载
         * @param	url
         */
		override public function load(url:String, currentdomain:Boolean = false):void 
		{
			if (!_loader)
			{
				_loader = new Loader()
			}
			super.load(url, currentdomain);
			var context:LoaderContext = new LoaderContext(false, _currentdomain ? ApplicationDomain.currentDomain : null);
			_loader.load(new URLRequest(loadurl), context);
		}

        /**
         * 加载完成
         * @param	event
         */
        private function complete(event:Event):void
        {
			stopListener();
			if (completeHandler != null)
			{
				completeHandler(this);
			}
        }

        /**
         * 加载中
         * @param	event
         */
        private function progress(event:ProgressEvent):void
        {
            if (progressHandler != null)
            {
				var percent:int = Math.floor(event.bytesLoaded * 100 / event.bytesTotal);
                percent = Math.min(100, percent);
                progressHandler(percent);
            }
        }

        /**
         * 安全沙箱错误
         * @param	event
         */
        private function securityErrorHandler(event:SecurityErrorEvent):void
        {
            delayToLoad();
        }

        /**
         * IO错误
         * @param	event
         */
        private function ioErrorHandler(event:IOErrorEvent):void
        {
            delayToLoad();
        }
		
		/**
		 * 清理
		 */
		override public function clear():void 
		{
			super.clear();
			//_loader.close();
			_loader.unload();
			_loader = null;
		}
		
        /**
         * 稍候再尝试加载
         */
		override protected function delayToLoad():void 
		{
			_loader.unload();
			super.delayToLoad();
		}

        override public function get data():* 
		{
			return _loader.content;
		}
		
		override public function destroy():void
		{
			super.destroy();
			//_loader.unload();
			_loader = null;
		}
	}
}
