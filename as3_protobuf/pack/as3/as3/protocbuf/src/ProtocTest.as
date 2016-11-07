package {

import com.junkbyte.console.Cc;
import com.net.core.MessageManager;
import com.net.core.Msg;
import com.net.core.NetEngine;
import com.netease.protobuf.Message;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.TextField;

import msginfo.am_req_login;

public class ProtocTest extends Sprite {
    private var netEngine:NetEngine;
    private static  const PORT:uint = 20002;
    private static  const SERVERIP:String = "123.59.70.8";

    public function ProtocTest() {
        netEngine = new NetEngine();
        initLog();
        MessageManager.registMsg();
        netEngine.addCallback("1",messageHandle);
        netEngine.addCallback("2",messageHandle);
        netEngine.addCallback("3",messageHandle);
        netEngine.addCallback("4",messageHandle);
        netEngine.addCallback("5001",messageHandle);
        netEngine.connect(SERVERIP,PORT);
        var textField:TextField = new TextField();
        textField.text = "发送数据！";
        textField.backgroundColor=0xffff00;
        addChild(textField);
        textField.addEventListener(MouseEvent.CLICK, onSendData);
      //  trace("person.id==" +person.toString());

    }


    private function initLog():void
    {
        Cc.startOnStage(this.stage, "5193062"); // "`" - change for password. This will start hidden
        Cc.visible = false; // Show console, because having password hides console.
        Cc.config.commandLineAllowed = true; // enable advanced (but security risk) features.
        Cc.config.tracing = true; // Also trace on flash's normal trace
        Cc.config.remotingPassword = ""; // Just so that remote don't ask for password
        Cc.remoting = true; // Start sending logs to remote (using LocalConnection)
        Cc.commandLine = true; // Show command line
        Cc.height = 220; // change height. You can set x y width height to position/size the main panel
    }

    private function onSendData(evt:Event):void
    {
        var logInfo:am_req_login = new am_req_login();
        logInfo.userId=999999;
        logInfo.client=1;
        logInfo.platform=37;
//        var msg:Person = new Person();
//        msg.id =110;
//        msg.name="hell as3 socket!";
        netEngine.send(logInfo,5001);

    }

    private function messageHandle(message:Message=null):void
    {
      //  trace("receive -----c++ data===" + message);
        if(message)
        {
            trace("message="+message.toString());
        }
    }
}
}
