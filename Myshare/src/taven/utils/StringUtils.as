package taven.utils
{
    import flash.geom.Point;
    import flash.utils.ByteArray;

    /**
     * 游戏中常用的字符串相关的操作的工具类
     * @author Taven
     */	
    public class StringUtils
    {
        public static const EMPTY:String = "";

        public static function trimRight(str:String):String
        {
            return str.replace(/\s+$/, "");
        }

        public static function trimLeft(str:String):String
        {
            return str.replace(/^\s+/, "");
        }

        public static function trim(str:String):String
        {
            return trimLeft(trimRight(str));
        }

        public static function pad(str:String, token:String, aimLength:int, isAddToTail:Boolean = true):String
        {
            var result:String = str;
            while(result.length < aimLength)
            {
                if(isAddToTail)
                {
                    result = result + token;
                }
                else
                {
                    result = token + result;
                }
            }
            return result;
        }

        public static function splice(sourceStr:String, startIndex:int, deleteCount:int, insertStr:String):String
        {
            if((startIndex < 0) ||(startIndex > sourceStr.length))
            {
                return EMPTY;
            }
            if((deleteCount < 0) || (deleteCount > (sourceStr.length - startIndex)))
            {
                return EMPTY;
            }
            var leftStr:String = sourceStr.slice(0, startIndex);
            var rightStr:String = sourceStr.slice(startIndex + deleteCount);
            return leftStr + insertStr + rightStr;
        }

        /**
         * 效验是否全为数字
         * @param source
         * @return
         */
        public static function veryfyNumber(source:String):Boolean
        {
            var numberRegExp:RegExp = /^[0-9]*$/;
            return numberRegExp.test(source);
        }

        /**
         * 效验邮箱地址是否有效
         * @param emailAdress
         * @return
         */
        public static function verifyEmailAddress(source:String):Boolean
        {
            var emailRegExp:RegExp = /\b[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i;
            return emailRegExp.test(source);
        }

        /**
         * 替换字符串中的"{$variable}"成sourceObj里面的内容
         * @param str
         * @param sourceObj
         * @param escapeVars
         * @return
         */
        public static function replaceVariables(str:String, sourceObj:Object, escapeVars:Boolean = false):String
        {
            var resultStr:String = str;
            for(var i:String in sourceObj)
            {
                var patternStr:String = "\\{\\$" + i + "\\}";
                var pattern:RegExp = new RegExp(patternStr, "g");
                resultStr = resultStr.replace(pattern, String(sourceObj[i]));
            }
            if(escapeVars)
            {
                return escape(resultStr);
            }
            return resultStr;
			
        }

        public static function replace(input:String, replace:String, replaceWith:String):String
        {
            var sb:String = new String();
            var found:Boolean = false;

            var sLen:Number = input.length;
            var rLen:Number = replace.length;

            for (var i:Number = 0; i < sLen; i++)
            {
                if (input.charAt(i) == replace.charAt(0))
                {
                    found = true;
                    for (var j:Number = 0; j < rLen; j++)
                    {
                        if (!(input.charAt(i + j) == replace.charAt(j)))
                        {
                            found = false;
                            break;
                        }
                    }

                    if (found)
                    {
                        sb += replaceWith;
                        i = i + (rLen - 1);
                        continue;
                    }
                }
                sb += input.charAt(i);
            }
            return sb;
        }

        public static function endsWith(source:String, endStr:String):Boolean
        {
            var lastIndex:int = source.lastIndexOf(endStr);
            if((lastIndex + endStr.length) == source.length)
            {
                return true;
            } 
            return false;
        }

        public static function startsWith(source:String, startStr:String):Boolean
        {
            var firstIndex:int = source.indexOf(startStr);
            if(firstIndex == 0)
            {
                return true;
            }
            return false;
        }

        public static function parsePositionStr(posStr:String):Point
        {
            if(trim(posStr) == EMPTY)
            {
                return new Point(0, 0);
            }
            var posArr:Array = posStr.split(","); 
            return new Point(int(posArr[0]), int(posArr[1]));
        }

        public static function isDigital(str:String):Boolean
        {
            var pattern:RegExp = /\D/g;
            return !pattern.test(str);
        }

        /**
         * 关键字回调替换
         * @param desc
         * @param handler
         * @param startKey
         * @param endKey
         * @param splitKey
         * @return
         */
        public static function keyReplace(desc:String, handler:Function, startKey:String = "[", endKey:String = "]", splitKey:String = ","):String
        {
            var result:String = "";
            var len:int = desc.length;
            for (var i:int = 0; i < len; i++)
            {
                var charKey:String = desc.charAt(i);
                if (charKey == startKey)
                {
                    var keyGroup:String = "";
                    for (var j:int = i + 1; j < len; j++)
                    {
                        var char:String = desc.charAt(j);
                        if (char != endKey)
                        {
                            keyGroup += char;
                        }
                        else
                        {
                            keyGroup = replace(keyGroup, " ", "");
                            result += handler(keyGroup.split(splitKey));
                            break;
                        }
                    }
                    i = j;
                }
                else
                {
                    result += charKey;
                }
            }
            return result;
        }

        /**
         * 在不够指定长度的字符串前补零
         * @param str 需要在前面补零的字符串
         * @param len 总长度
         * @return
         *
         */
        public static function renewZero(str:String, len:int):String
        {
            var bul:String = "";
            var strLen:int = str.length;
            if (strLen < len)
            {
                for (var i:int = 0; i < len - strLen; i++)
                {
                    bul += "0";
                }
                return bul + str;
            }
            else
            {
                return str;
            }
        }

        /**
         * 日期格式
         * @param value 时间
         * @param sm    格式间隔符
         * @return
         *
         */
        public static function timeFormat(value:int, sm:String = "-"):String
        {
            var t:Date = new Date(value * 1000);
            return t.getFullYear().toString() + sm + (t.getMonth() + 1).toString() + sm + t.getDate().toString();
        }

        /**
         * 对比两个字符串
         * @param s1
         * @param s2
         * @param caseSensitive 是否区分大小写
         * @return
         *
         */		
        public static function stringsAreEqual(s1:String, s2:String, caseSensitive:Boolean):Boolean
        {
            if (caseSensitive)
            {
                return (s1 == s2);
            }
            else
            {
                return (s1.toUpperCase() == s2.toUpperCase());
            }
        }

        /**
         * 将字符串转化为字节数组
         * @param s
         * @param length
         * @return
         *
         */		
        public static function toByteArray(s:String,length:uint):ByteArray
        {
            var _byte:ByteArray = new ByteArray();
            _byte.writeUTFBytes(s);
            _byte.length = length;
            _byte.position = 0;
            return _byte;
        }

        /**
         * 取得字符串长度，汉字按两个长度
         * @param	text
         */
        public static function getUTF8Len(text:String):int
        {
            var len:int = 0;
            for(var i:int; i < text.length; i++)
            {
                var c:Number = text.charCodeAt(i);
                if(c < 0x7F)
                {
                    len ++;
                }
                else if(c >= 0x80 && c < 0x7FF)
                {
                    len += 2;
                }
                else if((c >= 0x800 && c < 0xD7FF) || (c >= 0xE000 && c < 0xFFFF))
                {
                    len += 2;
                }
                else if(c >= 0x10000 && c < 0x10FFFF)
                {
                    len += 2;
                }
            }

            return len;
        }

        /**
         * 获取字符串限制后的长度
         * @param	text
         * @param	len
         * @return
         */
        public static function getToLen(text:String, len:int):int
        {
            var result_len:int = 0;
            var chars_len:int = 0;
            for(var i:int; i < text.length; i++)
            {
                var c:int = text.charCodeAt(i);

                if (c < 0x7F)
                {
                    chars_len += 1;
                }
                else if(c >= 0x80 && c < 0x7FF)
                {
                    chars_len += 2;
                }
                else if((c >= 0x800 && c < 0xD7FF) || (c >= 0xE000 && c < 0xFFFF))
                {
                    chars_len += 2;
                }
                else if(c >= 0x10000 && c < 0x10FFFF)
                {
                    chars_len += 2;
                }

                if (chars_len <= len)
                {
                    result_len ++;
                }
                else
                {
                    break;
                }
            }
            return result_len;
        }

		/**
		 * 编码成UTF8
		 * @param text
		 * @return 
		 */
        public static function encodeUTF8(text:String):String
        {
            var result:String = "";
            for (var n:int = 0; n < text.length; n++)
            {
                var c:int = text.charCodeAt(n);
                if (c < 128)
                {
                    result += String.fromCharCode(c);
                }
                else if (c > 127 && c < 2048)
                {
                    result += String.fromCharCode((c >> 6) | 192);
                    result += String.fromCharCode((c & 63) | 128);
                }
                else
                {
                    result += String.fromCharCode((c >> 12) | 224);
                    result += String.fromCharCode(((c >> 6) & 63) | 128);
                    result += String.fromCharCode((c & 63) | 128);
                }
            }

            return result;
        }

		/**
		 * 将UTF8解码
		 * @param text
		 * @return 
		 */
        public static function decodeUTF8(text:String):String
        {
            var result:String = "";
            var i:int = 0;
            var c1:int = 0;
            var c2:int = 0;
            var c3:int = 0;

            while (i < text.length)
            {
                c1 = text.charCodeAt(i);
                if (c1 < 128)
                {
                    result += String.fromCharCode(c1);
                    i++;
                }
                else if (c1 > 191 && c1 < 224)
                {
                    c2 = text.charCodeAt(i + 1);
                    result += String.fromCharCode(((c1 & 31) << 6) | (c2 & 63));
                    i += 2;
                }
                else
                {
                    c2 = text.charCodeAt(i + 1);
                    c3 = text.charCodeAt(i + 2);
                    result += String.fromCharCode(((c1 & 15) << 12) | ((c2 & 63) << 6) | (c3 & 63));
                    i += 3;
                }
            }

            return result;
        }

        /**
         * 返回账号检测状态
         * 0不合法，1米米号，2自定义账号（包括邮箱，自定义字符，手机号）
         * @param s 玩家账号
         * @return
         */		
        public static function getAccountState(s:String):uint
        {
            var mimiExp:RegExp = /^[0-9]{5,10}$/;
            var emailExp:RegExp = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
            var accountExp:RegExp=/^[a-zA-Z0-9_]{6,20}$/;
            var telExp:RegExp =/^[0-9]{11}$/;
            //10位以内米米号
            if (mimiExp.test(s) == true)
            {
                return 1;
            }
            //邮箱，合法账号，11位手机号
            if (emailExp.test(s) == true || accountExp.test(s) == true || telExp.test(s) == true)
            {
                return 2;
            }
            return 0;
        }
		
		/** * 获取url中的文件名 */
		public static function getFileName(url:String):String
		{
			var sindex:int = url.indexOf("?");
			if (sindex == -1)
			{
				sindex = int.MAX_VALUE;
			}
			var index1:int = url.lastIndexOf(".", sindex);
			var indeZS:int = url.lastIndexOf("/") + 1;
			return url.substring(indeZS, index1);
		}
		
		/**字符格式替换『0』，『1』*/
		public static function strStitute(srcSrt:String,...rest):String
		{
			var resultStr:String =srcSrt;
			for(var i:int=0;i<rest.length;i++)
			{
				var patternStr:String = "\\{" + i + "\\}";
				var pattern:RegExp = new RegExp(patternStr, "g");
				resultStr = resultStr.replace(pattern, String(rest[i]));
			}
	
			return resultStr;
		}
		
		
    }
}

