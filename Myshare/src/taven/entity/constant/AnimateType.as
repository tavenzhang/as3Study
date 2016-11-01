package taven.entity.constant
{
	/**
	 * 动作类型
	 * @author Taven
	 */
	public final class AnimateType
	{
		// 待机
		public static const IDLE:String = "idle";
		// 行走
		public static const WALK:String = "walk";
		// 骑乘待机
		public static const RIDEIDLE:String = "rideidle";
		// 骑乘行走
		public static const RIDEWALK:String = "ridewalk";
		// 操作
		public static const OPERATE:String = "operate";
		// 搞怪动作(只在待机的时候随机播放, 非必要)
		public static const WACKY:String = "wacky";
		
		// 正面
		public static const DIR_FRONT:String = "front";
		// 背面
		public static const DIR_BACK:String = "back";
	}
}