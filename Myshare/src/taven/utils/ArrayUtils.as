package taven.utils
{
    import flash.geom.Point;
    import flash.utils.ByteArray;
    import flash.utils.Dictionary;
    import flash.utils.Endian;

    /**
     * 数组工具类
     * @author Taven
     */
    public class ArrayUtils
    {
        /**
         * 深度拷贝
         * @param source
         * @return
         */
        public static function clone(source:Object):*
        {
            var byteArray:ByteArray = new ByteArray();
            byteArray.writeObject(source);
            byteArray.position = 0;
            return (byteArray.readObject());
        }

        /**
         * 创建低字节数组
         * @return
         */
        public static function createByteArray():ByteArray
        {
            var byteArray:ByteArray = new ByteArray();
            byteArray.endian = Endian.LITTLE_ENDIAN;
            return byteArray;
        }

        /**
         * 清理数组
         * @param array
         */
        public static function deleteArray(array:Array):void
        {
            for (var key:* in array)
            {
                array[key] = null;
                delete array[key];
            }
        }

        /**
         * 数组随机排序
         * @param array
         * @return
         */
        public static function randomArray(array:Array):Array
        {
            var result:Array = array.slice();
            var i:int = result.length;
            while (i)
            {
                result.push(result.splice(int(Math.random() * i--), 1)[0]);
            }
            return result;
        }

        /**
         * 过滤掉相同元素，并生成新的数组
         * @param array
         * @return
         */
        public static function filterArray(array:Array):Array
        {
            var result:Array = [];
            for each (var content:* in array)
            {
                if (result.indexOf(content) == -1)
                {
                    result.push(content);
                }
            }
            return result;
        }

        /**
         * 将数组成员全转成整型
         * @param array
         */
        public static function convertToInt(array:Array):Array
        {
            var len:int = array.length;
            for (var i:int = 0; i < len; i++)
            {
                array[i] = int(array[i]);
            }
            return array;
        }

        /**
         * 求数组中所有的数值部分之和
         * @param array
         * @return
         */
        public static function sum(array:Array):Number
        {
            var sum:Number = 0;
            var len:int = array.length;
            for (var i:int = 0; i < len; i++)
            {
                if (array[i] is int || array[i] is Number)
                {
                    sum += array[i];
                }
            }
            return sum;
        }

        /**
         * 控制数组长度, 超过从最前面移除
         * @param array
         * @param len
         */
        public static function keepLength(array:Array, len:int):void
        {
            while (array.length > len)
            {
                array.shift();
            }
        }

        /**
         * 比较两个数组内容是否相等
         * @param arr1
         * @param arr2
         * @return
         */
        public static function arraysAreEqual(arr1:Array, arr2:Array):Boolean
        {
            if (arr1 == null && arr2 != null)
            {
                return false;
            }

            if (arr2 == null && arr1 != null)
            {
                return false;
            }

            if (arr1 == null && arr2 == null)
            {
                return true;
            }

            if (arr1.length != arr2.length)
            {
                return false;
            }

            var isd:Boolean = arr1.every(function(item:Object, index:int, array:Array):Boolean
            {
                if (arr2.indexOf(item) == -1)
                {
                    return false;
                }
                return true;
            });
            if (!isd)
            {
                return false;
            }
            isd = arr2.every(function(item:Object, index:int, array:Array):Boolean
            {
                if (arr1.indexOf(item) == -1)
                {
                    return false;
                }
                return true;
            });
            return isd;
        }

        /**
         * 判断arr1是否都包含有arr2的内容。数学上的解析为：集合arr2是否属于集合arr1
         * @return
         */
        public static function embody(arr1:Array, arr2:Array):Boolean
        {
            var isd:Boolean = arr2.every(function(item:Object, index:int, array:Array):Boolean
            {
                if (arr1.indexOf(item) == -1)
                {
                    return false;
                }
                return true;
            });
            return isd;
        }
        
        public static function createEmptyArray(length:uint):Array
        {
            var rs:Array = [] ;
            for(var i:uint =0 ;i<length;i++)
            {
                rs.push(i) ;
            }
            return rs ;
        }

        public static function randomCountArray(source:Array, count:uint):Array
        {
            var rs:Array = [] ;
            source = source.slice() ;
            //
            var len:uint = source.length;
            count = len < count ? len : count;
            //
            while(rs.length < count)
            {
                var index:uint = MathUtils.random(0,source.length-1) ; 
                rs.push(source.splice(index,1)[0]) ;
            }
            return rs ;
        }

        /**
         * 获取 Dictionary 里的Keys
         * @param dict
         * @return
         */
        public static function getKeys(dict:Dictionary):Array
        {
            var list:Array = new Array();
            for (var key:Object in dict)
            {
                list.push(key);
            }
            return list;
        }

        /**
         * 获取 Dictionary 里的 Values
         * @param dict
         * @return
         */
        public static function getValues(dict:Dictionary):Array
        {
            var list:Array = new Array();
            for each (var value:Object in dict)
            {
                list.push(value);
            }
            return list;
        }
        
        private static var AROUND:Array = [
            {x: -1, y: -1}, {x: -1, y: 0}, {x: -1, y: +1}, 
            {x: 0, y: -1}, {x: 0, y: +1}, {x: +1, y: -1}, 
            {x: 1, y: 0}, {x: +1, y: +1}];
        
        
        /**
         * 获取中心点的周围的点集合
         *
         * @param	source  二维数组
         * @param	center  中心点
         * @param	maxRow  横向边界
         * @param	maxCol  竖向边界
         * @return
         * 
         * @author fraser
         *	----> x
         *  |
         * 	|
         * 	y
         *
         *  [ (i-1,j-1)   (i-1,j)  (i-1,j+1)]
         * 	[ (i,j-1)     (i,j)    (i,j+1)  ]
         *  [ (i+1,j-1)   (i+1,j)  (i+1,j+1)]
         */
        public static function getAroundElement(source:Array, center:Point, maxRow:uint, maxCol:uint):Array
        {
            var result:Array = new Array();
            var len:uint = AROUND.length;
            var info:Object;
            for (var i:uint = 0; i < len; i++)
            {
                info = AROUND[i];
                var rowIndex:uint = center.y + info["x"];
                var colIndex:uint = center.x + info["y"];
                
                if (rowIndex < 0 || rowIndex >= maxRow)
                {
                    continue;
                }
                if (colIndex < 0 || colIndex >= maxCol)
                {
                    continue;
                }
                //
                result.push(source[rowIndex][colIndex]);
            }
            return result;
        }
        
        /** 
        * 从数组中随机抽取一个元素 
        * @author fraser
        * */
        public static function getRandomElement(source:Array):*
        {
            var len:uint = source.length;
            if (len > 0)
            {
                var index:uint = MathUtils.random(0, len - 1);
                return source.splice(index, 1)[0];
            }
            else
            {
                return null;
            }
        }
    }
}
