/**
 * Created by Taven on 2015/11/27.
 */
package videoView {
import flash.display.DisplayObject;
import flash.display.Loader;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.ProgressEvent;
import flash.net.URLRequest;

public class ForginVideo extends Sprite {

    private var _isValid:Boolean = false

    public function ForginVideo() {
    }

    public function playVideo($swf:String,isValid):void
    {
        _isValid=isValid;
        var ldr:Loader = new Loader();
        var mRequest:URLRequest = new URLRequest($swf);
        ldr.contentLoaderInfo.addEventListener(Event.COMPLETE, onCompleteHandler);
        ldr.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, onProgressHandler);
        ldr.load(mRequest);
    }

    private function onCompleteHandler($e:Event):void {
        trace("$e.currentTarget.content==" + $e.currentTarget.content);
        var mc:DisplayObject = $e.currentTarget.content as DisplayObject;
        ShellVideo.changeCotrolState();
        if (_isValid) {
            addChild(mc);
        }
        else {
            addChild(mc);
            mc.x = (this.stage.stageWidth - mc.width) / 2;
            mc.x = (this.stage.stageHeight - mc.height) / 2;
        }
    }

    private function onProgressHandler($e:ProgressEvent):void {
        var percent:Number = $e.bytesLoaded / $e.bytesTotal;
        //    txtDesc.text="视频正在加载中 %"+int(percent*100);
//        if(percent>=1)
//        {
//            txtDesc.text="";
//        }
    }

    public function closetVieo():void
    {
        this.stopAllMovieClips();
        this.removeChildren();
    }

}
}
