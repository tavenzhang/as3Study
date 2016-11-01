package taven.utils
{

	/**
	 * 种子随机类（伪随机）
	 * @author lynx
	 */
	public class SeedRandom
	{
		public var seed:Number;
		public var randomFunc:Function;

		/**
		 * @param randomFunc(seed:Number):void
		 * @param seed:Number
		 */
		public function SeedRandom(randomFunc:Function, seed:Number = NaN)
		{
			if (randomFunc == null)
				throw new Error("randomFunc is null");
			this.randomFunc = randomFunc;
			this.seed = seed;
		}

		public function newInt(min:int, max:int, seed:Number = NaN):int
		{
			if (isNaN(seed))
				seed = this.seed;
			return randomFunc(seed) * (max - min) + min + .5;
		}

		public function newNumber(min:Number = 0, max:Number = 1, seed:Number = NaN):Number
		{
			if (isNaN(min))
				throw new Error("min is NaN");
			if (isNaN(max))
				throw new Error("max is NaN");
			if (isNaN(seed))
				seed = this.seed;
			if (min == 0 && max == 1)
				return randomFunc(seed);
			else
				return randomFunc(seed) * (max - min) + min;
		}

		static public function random(seed:Number = NaN):Number
		{
			if (isNaN(seed))
				return Math.random();
			else
			{
				if (seed == 0)
					seed = Number.MIN_VALUE;
				if (seed >= 1)
				{
					if ((seed % 1) == 0)
						seed /= Math.PI;
					seed %= 1;
				}
				else if (seed < 0)
					seed = (seed % 1) + 1;
				return ((69621 * int(seed * 0x7FFFFFFF)) % 0x7FFFFFFF) / 0x7FFFFFFF;
			}
		}
	}
}
