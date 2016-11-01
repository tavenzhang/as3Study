package taven.utils
{
	/**
	 * 二进制工具类 
	 * @author taven
	 * 
	 */	
	public class BinaryUtil
	{
		/**
		 * 获取二进制数据中指定特征位是否为1 
		 * @param value
		 * @param pos
		 * 
		 */		
		public static function gainStampedBit(value:uint, pos:uint):Boolean
		{
			return (1 << pos & value) != 0;
		}
		/**
		 * 将指定位改为1
		 * @param value
		 * @param pos
		 * @return 
		 * 
		 */		
		public static function changeBitToFalse(value:uint, pos:uint):uint
		{
			return 1 << pos & value;
		}
		/**
		 * 将指定位改为0
		 * @param value
		 * @param pos
		 * @return 
		 * 
		 */		
		public static function changeBitToTrue(value:uint, pos:uint):uint
		{
			return 1 << pos ^ value;
		}
	}
}