/**
 * Created by thomas on 2016/9/27.
 */
package {
import flash.display.Sprite;
import flash.media.Video;
import flash.net.NetStream;
import flash.net.URLStream;
import flash.net.NetConnection;


[SWF(width="1000", height="700", backgroundColor="#666666")]
public class flvTest extends  Sprite{
    var videoconnection:NetConnection=new NetConnection();//先创建一个NetConnection对象.

    public function flvTest() {
        var videoconnection:NetConnection=new NetConnection();//先创建一个NetConnection对象.
        videoconnection.connect(null);//connect参数一定是null,不知道为什么,没去研究.将就用着.
        var videostream:NetStream =new NetStream(videoconnection);//再建立一个NetStream对象,连接到NetConnection里面去.
        var myvideo:Video =new Video();//再建立一个Video对象.
        myvideo.attachNetStream(videostream);//Video挂接NetStream,从NetStream那里读内容.
        videostream.play("http://138.68.15.248:8081/proxypublish/68253601582909769|F4F43E9FFB4A9F5A60E7CE9B9E3CDE6C.flv");//调用NetStream的play属性开始播放.
        addChild(myvideo);//将myvideo对象放在场景里
        myvideo.x=0;//播放器的x值,就是横坐标
        myvideo.y=0;//播放器的y值,就是纵坐标
        myvideo.width=480;//播放器的宽度
        myvideo.height=360;//播放器的高度.
    }
}
}
