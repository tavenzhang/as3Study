package com.net.core {
import com.net.util.CRC32;
import com.net.util.MsgUtil;
import com.netease.protobuf.Message;

import flash.events.*;
import flash.net.*;
import flash.utils.*;

public class AMF3Socket extends EventDispatcher {
    public const HEAD_LENGTH:int = 2;

    public function AMF3Socket(server:String, port:int) {
        socket = new Socket();
        socket.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
        socket.addEventListener(Event.CLOSE, Net_Error);
        socket.addEventListener(Event.CONNECT, Net_Connect);
        socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
        socket.addEventListener(ProgressEvent.SOCKET_DATA, Net_Data);
        socket.connect(server, port);
        return;
    }

    public var socket:Socket = null;
    private var amfStream:ByteArray;
    private var isReadHeader:Boolean;
    private var amfStreamLength:Number;
    private var buffer:ByteArray = MsgUtil.creatByteArray();
    private var HEADERSIZE:uint = 2;// end function



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


    //

    private function Net_Connect(evt:Event):void {
        trace('Connected');
        dispatchEvent(new NetEvent(NetEvent.ON_CONNECT));
    }
    //直接利用socket.bytesAvailable  socket 缓冲区  接受消息
    private function Net_Data(evt:ProgressEvent):void {
        trace("终于收到数据了---------------------------")
        while (socket.bytesAvailable >= this.HEADERSIZE) {
            //如果缓冲区可读文件大于文件头的字节长度
//            trace("ByteAvailable:" + this.bytesAvailable);
//            trace("Buffer Length:" + this.buffer.length);
            if (this.isReadHeader == false) {
                this.isReadHeader = true;
                socket.readBytes(this.buffer, 0, this.HEADERSIZE);
                this.buffer.position = 0;
                this.amfStreamLength = this.buffer.readShort();
                //trace(this.amfStreamLength);
            }
            this.amfStream =  MsgUtil.creatByteArray();
            if (socket.bytesAvailable < this.amfStreamLength) {
//                trace("数据长度不够");
                return;
            }
            socket.readBytes(this.amfStream, 0, this.amfStreamLength);
            if (this.amfStream.length == this.amfStreamLength) {
                //TODO
                this.isReadHeader = false;
                amfStream.uncompress();
                var msg:Object = this.amfStream.readObject();
                //数据消息处理
                //  NetManager.getInstance().client.socketApp(msg);
            } else if (this.amfStream.length > this.amfStreamLength) {
                //如果读出来的对象大于所需的长度立即中断
                //trace("Error!");
                socket.close();
                return;
            }
        }
    }

    //发送消息
    public function sendDataObject(_obj:Object, cmd:int = -1):void {
        if (socket == null || socket.connected == false) {
            return;
        }
        try {
            if (cmd != -1 || !_obj.hasOwnProperty("cmd")) {
                _obj.cmd = cmd;
            }
            var _byteArray:ByteArray = new ByteArray();
            _byteArray.writeObject(_obj);
            _byteArray.compress();
            socket.writeBytes(_byteArray);
            socket.writeUTF("\r\n");
            socket.flush();
        } catch (e:*) {
            trace("NetManager->sendDataObject:" + e);
        }
    }
}
}
