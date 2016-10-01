package {
import fl.controls.Button;
import fl.controls.CheckBox;
import fl.controls.Label;
import fl.controls.TextArea;
import fl.controls.TextInput;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.events.NetStatusEvent;
import flash.media.Camera;
import flash.media.H264Level;
import flash.media.H264Profile;
import flash.media.H264VideoStreamSettings;
import flash.media.Video;
import flash.net.NetConnection;
import flash.net.NetStream;
import flash.net.SharedObject;
import flash.system.Security;
import flash.system.SecurityPanel;

import mx.utils.StringUtil;

[SWF(width="1000", height="700", backgroundColor="#666666")]
public class VideoCliend extends Sprite {

    private var nc:NetConnection;
    private var ns:NetStream;
    private var pnc:NetConnection;
    private var pns:NetStream;
    private var cam:Camera;
    //-] 最终播放线路 rtmp=rtmp://117.27.250.83:9945/proxypublish----sid=11593528840855522|BB68E968525FDE8112C317ADF848666D
    //private var _server:String="rtmp://50.117.12.21:9940/proxypublish";
    //private var _server:String="rtmp://10.1.10.32:1935/proxypublish";
    private var _server:String = "rtmp://192.16.137.2:1935/proxypublish";
    //private var _server:String="rtmp://114.67.59.158:9940/proxypublish";
    //private var _server:String="rtmp://10.1.10.111/live";
    //private var _fileName:String ="64473524498461746|66E83E23CD5945CAB2D04229C5D809BF";
    private var _fileName:String = "taven";
    //rtmp://218.60.32.34:9945/proxypublish/37903578187791614|45288FB48CCE07F53F2379BBB4E55CD8"
    //[-] 最终播放线路 rtmp=rtmp://183.131.212.34:34150/proxypublish----sid=11113599958472692|3A0E75566D29B54BE68F70C111D12AFB
    private var labeServer:Label = new Label();
    private var textInput:TextInput = new TextInput();
    private var sidInput:TextInput = new TextInput();
    private var upbtn:Button = new Button();
    private var downServer:Label = new Label();
    private var downInput:TextInput = new TextInput();
    private var downsidInput:TextInput = new TextInput();
    private var downupbtn:Button = new Button();
    private var sidText:Label = new Label();
    private var serverTextArea:TextArea = new TextArea();
    private var serverTextArea2:TextArea = new TextArea();
    private var txtFunName:TextInput = new TextInput();
    private var btnPlay:Button = new Button();
    private var _checkValid:CheckBox = new CheckBox();
    private var  _isValidPush:Boolean = false;
    private var  _isValidPlay:Boolean = false;

    public function VideoCliend() {
        serverTextArea2.width = serverTextArea.width = 470;
        serverTextArea2.height = serverTextArea.height = 180;
        serverTextArea2.y = serverTextArea.y = 480;
        serverTextArea2.x = 485;
        this.addChild(serverTextArea);
        this.addChild(serverTextArea2);
//        var str:String = "thasn{/21}_12e2e_{/21}-dw{/02}==2w";
//        //var myPattern:RegExp =/2/g;
//        str = str.replace(/\{\/..\}/g, "");
        labeServer.text = "上传地址";
        downServer.text = "下播地址"
        downServer.y = 35;

        var myLocalData:SharedObject = SharedObject.getLocal("video");
        if(myLocalData.data&&myLocalData.data.server!=null)
        {
            _server  = myLocalData.data.server;
        }
        if(myLocalData.data&&myLocalData.data.sid!=null)
        {
            _fileName  = myLocalData.data.sid;
        }
        textInput.text = _server;
        downInput.text = _server;
        downInput.y = 35;
        downInput.width = textInput.width = 200;
        downInput.x = textInput.x = labeServer.x + labeServer.width + 2;
        downsidInput.y = 35;
        downsidInput.x = sidInput.x = 400;
        downsidInput.width = sidInput.width = 250;
        downsidInput.text = sidInput.text = _fileName;
        sidText.text = "sid:"
        upbtn.label = "上传视频";
        downupbtn.label = "下播视频"
        downupbtn.x = upbtn.x = sidInput.x + sidInput.width + 5;
        downupbtn.y = 35;
        upbtn.addEventListener(MouseEvent.CLICK, onClickHandle);
        downupbtn.addEventListener(MouseEvent.CLICK, onClickHandle);
        sidText.x = downInput.x + downInput.width + 30;
        txtFunName.text = "netping";
        btnPlay.label = "调用服务器函数";
        this.addChild(labeServer);
        this.addChild(textInput);
        this.addChild(upbtn);
        this.addChild(sidText);
        this.addChild(sidInput);
        this.addChild(downServer);
        this.addChild(downInput);
        this.addChild(downsidInput);
        this.addChild(downupbtn);
        this.addChild(txtFunName);
        this.addChild(btnPlay);
        _checkValid.label="开启二次验证";
        this.addChild(_checkValid);
        txtFunName.visible = false;
        btnPlay.visible = false;
        _checkValid.y = 35;
        _checkValid.x =850;
        // txtFunName.addEventListener(MouseEvent.CLICK, onPauseEvent);
        btnPlay.addEventListener(MouseEvent.CLICK, onPauseEvent);
        txtFunName.x = upbtn.x + upbtn.width + 5;
        btnPlay.x = txtFunName.x + txtFunName.width + 5;
        this.cam = Camera.getCamera();
        if (this.cam) {
            this.cam.setKeyFrameInterval(24);
            this.cam.setMode(480, 360, 24, false);
            this.cam.setQuality(0, 90);
            this.cam.setLoopback(false);
        }
    }

    private function onPauseEvent(evt:Event):void {
        callNetPing(txtFunName.text);
    }

    private function onClickHandle(evt:MouseEvent):void {
        if (evt.currentTarget == upbtn) {
            startPublishConnet();
        }
        else {
            startConnet();
        }
    }

    private function startPublishConnet():void {
        if (!pnc) {
            pnc = new NetConnection();
            pnc.addEventListener(NetStatusEvent.NET_STATUS, onConnetPublishServerhandle);
            pnc.client = this;
            _server = StringUtil.trim(textInput.text);
            pnc.connect(_server);
        } else {
            pnc.close();
            pnc.connect(_server);
        }
        serverTextArea.text += "开始连接....\n";
    }

    private function startConnet():void {
        if (!nc) {
            nc = new NetConnection();
            nc.addEventListener(NetStatusEvent.NET_STATUS, onConnetServerhandle);
            nc.client = this;
            _server = StringUtil.trim(downInput.text);
            nc.connect(_server);
        }
        else {
            nc.close();
            nc.connect(_server);
        }
        serverTextArea2.text += "开始连接....\n";
    }
    private function onConnetServerhandle(evt:NetStatusEvent):void {
        serverTextArea2.text += "sid = " + downsidInput.text + "---- player evt.info.code=" + evt.info.code;
        if (evt.info.code == "NetConnection.Connect.Success") {
            if(_checkValid.selected)
            {
                _isValidPlay = true;
                serverTextArea2.text = "start valid";
                callNetPing("netping");
            }
            else
            {
                playRtmpVideo();
            }
        }
    }
    //push connection
    private function onConnetPublishServerhandle(evt:NetStatusEvent):void {
        serverTextArea.text += "sid = " + sidInput.text + " -------onStreamPublish evt.info.code=" + evt.info.code +"\n"
        trace("publish evt.info.code=" + evt.info.code);
        if (evt.info.code == "NetConnection.Connect.Success") {
            if(_checkValid.selected)
            {
                _isValidPush = true;
                callNetPing("netping");
            }
            else
            {
                startPublishVideo();
            }
        }
    }
    //开始上传视频流
    private function startPublishVideo():void
    {
        pns = new NetStream(pnc);
        pns.addEventListener(NetStatusEvent.NET_STATUS, onStreamPublish);
        pns.client = this;
        pns.attachCamera(cam);
        var h264:H264VideoStreamSettings = new H264VideoStreamSettings();
        h264.setProfileLevel(H264Profile.MAIN, H264Level.LEVEL_3_1);
        this.pns.videoStreamSettings = h264;
        var video:Video = new Video();
        video.width = 480;
        video.height = 360;
        video.y = 60;
        video.attachCamera(cam);
        this.addChild(video);
        _fileName = StringUtil.trim(sidInput.text);
        pns.publish(_fileName);
        var myLocalData:SharedObject = SharedObject.getLocal("video");
        myLocalData.data.server = _server;
        myLocalData.data.sid = _fileName;
        myLocalData.flush();
    }


    private function playRtmpVideo() {

        ns = new NetStream(nc);
        ns.addEventListener(NetStatusEvent.NET_STATUS, onStreamHandle);
        ns.client = this;
        _fileName = StringUtil.trim(downsidInput.text);
        ns.bufferTime = 3;
        ns.bufferTimeMax = 10;
        ns.play(_fileName);
        var video:Video = new Video();
        video.width = 480;
        video.height = 360;
        video.x = 500;
        video.y = 60;
        video.attachNetStream(ns)
        this.addChild(video);
    }

    private function onPushVieo(evt:Event):void {

    }

    public function onBWDone(data:* = null):void {

    }

    private function onStreamPublish(evt:NetStatusEvent):void {
        serverTextArea.text += "onStreamPublish evt.info.code=" + evt.info.code
    }

    private function onStreamHandle(evt:NetStatusEvent):void {
        serverTextArea2.text += "onStreamHandle  evt.info.code=" + evt.info.code;
    }

    public function onMetaData(infoObject:Object):void {
        trace("metadata");
    }

    public function onPlayStatus(infoObject:Object):void {
        trace("onPlayStatus =" + infoObject);
        //ns.play("taven");
    }

    public function metaDataHandler(infoObject:Object):void {
        trace("metaDataHandler");
    }

    public function cuePointHandler(infoObject:Object):void {
        trace("cue point");
    }

    private function callNetPing(funNamme:String = "netping"):void {
        if(_isValidPush)
        {
            if (this.pnc && this.pnc.connected) {
                serverTextArea.text += "\n第一次验证: " + funNamme + "\n";
                this.pnc.call(funNamme, null,111112);
            }
            else {
                serverTextArea.text += "请先正常连接服务器\n";
            }
        }
        if(_isValidPlay)
        {
            if (this.nc && this.nc.connected) {
                serverTextArea2.text += "\n调用服务器函数: " + funNamme + "\n";
                this.nc.call(funNamme, null, 22222);
            }
            else {
                serverTextArea2.text += "请先正常连接服务器";
            }
        }
    }

    public function netping(...args):void {
        if(_isValidPush)
        {
            trace("_isValidPush----服务器函数返回参数个数: " + args.length + "args-----" +args+"\n");
            if (args.length = 3) {
                if (args[2] > 1) {
                    trace("pre-------------args[2]=="+args[2]);
                    var key:Number = encrypt(args[2]);
                    trace("end-------------args[2]=="+key)
                    this.pnc.call("netping", null, key);
                    serverTextArea.text += "开始二次验证\n";
                }
                else if (args[2] == 1) {
                   startPublishVideo();
                    serverTextArea.text += "二次验证ok\n";
                    _isValidPush = false;
                }
                else {
                    serverTextArea.text += "二次验证失败\n";
                    _isValidPush = false;
                }
            }
        }
        if(_isValidPlay)
        {
           trace("_isValidPlay----服务器函数返回参数个数: " + args.length + "args-----" +args+"\n");
            if (args.length = 3) {
                if (args[2] > 1) {
                    trace(" en pre====" + (args[2]));
                    var key:Number = encrypt(args[2]);
                    trace(" encrypted ====" + (key));
                    this.nc.call("netping", null, key);
                    serverTextArea2.text += "开始二次验证\n";
                }
                else if (args[2] == 1) {
                    playRtmpVideo();
                    _isValidPlay = false
                    serverTextArea2.text += "二次验证ok\n"
                }
                else {
                    serverTextArea2.text += "二次验证失败\n";
                }
            }
        }


    }

    private static var KEY:int = 413256489;

    public static function encrypt(plainText:int):int {
        return plainText ^ KEY;
    }

    public static function decrypt(cipherText:int):int {
        return cipherText ^ KEY;
    }
}
}