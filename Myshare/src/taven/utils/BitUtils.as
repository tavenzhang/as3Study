package taven.utils
{

	/**
	 * ClientCore -  BitUtils
	 *
	 * Created by fraser on 2013-11-19
	 * Copyright TAOMEE 2013. All rights reserved
	 */
	public class BitUtils
	{
		/**
		 * 设置标记位
		 * 二进制操作
		 * bitPos  0 - 7 
		 * */
		public static function setBit(originData:uint, bitPos:uint, flag:Boolean):uint
		{
			bitPos = bitPos > 7 ? 7 : bitPos ;
			if(bitPos == 7 )
			{
				originData = uint(flag) << 7;  //Set bit 8 to true
			}
			else
			{
				originData |= uint(flag)<< bitPos; //Set bit 7 to true
			}
			return originData ;
		}

		/**
		 * @param unsigned32 无符号32位整型
		 * @param bit 要获取的相应的位数值, 从0开始
		 * @return
		 *
		 */
		public static function getBit(unsigned32:uint, bit:uint):uint
		{
			const l:int = 32;
			const t:uint = 1;
			var i:int = 0;
			if (bit == 0) return unsigned32 & t;
			unsigned32 = unsigned32 >> bit;
			return unsigned32 & t;
		}
		
	}
}
