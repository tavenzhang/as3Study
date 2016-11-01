package taven.net
{
	import taven.utils.ArrayUtils;
	import taven.utils.CheckSumUtils;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.Socket;
	import flash.utils.ByteArray;
	import flash.utils.Endian;

	/**
	 * 网络套接字管理
	 * @author Taven
	 */
    public class NetProxy extends EventDispatcher
    {
		// 套接字
		private var _socket:Socket = null;
		
		// 封包缓存
		private var _packetBuffer:PacketBuffer;
		
		// 序列号
		private var _seqNo:int;
		
		public function NetProxy()
        {
			_socket = new Socket();
			_socket.endian = Endian.LITTLE_ENDIAN;
			_socket.addEventListener(IOErrorEvent.IO_ERROR, IOErrorHandler);
			_socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
			_socket.addEventListener(Event.CLOSE, closeErrorHandler);
			_socket.addEventListener(Event.CONNECT, connectHandler);
			_socket.addEventListener(ProgressEvent.SOCKET_DATA, socketDataHandler);
			
			_packetBuffer = new PacketBuffer(statusHandler);
        }
		
		public function set timeout(value:int):void
		{
			_socket.timeout = value;
		}
		
		public function set cryptEnabled(value:Boolean):void
		{
			_packetBuffer.cryptEnabled = value;
		}
		
		public function set seqNo(value:int):void
		{
			_seqNo = value;
		}
		
		/**
		 * 连接
		 * @param	host
		 * @param	port
		 */
		public function connect(host:String, port:int):void
		{
			close();
			_socket.connect(host, port);
		}
		
		/**
		 * 关闭连接
		 */
		public function close():void
		{
			if (_socket && _socket.connected)
			{
				_socket.close();
			}
		}
		
		/**
		 * 连接成功响应
		 * @param	event
		 */
		private function connectHandler(event:Event):void
		{
			dispatchEvent(new SocketEvent(SocketEvent.CONNECT));
		}
		
		/**
		 * IO错误响应
		 * @param	event
		 */
		private function IOErrorHandler(event:IOErrorEvent):void
		{
			dispatchEvent(new SocketEvent(SocketEvent.ERROR));
		}
		
		/**
		 * 安全问题错误响应
		 * @param	event
		 */
		private function securityErrorHandler(event:SecurityErrorEvent):void
		{
			dispatchEvent(new SocketEvent(SocketEvent.ERROR));
		}
		
		/**
		 * 连接关闭响应
		 * @param	event
		 */
		private function closeErrorHandler(event:Event):void
		{
			dispatchEvent(new SocketEvent(SocketEvent.DISCONNECT));
		}
		
		/**
		 * 消息包状态响应
		 * @param status
		 * 
		 */
		private function statusHandler(dataPacket:DataPacket, status:int):void
		{
			dispatchEvent(new SocketEvent(SocketEvent.STATUS, dataPacket, status));
		}
		
		/**
		 * 网络封包消息响应
		 * @param	event
		 */
		private function socketDataHandler(event:ProgressEvent):void
		{
			var byteTotal:ByteArray = ArrayUtils.createByteArray();
			_socket.readBytes(byteTotal, 0, event.bytesTotal);
			_packetBuffer.push(byteTotal);
			var packets:Array = _packetBuffer.getPackets();
			for each(var dataPacket:DataPacket in packets)
			{
				dispatchEvent(new SocketEvent(SocketEvent.DATA, dataPacket));
			}
		}
		
		/**
		 * 刷新序列号
		 * @param packetLen
		 * @param command
		 * @return 
		 */
		public function refreshSeqNo(packetLen:int, command:int):int
		{
			_seqNo = _seqNo - int(_seqNo / 7) + 147 + packetLen % 21 + command % 13;
			return _seqNo;
		} 

		/**
		 * 发送消息封包
		 * @param command
		 * @param data
		 * 
		 */
		public function send(command:int, data:ByteArray = null, userid:int = 0):void
		{
			// 消息内容
			var bodyLen:int = 0;
			var sum:uint = 0;
			
			if (data)
			{
				_packetBuffer.encrypt(data);
				data.position = 0;
				bodyLen = data.length;
			}
			
			if (_socket.connected)
			{
				refreshSeqNo(PacketBuffer.HEAD_LENGTH + bodyLen, command);
				_socket.writeUnsignedInt(PacketBuffer.HEAD_LENGTH + bodyLen);
				_socket.writeUnsignedInt(_seqNo);
				_socket.writeUnsignedInt(command);
				_socket.writeUnsignedInt(userid);
				if (data)
				{
					_socket.writeUnsignedInt(CheckSumUtils.getCheckSum(data));
					_socket.writeBytes(data);
				}
				else
				{
					_socket.writeUnsignedInt(0);
				}
				_socket.flush();
			}
		}
    }
}