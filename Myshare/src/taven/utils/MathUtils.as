package taven.utils
{
	import flash.geom.Point;

	/**
	 * 数学工具类
	 * @author Taven
	 */
	public class MathUtils 
	{
		// 位位置 
		public static const BIT_POS:Array = [0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x100, 0x200, 0x400, 0x800, 0x1000, 
											0x2000, 0x4000, 0x8000, 0x10000, 0x20000, 0x40000, 0x80000, 0x100000, 0x200000,
											0x400000, 0x800000, 0x1000000, 0x2000000, 0x4000000, 0x8000000, 0x10000000,
											0x20000000, 0x40000000, 0x80000000,];
		// 十六进制字符集
		private static var hexChars:String = "0123456789abcdef";
		
		/**
		 * 范围控制数值
		 * @param	value
		 * @param	min
		 * @param	max
		 * @return
		 */
		public static function clamp(value:Number, min:Number, max:Number):Number
		{
			return Math.min(Math.max(value, min), max);
		}
		
		
		/** 数字转化为设定长度的字符串数组 */
		public static function numberArray(value:uint, length:uint):Array
		{
			var tmp:Array = String(value).split("");
			while (tmp.length < length)
			{
				tmp.unshift("0");
			}
			return tmp;
		}
		
		/**
		 * 生成区间的随机数: 包含最小值与最大值
		 * @param min
		 * @param max
		 * @return 
		 * 
		 */
		public static function rangeRandom(min:int, max:int):int
		{
			return Math.random() * (max - min + 1) + min;
		}
		
		public static function parseNumberToDigitVec (number:int) : Vector.<int>
		{
			var digitVec:Vector.<int> = new Vector.<int>();
			var digitNum:int = 0;
			if ( number > 0 )
			{
				while ( number > 0 )
				{
					var digit:int = number % 10;
					digitVec.push(digit);
					number /= 10;
					digitNum++;
				}
			}
			else if ( number == 0 )
			{
				digitVec.push(0);
			}
			return digitVec.reverse();
		}
		
		public static function getRandomInt (range:int) : int
		{
			return int(-(range >> 1) + Math.random() * (range >> 1));
		}
		
		public static function equalsNumber (leftOperant:Number, rightOperant:Number) : Boolean
		{
			var equalLimit:Number = .01;
			if ( Math.abs(leftOperant - rightOperant) < equalLimit )
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		
		public static function random (nMinimum:Number, nMaximum:Number = 0, nRoundToInterval:Number = 1) : Number
		{
			if ( nMinimum > nMaximum )
			{
				var nTemp:Number = nMinimum;
				nMinimum = nMaximum;
				nMaximum = nTemp;
			}
			var nDeltaRange:Number = (nMaximum - nMinimum) + (1 * nRoundToInterval);
			var nRandomNumber:Number = Math.random() * nDeltaRange;
			nRandomNumber += nMinimum;
			return floor(nRandomNumber,nRoundToInterval);
		}
		
		public static function floor (nNumber:Number, nRoundToInterval:Number = 1) : Number
		{
			return Math.floor(nNumber / nRoundToInterval) * nRoundToInterval;
		}
		
		/**
		 * 获取一个整数的某一位值 
		 * @param byte
		 * @param index
		 * @return 
		 * 
		 */		
		public static function getBit(byte:uint,index:uint):uint
		{
			return (byte&BIT_POS[index])>>index;
		}
		
		/**
		 * computes how many digitals of a specified number equals 1 
		 * @param byte
		 * @return counter 
		 * 
		 */		
		public static function getNumOf1(byte:uint):uint
		{
			var counter:int;
			for (var i:int = 0; i < 32; i++)
			{
				if (getBit(byte, i))
				{
					counter++;
				}
			}
			return counter;
		}
		
		/**
		 * Rotates x left n bits
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 9.0
		 * @tiptext
		 */
		public static function rol(x:int, n:int):int
		{
			return (x << n) | (x >>> (32 - n));
		}
		
		/**
		 * Rotates x right n bits
		 *
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 9.0
		 * @tiptext
		 */
		public static function ror(x:int, n:int):uint
		{
			var nn:int = 32 - n;
			return (x << nn) | (x >>> (32 - nn));
		}
		
		/**
		 * 十进制转十六进制字符
		 * @param n
		 * @param bigEndian
		 * @return 
		 * 
		 */
		public static function toHex(n:int, bigEndian:Boolean = false):String
		{
			var s:String = "";
			if (bigEndian)
			{
				for (var i:int = 0; i < 4; i++)
				{
					s += hexChars.charAt((n >> ((3 - i) * 8 + 4)) & 0xF) + hexChars.charAt((n >> ((3 - i) * 8)) & 0xF);
				}
			}
			else
			{
				for (var x:int = 0; x < 4; x++)
				{
					s += hexChars.charAt((n >> (x * 8 + 4)) & 0xF) + hexChars.charAt((n >> (x * 8)) & 0xF);
				}
			}
			return s;
		}
		
		/**
		 * 获取一个数的一部分(所有部分的数加起来等于total)
		 * @param total
		 * @param part
		 * @param index  0 开始索引
		 * @return 
		 */
		public static function getNumberPart(total:int, part:int, index:int):int
		{
			var pageSize:int = Math.ceil(total / part);
			
			var curIndex:uint= index*pageSize;
			
			var endIndex:int = (index+1)*pageSize;
			var result:int = 0;
			if(pageSize>=1)
			{
				if(endIndex >total)
				{
					result =  (total-index*pageSize);
				}
				else
				{
					result =  pageSize;
				}
			}
			else
			{
				if((index+1)<=total)
				{
					result = 1;
				}
				else
				{
					result = 0;
				}
			}
			return result;
		}
		
		/**
		 * 计算两个点与水平线的夹角，以第四象限作为起始角度的增大区间
		 */
		public static function getAngleBetweenTwoPoint(srcPt:Point, tarPt:Point):Number
		{
			if(tarPt.y == srcPt.y)
			{
				return (tarPt.x >= srcPt.x)?0:180;
			}
			else if(tarPt.x == srcPt.x)
			{
				return (tarPt.y >= srcPt.y)?90:270;
			}
			
			var angle:Number = Math.abs((Math.atan((tarPt.y - srcPt.y) / (tarPt.x - srcPt.x)) * 360 / (2 * Math.PI)));
			
			if(tarPt.y < srcPt.y)
			{
				if(tarPt.x > srcPt.x)
				{
					// 第一象限
					return 360 - angle;
				}
				else
				{
					// 第二象限
					return 180 + angle;
				}
			}
			else
			{
				if(tarPt.x > srcPt.x)
				{
					// 第四象限
					return angle;
				}
				else
				{
					// 第三象限
					return 180 - angle;
				}
			}
		}
		
		/**
		 * 计算两个点的直线距离
		 */
		public static function distance(srcPt:Point, tarPt:Point):Number
		{
			return Math.sqrt(Math.pow(tarPt.y - srcPt.y, 2) + Math.pow(tarPt.x - srcPt.x, 2));
		}
		
		
		public static function log2(x:Number):Number
		{
			return Math.log(x) * Math.LOG2E;
		}
		
		public static function log10(x:Number):Number
		{
			return Math.log(x) * Math.LOG10E;
		}
		
		public static function log(x:Number, n:int):Number
		{
			//			if(x%n != 0)
			//				return NaN;
			switch (n)
			{
				case 2:
					return Math.LOG2E * Math.log(x);
				case 10:
					return Math.LOG10E * Math.log(x);
				default:
					throw new Error("todo");
			}
		}
	}
}
