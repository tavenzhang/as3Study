package com.net.core
{
import com.netease.protobuf.Message;

import flash.events.*;
    import flash.utils.*;

    public class NetEvent extends Event
    {
        public var funcName:String;
        public var message:Message;
        public static const ON_PACKET:String = "onPacket";
        public static const ON_CONNECT:String = "onConnect";
        public static const ON_DISCONNECT:String = "onDisconnect";

        public function NetEvent(param1:String, funcName:String=null,param2:Message = null, param3:Boolean = false, param4:Boolean = false) : void
        {
            super(param1, param3, param4);
			this.funcName=funcName;
			this.message = param2;
            return;
        }// end function

    }
}
