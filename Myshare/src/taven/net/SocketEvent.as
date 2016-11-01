package taven.net
{
	import flash.events.Event;
	
	/**
	 * 套接字事件
	 * @author Taven
	 */
    public class SocketEvent extends Event
    {
		public static const CONNECT:String = "connect";
        public static const DISCONNECT:String = "disconnect";
		public static const DATA:String = "data";
		public static const ERROR:String = "error";
		public static const STATUS:String = "status";
		
		// 消息内容
        private var _dataPacket:DataPacket;
		// 消息状态
		private var _status:int;

        public function SocketEvent(name:String, dataPacket:DataPacket = null, status:int = 0)
        {
            super(name);
			_dataPacket = dataPacket;
			_status = status;
        }
		
		override public function clone():Event 
		{
			return new SocketEvent(type, dataPacket, status);
		}
		
		public function get dataPacket():DataPacket 
		{
			return _dataPacket;
		}
		
		public function get status():int
		{
			return _status;
		}

    }
}
