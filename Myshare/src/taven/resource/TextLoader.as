package taven.resource
{
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.events.ProgressEvent;
    import flash.events.SecurityErrorEvent;
    import flash.net.URLLoader;
    import flash.net.URLLoaderDataFormat;
    import flash.net.URLRequest;

    /**
     * 文本文件加载者
     */
    public class TextLoader extends RESLoader
    {
		// 加载器
		private var _urlloader:URLLoader = new URLLoader();
		
		public function TextLoader()
		{
			_urlloader.dataFormat = URLLoaderDataFormat.TEXT;
		}
		
        /**
         * 侦听加载事件
         */
		override protected function startListener():void 
		{
			_urlloader.addEventListener(Event.COMPLETE, complete);
			_urlloader.addEventListener(ProgressEvent.PROGRESS, progress);
			_urlloader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			_urlloader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
		}

        /**
         * 移除侦听
         */
        override protected function stopListener():void
        {
			_urlloader.removeEventListener(Event.COMPLETE, complete);
			_urlloader.removeEventListener(ProgressEvent.PROGRESS, progress);
			_urlloader.removeEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			_urlloader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
        }

        /**
         * 开始加载
         * @param	url
         */
		override public function load(url:String, currentdomain:Boolean = false):void 
		{
			super.load(url, currentdomain);
			_urlloader.load(new URLRequest(loadurl));
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
         * 稍候再尝试加载
         */
		override protected function delayToLoad():void 
		{
			_urlloader.close();
			super.delayToLoad();
		}

        override public function get data():* 
		{
			return _urlloader.data;
		}
		
		override public function destroy():void
		{
			super.destroy();
			//_urlloader.close();
			_urlloader = null;
		}
	}
}
