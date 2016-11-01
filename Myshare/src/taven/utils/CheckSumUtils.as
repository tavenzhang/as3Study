package taven.utils
{
	import flash.utils.ByteArray;
	
	/**
	 * 校验和 taven
	 */
	public class CheckSumUtils
	{
		private static const HASH_RANDOM_MASK:uint = 1463735687;
		
		private static const HASH_RANDOM_MASK2:uint = 1653893711;
		
		public static function getCheckSum(byteArray:ByteArray):uint
		{
			byteArray.position = 0;
			var fold:uint = 0;
			while(byteArray.bytesAvailable)
			{
				var byte:uint = byteArray.readUnsignedByte();
				fold = foldUintPair(fold, byte);
			}
			byteArray.position = 0;
			return fold;
		}
		
		private static function foldUintPair(n1:uint, n2:uint):uint
		{
			return (((((n1 ^ n2 ^ HASH_RANDOM_MASK2) << 8) + n1) ^ HASH_RANDOM_MASK) + n2);
		}
	}
}