package taven.resource
{
    import flash.display.Loader;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.net.URLRequest;

    /**
     * Image文件加载者
     */
    public class ImageLoader extends RESLoader
    {
		// 加载器
		private var _loader:Loader = new Loader();
		
        /**
         * 侦听加载事件
         */
		override protected function startListener():void 
		{
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, complete);
			_loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
		}

        /**
         * 移除侦听
         */
        override protected function stopListener():void
        {
			_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, complete);
			_loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
        }

        /**
         * 开始加载
         * @param	url
         */
		override public function load(url:String, currentdomain:Boolean = false):void 
		{
			super.load(url);
			_loader.load(new URLRequest(loadurl));
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
			//_loader.close();
			//_loader.unload();
			_loader = null;
		}
	}
}
