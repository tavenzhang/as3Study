package com.net.core {
import com.caller.call.CallBack;
import com.junkbyte.console.Cc;
import com.net.util.MsgUtil;
import com.netease.protobuf.Message;

import flash.events.*;
import flash.net.*;
import flash.utils.*;

public class NetEngine extends EventDispatcher {
    private var netSocket:NetSocket = null;
    private var callBack:CallBack;

    private var baseMsg:Msg;

    public function NetEngine():void {
        callBack = new CallBack;
        baseMsg = new Msg;
    }

    public function connect(server:String, port:int):void {
        this.netSocket = new NetSocket(server, port);
        this.netSocket.addEventListener(NetEvent.ON_PACKET, this.onPacket);
        this.netSocket.addEventListener(NetEvent.ON_CONNECT, this.onConnect);
        this.netSocket.addEventListener(NetEvent.ON_DISCONNECT, this.onDisconnect);
        return;
    }

    public function close():void {
        if (this.netSocket && this.netSocket.socket && this.netSocket.socket.connected) {
            this.netSocket.socket.close();
        }
        return;
    }

    public function send(message:Message,msgId:uint):void {
        this.netSocket.send_to_net(msgId,message);
        Cc.log("keith","send---->msgid="+msgId+"    message="+message.toString());
        return;
    }

    /**
     *   发送基本数据
     * */
    public function callBaseMsg(msgId:uint, message:Message):void {
//        baseMsg.func = funcName;
//        baseMsg.param = arr;
        this.netSocket.send_to_net(msgId,message);
        return;
    }

    private function onConnect(event:NetEvent):void {
        dispatchEvent(new NetEvent(NetEvent.ON_CONNECT));
        return;
    }

    private function onDisconnect(event:NetEvent):void {
        dispatchEvent(event);
        return;
    }

    private function onPacket(event:NetEvent):void {
        callBack.dispatch(event.funcName, event.message);
        return;
    }

    public function addCallback(type:String, func:Function):void {
        callBack.addCallback(type, func);
    }
}

}
