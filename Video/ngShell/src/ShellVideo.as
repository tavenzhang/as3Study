/**
 * Created by Taven on 2015/11/16.
 */
package {
import com.greensock.TweenLite;
import com.junkbyte.console.Cc;

import fl.controls.BaseButton;

import fl.controls.ComboBox;
import fl.controls.listClasses.CellRenderer;
import fl.data.DataProvider;

import flash.display.DisplayObject;
import flash.display.Loader;
import flash.display.LoaderInfo;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.display.Stage;
import flash.events.Event;
import flash.events.FocusEvent;
import flash.events.IOErrorEvent;
import flash.events.MouseEvent;
import flash.events.ProgressEvent;
import flash.events.SecurityErrorEvent;
import flash.external.ExternalInterface;
import flash.net.URLLoader;
import flash.net.URLRequest;
import flash.system.Security;
import flash.text.TextField;
import flash.utils.setTimeout;

import utils.MathTools;

import utils.TavenHttpService;

import videoView.ForginVideo;
import videoView.OneRoomVideo;

import videoView.PingManager;

[SWF(width="800", height="450", backgroundColor="#333333")]
public class ShellVideo extends Sprite {
    private var  txtDesc:TextField = new TextField();
    private var domainStr:String="local";
    private var _sizePara:String="16_9";
    private var _isValid:Boolean=false;
    private var _videoMc:Sprite;
    private var _combox:ComboBox;
    private var _dataArr:Array=[];
    private static var _controlMc:Sprite ;
    private var _pingManag:PingManager = new PingManager();
    private var forginVieo:ForginVideo = new ForginVideo();
    private var oneRommVideo:OneRoomVideo = new OneRoomVideo();
    private var _readyOneRoom:Boolean=false;
    private var _lastSeltct:*;
    private var _urlHttpPre:String="";
    public function ShellVideo() {
        initLog();
        _videoMc = new Sprite();
        _videoMc.addChild(forginVieo);
        _videoMc.addChild(oneRommVideo);
        this.addChild(_videoMc);
        _controlMc = new Sprite();
        this.addChild(_controlMc);
        Security.allowDomain("*");
        txtDesc.text="线路选择:";
        txtDesc.width =480;
        txtDesc.height=270;
        txtDesc.textColor=0x00ff00;
        txtDesc.mouseEnabled=false;
       //domainStr="www.taven.data";
        _combox =new ComboBox();
        _controlMc.addChild(txtDesc);
        _controlMc.addChild(_combox);
        _combox.x = txtDesc.x +txtDesc.textWidth+10;
        _controlMc.visible=false;
        this.addEventListener(MouseEvent.ROLL_OVER,onRollHandle);
        this.addEventListener(MouseEvent.ROLL_OUT,onRollHandle);
        _combox.addEventListener(Event.OPEN, onMoveHandle);
        _combox.addEventListener(Event.CLOSE, onMoveHandle);

        //this.addEventListener(MouseEvent.ROLL_OUT,onMoveHandle);
        if (ExternalInterface.available) {
            domainStr = ExternalInterface.call('function(){return document.location.href.toString()}');
            _urlHttpPre = domainStr.substring(0,domainStr.lastIndexOf("/")+1);
            if(domainStr.indexOf("//")>-1)
            {
                domainStr = domainStr.substr(domainStr.indexOf("//")+2);
                domainStr =domainStr.substr(0,domainStr.indexOf("/"));
            }
            var param:Object = this.stage.loaderInfo.parameters;
            if (param) {
                if (param["size"] != null) {
                    _sizePara = String(param["size"]);
                }
            }
        }
        LoadConfig();
        validDomain();

        _combox.addEventListener(Event.CHANGE,onChangeComb);
        var sp:Sprite = new Sprite();
        sp.graphics.beginFill(0xFF0000,0);
        sp.graphics.drawRect(0,0,this.stage.stageWidth,this.stage.stageHeight);
        sp.graphics.endFill();
        _videoMc.addChildAt(sp,0);
    }

    private function onMoveHandle(evt:Event):void
    {
        trace("MouseEvent t="+evt.target);
        trace("MouseEvent type="+evt.type);
        if(evt.type==Event.OPEN)
        {
            this.removeEventListener(MouseEvent.ROLL_OVER,onRollHandle);
            this.removeEventListener(MouseEvent.ROLL_OUT,onRollHandle);
        }
        else
        {
            this.addEventListener(MouseEvent.ROLL_OVER,onRollHandle);
            this.addEventListener(MouseEvent.ROLL_OUT,onRollHandle);
        }
        evt.stopImmediatePropagation();
    }
    private function  onRollHandle(evt:Event):void
    {
        evt.stopPropagation();
       trace("evt.type="+evt.type);
        trace("evt.target="+evt.target);;
        if(evt.type==MouseEvent.ROLL_OVER)
        {
            if(_isValid)
            {
                changeCotrolState(true);
            }
        }
        else
        {
            if((evt.target is TextField)||(evt.target is BaseButton)||(evt.target is CellRenderer))
            {

            }
            else
            {
                changeCotrolState(false);
            }
        }
    }

    private function onChangeComb(evt:Event):void
    {
        if(_lastSeltct)
        {
            if(_lastSeltct!= _combox.selectedItem)
            {
                _lastSeltct=_combox.selectedItem;
                playVideo(_lastSeltct,true);
            }
        }
        else
        {
            _lastSeltct=_combox.selectedItem;

            playVideo(_lastSeltct,true);
        }
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
    private function validDomain():void
    {
        TavenHttpService.addHttpService("http://yiwancailottery.wbgsoft.net/ip_check.php?ip="+domainStr+"&size="+_sizePara+"&v="+Math.random()*1000,onValidResult);
    }
    public function LoadConfig():void {
        //设置变量requestt为URLLLoader数据类型并创建实例
        var request:URLRequest = new URLRequest(_urlHttpPre+"config.xml?="+Math.random()*1000);
        Cc.log("LoadConfig --url="+request.url);
        //实例loader用方法load读取变量URLRequest实例,(读取路径)
        var loader:URLLoader = new URLLoader();
        loader.load(request);
        //实例loader注册侦听(事件为Event.COMPLETE,调用onComplete函数处理)
        loader.addEventListener(Event.COMPLETE, onComplete);
        loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, loader_Error);
        loader.addEventListener(IOErrorEvent.IO_ERROR, loader_Error);
    }

    private function loader_Error(evt:Event):void
    {
        Cc.log("load Error ="+evt.type+"---evt="+evt.toString())
    }

    public function onComplete(event:Event):void {
        //xml数据类型变量myxml创建实例,读取xml的数据
        var loader:URLLoader = event.currentTarget as URLLoader;
        var myxml:XML = new XML(loader.data);
        //输出myxml的数据
        Cc.log("myxml.config=="+myxml.config);
        try
        {
            var url:String =  MathTools.decodeAseString(TavenHttpService.AES_KEY, myxml.config, TavenHttpService.AES_IV);
            TavenHttpService.addHttpService(url,onRtmpListResult);
            Cc.log("tafficUrl=="+url);
        }
        catch(e:*)
        {
            Cc.log("tafficUrl ---error="+e.toString());
        }
    }

    private function playVideo(data:Object,isValid):void
    {
        if(data.label!="国外线路")
        {
            forginVieo.closetVieo();
            oneRommVideo.playVideo(data.data);
        }
        else
        {
            oneRommVideo.closetVieo();
            forginVieo.playVideo(data.data,true);
        }
    }


    private function onValidResult(dataStr:*):void
    {
        Cc.log("验证结果=="+dataStr);
     //   txtDesc.text=dataStr;
        var dataResult:Object;
        try {
            dataResult = JSON.parse(dataStr);
        } catch (e:Error) {

        }

        if(dataResult&&dataResult.code==1) //在白名单
        {
            _dataArr.push({label:"国外线路",data:dataResult.url});
            //延迟1秒没有选择的话 自动播放
            _combox.dataProvider = new DataProvider(_dataArr);
            setTimeout(function():void{
                if(_dataArr.length>1)
                {
                    for(var i:int=0;i<_dataArr.length;i++)
                    {
                        if(_dataArr[i].label!="国外线路")
                        {
                            _combox.selectedIndex=i;
                            onChangeComb(null);
                            break;
                        }
                    }
                }
                else if(_dataArr.length==1)
                {
                    _combox.selectedIndex=0;
                    onChangeComb(null);
                }
            },1000);

            _isValid =true;
            _controlMc.visible=true;
        }
        else  //不在白名单
        {
            _isValid =false;
            _controlMc.visible=false;
            oneRommVideo.closetVieo();
            forginVieo.playVideo(dataResult.url,false);
        }
    }


    private function onRtmpListResult(data:*):void {
        var result:String          = MathTools.decodeAseString(TavenHttpService.AES_KEY, data, TavenHttpService.AES_IV);
        var ipdata:Object          = JSON.parse(result);
        var rtmpList:Array         = ipdata.ips;
        TavenHttpService.RTMP_LIST = ipdata.ips ? ipdata.ips : [];
        Cc.log("rtmp列表="+rtmpList);
            //设置直播rtml列表
        _pingManag.addCliendRtmpArr(TavenHttpService.RTMP_LIST);
       // _pingManag.startTestSped();
        if(rtmpList&&rtmpList.length>0)
        {
            for(var i:int=0;i<rtmpList.length;i++)
            {
                var item:Array;
                if(rtmpList[i].indexOf("@@">-1))
                {
                    item =rtmpList[i].split("@@");
                    _dataArr.push({label:item[1],data:item[0]});
                }
               else
                {
                    _dataArr.push({label:"线路:"+i,data:rtmpList[i]});
                }
            }
            rtmpList
            _readyOneRoom =true;
        }
}

    public static  function  changeCotrolState(visible:Boolean=false):void
    {
        if(_controlMc.visible!=visible)
        {
            _controlMc.visible = visible
            if(visible)
            {
                _controlMc.alpha=0;
                TweenLite.to(_controlMc,0.5,{alpha:1});
            }
        }
    }

}
}
