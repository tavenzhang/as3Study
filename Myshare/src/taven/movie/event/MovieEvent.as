package taven.movie.event
{
	import flash.events.Event;

	/**
	 * 动画事件
	 * @author taven
	 */
	public class MovieEvent extends Event
	{
		public static const START_PLAY_SCENE_MOVIE:String = "start play scene movie";
		public static const END_PLAY_SCENE_MOVIE:String = "end play scene movie";
		public static const START_PLAY_FULLSCREEN_MOVIE:String = "start play fullscreen movie";
		public static const END_PLAY_FULLSCREEN_MOVIE:String = "end play fullscreen movie";
		public static const START_PLAY_CARTOON_MOVIE:String = "start play cartoon movie";
		public static const END_PLAY_CARTOON_MOVIE:String = "end play cartoon movie";
		
		public function MovieEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new MovieEvent(type, bubbles, cancelable);
		}
	}
}