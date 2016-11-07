package com.net.core {
import com.junkbyte.console.Cc;
import com.net.util.CRC32;
import com.net.util.MsgUtil;
import com.netease.protobuf.Message;

import flash.events.*;
import flash.net.*;
import flash.utils.*;

public class NetSocket extends EventDispatcher {
    public const HEAD_LENGTH:int = 8;
    public var socket:Socket = null;

    private var this_packet_total_len:uint;
    private var msgId:uint;
    private var _dataByteBuff:ByteArray;
	private var _tempByteBuff:ByteArray;
    //private var this_packet_crc32:uint;

    public function NetSocket(server:String, port:int) {
        _dataByteBuff  = MsgUtil.creatByteArray();
		_tempByteBuff =MsgUtil.creatByteArray();
        socket = new Socket;
        socket.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
        socket.addEventListener(Event.CLOSE, Net_Error);
        socket.addEventListener(Event.CONNECT, Net_Connect);
        socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
        socket.addEventListener(ProgressEvent.SOCKET_DATA, Net_Data);
        socket.connect(server, port);
        return;
    }// end function

    private function ioErrorHandler(evt:IOErrorEvent):void {
        trace("Connection-ioErrorHandler");
        dispatchEvent(new NetEvent(NetEvent.ON_DISCONNECT));
    }

    private function securityErrorHandler(evt:SecurityErrorEvent):void {
        trace("Connection-securityErrorHandler");
    }

    private function Net_Error(evt:Event):void {
        trace("Connection-Net_Error");
        dispatchEvent(new NetEvent(NetEvent.ON_DISCONNECT));
    }

    private function Net_Connect(evt:Event):void {
        trace('Connected');
        dispatchEvent(new NetEvent(NetEvent.ON_CONNECT));
    }


    //
    private function Net_Data(evt:ProgressEvent):void {
      //  trace("终于收到数据了---------------------------")
        try {
			_tempByteBuff.position=0;
            _dataByteBuff.position =_dataByteBuff.length;
            socket.readBytes(_dataByteBuff,_dataByteBuff.length);
            var breakcount:int = 0;
            while (true) {
                //当_dataByteBuff没有数据或者 breakcount》20，数据不够head的时候 尝试20次 不行的话 等待下一次事件
                if (_dataByteBuff.bytesAvailable < 1) {
				  _dataByteBuff.position=0;
				  _dataByteBuff.length=0;
                    break;
                }
                if(msgId<=0)
                {
                    if( _dataByteBuff.bytesAvailable >=HEAD_LENGTH)
                    {
                        msgId = _dataByteBuff.readUnsignedShort();
                       // trace("msgid="+msgId);
                        _dataByteBuff.readUnsignedShort();
                        this_packet_total_len = _dataByteBuff.readInt()
                        //trace("packet_total_len ="+this_packet_total_len);
                    }
                }
                else
                {
                    if(_dataByteBuff.bytesAvailable>=this_packet_total_len)
                    {
                        _dataByteBuff.readBytes(_tempByteBuff,0,this_packet_total_len);
                        var message:Message = MessageManager.getMsg(msgId);
                        if (message)
                        {
                            message.mergeFrom(_tempByteBuff);
                            this.dispatchEvent(new NetEvent(NetEvent.ON_PACKET, msgId.toString(), message));
                            Cc.log("keith","receive---->msgid="+msgId+"message="+message.toString());
                        }
                        this_packet_total_len =0;
                        msgId=0;
                    }
                }
            }
        }
        catch
         (e:Error) {
		 	this_packet_total_len =0;
            msgId=0;
            trace("Connection:Net_Data() 数据错误[" + e.errorID + ":" + e.name + ":" + e.message + ":" + e.getStackTrace() + "]");
        }
    }


    public function send_to_net(msgId:uint, message:Message):void {
        var body:ByteArray = MsgUtil.creatByteArray();
        message.writeTo(body);
        var head:ByteArray = MsgUtil.creatByteArray();//
        head.writeInt(msgId);
        head.writeInt(body.length);
        socket.writeBytes(head, 0, HEAD_LENGTH);
        socket.writeBytes(body, 0, body.length);
        socket.flush();
    }
}
}
