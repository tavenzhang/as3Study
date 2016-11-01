package taven.net
{
	import com.hurlant.crypto.prng.ARC4;
	import com.hurlant.util.Hex;
	import taven.log.Console;
	import taven.utils.ArrayUtils;
	
	import flash.events.EventDispatcher;
	import flash.utils.ByteArray;
	
	/**
	 * 网络封包数据缓存: 用于解决非完整封包及网络堵塞产生的碎片封包的整合
	 * @author Taven
	 */
	public class PacketBuffer extends EventDispatcher
	{
		public static const HEAD_LENGTH:int = 20;
		
		private static const CRYPT_ROUND:int = 4;
		
		// 缓存
		private var _buffer:ByteArray;
		// 消息包状态回调
		public var _statusHandler:Function;
		
		private var _key:ByteArray;
		
		private var _arc:ARC4;
		
		// 协议加密是否启用
		private var _cryptEnabled:Boolean = false;
		
		public function PacketBuffer(statusHandler:Function)
		{
			_statusHandler = statusHandler;
			
			_key = Hex.toArray(Hex.fromString("}E#<*F46XJCLI(BYInIiX:4wq(.YO(~hh.W%w/V~awN#Yyqo!ZZes>9a-cK...r6KZ7]UH.]4MjK:TqO'_Jb=;,x}9ntieahKi/Q6jZ(#A:.PAT.j0iCNbI>lc`;_pTg"));
			_arc = new ARC4();
		}
		
		public function set cryptEnabled(value:Boolean):void
		{
			_cryptEnabled = value;
		}
		
		public function encrypt(buffer:ByteArray):void
		{
			if (_cryptEnabled)
			{
				_arc.init(_key);
				for (var i:int = 0; i < CRYPT_ROUND; i++)
				{
					_arc.encrypt(buffer);
				}
			}
		}
		
		public function decrypt(buffer:ByteArray):void
		{
			if (_cryptEnabled)
			{
				_arc.init(_key);
				for (var i:int = 0; i < CRYPT_ROUND; i++)
				{
					_arc.decrypt(buffer);
				}
			}
		}
		
		/**
		 * 缓存数据
		 * @param	buffer
		 */
		public function push(buffer:ByteArray):void
        {
			if (!_buffer)
			{
				_buffer = buffer;
			}
			else
			{
				var oldPos:int = _buffer.position;
				_buffer.position = _buffer.length;
				_buffer.writeBytes(buffer);
				_buffer.position = oldPos;
            }
        }
		
		/**
		 * 获取有效数据包
		 * @return
		 */
		public function getPackets():Array
		{
			var packets:Array = [];
			try
			{
				while (_buffer.bytesAvailable >= HEAD_LENGTH)
				{
					var packet_len:int = _buffer.readUnsignedInt();
					var stamp:int = _buffer.readUnsignedInt();
					var command_id:int = _buffer.readUnsignedInt();
					var status_code:int = _buffer.readUnsignedInt();
					var checkSum:uint = _buffer.readUnsignedInt();
					if (status_code)
					{
						var dataPacket:DataPacket = new DataPacket(command_id, null);
						if (_statusHandler != null)
						{
							_statusHandler(dataPacket, status_code);
						}
						packets.push(dataPacket);
					}
					else
					{
						var packet_body_len:int = packet_len - HEAD_LENGTH;
						if (_buffer.bytesAvailable < packet_body_len)
						{
							_buffer.position = _buffer.position - HEAD_LENGTH;
							return packets;
						}
						else
						{
							var data:ByteArray = ArrayUtils.createByteArray();
							if (packet_body_len)
							{
								_buffer.readBytes(data, 0, packet_body_len);
								decrypt(data);
							}
							data.position = 0;
							packets.push(new DataPacket(command_id, data));
						}
					}
				}
			}
			catch (error:Error)
			{
				trace("PacketBuffer:getPackets()取数据异常:[" + error.errorID + ":" + error.name + ":" + error.message + ":" + error.getStackTrace() + "]");
			}
			
			if (_buffer.bytesAvailable <= 0)
			{
				_buffer = null;
			}
			
			return packets;
		}
		
		/**
		 * 清理
		 */
		public function clear():void
		{
			_buffer = null;
		}
	}
}
