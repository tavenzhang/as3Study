/**
 * Created by Roger on 2014/11/24.
 */
package utils {


import com.hurlant.crypto.symmetric.AESKey;
import com.hurlant.crypto.symmetric.CBCMode;
import com.hurlant.crypto.symmetric.PKCS5;
import com.hurlant.util.Base64;
import com.hurlant.util.Hex;

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.filters.GlowFilter;
import flash.net.SharedObject;
import flash.net.URLRequest;
import flash.net.navigateToURL;
import flash.text.TextField;
import flash.utils.ByteArray;
import flash.utils.getDefinitionByName;
import flash.utils.getTimer;

public class MathTools {
    public function MathTools() {
    }

    public static function convertDateStr(dateStr:String):String {
        var strArr:Array = dateStr.split(" ");
        var fStr:String  = "{0} {1} {2}";
        return format(fStr, (strArr[0] as String).split("-").join("/"), strArr[1], "GMT");
    }

    /**以前的format文章中的方法*/
    public static function format(str:String, ...args):String {
        for (var i:int = 0; i < args.length; i++) {
            str = str.replace(new RegExp("\\{" + i + "\\}", "gm"), args[i]);
        }
        return str;
    }


    public static function buildAseString(messKey:String, _plain:String,ivStr:String="0102030405060708"):String {
        //var _aseKey:String = '1234567891111111';可以自己定义不同的
        //var plain:String = "test";
        var _aseKey:String = messKey;
        var plain:String = _plain;
        //var ivString:String = '0102030405060708'; //key
        var ivString:String =ivStr;
        var key:ByteArray = new ByteArray();
        key.writeUTFBytes(_aseKey);
        var iv:ByteArray = new ByteArray();
        iv.writeUTFBytes(ivString);
        var des:AESKey = new AESKey(key);//ase模式
        var cbc:CBCMode = new CBCMode(des, new PKCS5()); //加密模式                        ,有多种模式供你选择
        cbc.IV = iv; //设置加密的IV
        /* 得到的密文长度和明文的长度有关,规律大致是:明文<8 密文=12 ,明文<16 密文=24 ,明文>=16 密文=32......后面希望你们推一下*/
        var tmpByteArray:ByteArray = convertStringToByteArray(plain); //转换成二进制编码 (该函数自己定义)
        cbc.encrypt(tmpByteArray);
        var fin:String = com.hurlant.util.Base64.encodeByteArray(tmpByteArray);
//        trace("fin:", fin);
        return fin;
        //利用加密模式对数据进行加密
        trace("base64 =", com.hurlant.util.Base64.encodeByteArray(tmpByteArray));
        var as3Str:String = Hex.fromArray(tmpByteArray); //利用base64对密文进行编码
        trace("as3Str = " + as3Str);//输出结果 为: PXWVqYv/gJ04WpM5vlT9gg==
        //String转ByteArray函数
        function convertStringToByteArray(str:String):ByteArray {
            var bytes:ByteArray;
            if (str) {
                bytes = new ByteArray();
                bytes.writeUTFBytes(str);
            }
            return bytes;
        }
    }

    //aes解码
    public static function decodeAseString(messKey:String, _plain:String,ivStr:String):String {
        var _aseKey:String = messKey;
        var plain:String = _plain;
        //var ivString:String = '0102030405060708'; //key
        var ivString:String =ivStr;
        var key:ByteArray = new ByteArray();
        key.writeUTFBytes(_aseKey);
        var iv:ByteArray = new ByteArray();
        iv.writeUTFBytes(ivString);

        var des:AESKey = new AESKey(key);//ase模式
        var cbc:CBCMode = new CBCMode(des, new PKCS5()); //加密模式                        ,有多种模式供你选择
        cbc.IV = iv; //设置加密的IV
        var dataArr:ByteArray = com.hurlant.util.Base64.decodeToByteArray(_plain);
        cbc.decrypt(dataArr);
        dataArr.position=0;
        var resutStr:String = dataArr.readMultiByte(dataArr.bytesAvailable,"utf-8");
        return resutStr;
    }

    public static function isOverTime():int {
        return getTimer() > 60 * 5 * 1000 ? 1 : 0;
    }

    public static function getShareObject(_name:String):Object {
        var so:SharedObject = SharedObject.getLocal(_name, "/");
        if (so.data) {
            return so.data.value;
        } else {
            return null;
        }
    }

}
}
