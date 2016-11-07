/**
 * Created by ws on 2015/7/8.
 */
package com.net.core {
import com.netease.protobuf.Message;

import flash.utils.Dictionary;
import msginfo.*;

public class MessageManager {

        private static var msgMagagers:Dictionary = new Dictionary();

        public static const Msg_CMsgHead:int =1;
        public static const Msg_CMsgLogin:int=2;
        public static const Msg_CMsgLogout:int=3;
        public static const Msg_CMsgReg:int=4;
        public static const Msg_Person:int=5;

        static public function registMsg():void
        {
                msgMagagers[5001]= am_res_login
        }

        //根据消息id 获取消息体
        static public function getMsg(msgId:uint):Message
        {
                if(msgMagagers[msgId])
                {
                        return new msgMagagers[msgId] ;
                }
                else
                {
                        return null;
                }

        }
}
}
