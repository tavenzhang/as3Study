/**
 * Created by Taven on 2015/11/26.
 */
package videoView {
import com.adobe.utils.StringUtil;
import com.junkbyte.console.Cc;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.NetStatusEvent;
import flash.media.Video;
import flash.net.NetConnection;
import flash.net.NetStream;

public class OneRoomVideo extends Sprite {
    private var nc:NetConnection;
    private var rtmpUrl:String;
    private var _fileName:String = "57463531804573776|C92DC0DB6F5AFA5BE9086554BF2F8817";
    private var _server:String = "rtmp://10.1.100.111:1935/proxypublish"
    private var ns:NetStream;
    private var video:Video;

    public function OneRoomVideo() {

    }

    public function playVideo(servr:String):void {
        _server=servr;
        if(nc)
        {
            closetVieo();
        }
        Cc.log("playe servr=="+servr +"-------------sid="+_fileName);
        nc = new NetConnection();
        nc.addEventListener(NetStatusEvent.NET_STATUS, onConnetServerhandle);
        nc.client = this;
        _server = StringUtil.trim(_server);
        nc.connect(_server);
    }

    private function onConnetServerhandle(evt:NetStatusEvent):void {
        if (evt.info.code == "NetConnection.Connect.Success") {
            ns = new NetStream(nc);
            ns.addEventListener(NetStatusEvent.NET_STATUS, onStreamHandle);
            ns.client = this;
            _fileName = StringUtil.trim(_fileName);
            ns.play(_fileName);
            if( !video)
            {
                video =new Video();
            }
            video.width = this.stage.stageWidth;
            video.height = this.stage.stageHeight;
            video.attachNetStream(ns)
            this.addChild(video);
        }
    }

    private function onStreamHandle(e:NetStatusEvent):void {
      //  serverTextArea2.text += "onStreamHandle  evt.info.code=" + evt.info.code;
        switch (e.info.code) {
            case "NetStream.Play.Start":
                break;
            case "NetStream.Buffer.Full":
                ShellVideo.changeCotrolState(false);
                break;
            case "NetStream.Video.DimensionChange"://∑¿÷π≤•∑≈ºŸÀ¿
                if (this.ns) {
                    this.ns.resume();
                }
                break;
            case "NetStream.Play.Stop":
            case "NetStream.Play.UnpublishNotify":
                ShellVideo.changeCotrolState(true);
                break;
        }
    }

    public function closetVieo():void
    {
        if(ns)
        {
            ns.close();
            ns.removeEventListener(NetStatusEvent.NET_STATUS, onStreamHandle);
            ns=null;
        }
        if(nc)
        {
            nc.close();
            nc.removeEventListener(NetStatusEvent.NET_STATUS, onConnetServerhandle);
            nc =null;
        }
    }

    private function onPushVieo(evt:Event):void {

    }

    public function onBWDone(data:* = null):void {

    }
}
}
