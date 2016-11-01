package taven.net
{
	import flash.utils.ByteArray;
	
	/**
	 * 网络数据包
	 * @author Taven
	 */
	public final class DataPacket 
	{
		private var _command:int;
		
		private var _data:ByteArray;
		
		public function DataPacket(command:int, data:ByteArray) 
		{
			_command = command;
			_data = data;
		}
		
		public function get command():int 
		{
			return _command;
		}
		
		public function set command(value:int):void 
		{
			_command = value;
		}
		
		public function get data():ByteArray 
		{
			return _data;
		}
		
		public function set data(value:ByteArray):void 
		{
			_data = value;
		}
		
	}
}
