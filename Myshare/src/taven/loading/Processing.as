package taven.loading
{
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.Stage;
	
	/**
	 * 处理等待界面
	 * @author Taven
	 * 
	 */
	public class Processing extends Sprite
	{
		private static var _stage:Stage;
		
		private static var _processing:MovieClip;
		
		private static var _maskLayer:Sprite = new Sprite();
		
		// 引用次数
		private static var _refNum:int = 0;
		
		public static function setup(stage:Stage, processing:MovieClip, width:int, height:int):void
		{
			_stage = stage;
			_processing = processing;
			
			var cover:Shape = new Shape();
			cover.graphics.beginFill(0, 0.3);
			cover.graphics.drawRect(0, 0, width, height);
			cover.graphics.endFill();
			_maskLayer.addChild(cover);
			_processing["txtProgress"].text = "";
			_processing.addChildAt(_maskLayer, 0);
		}

		public static function show():void
		{
			_refNum++;
			resize();
			_stage.addChild(_processing);
		}
		
		public static function hide():void
		{
			_refNum = Math.max(_refNum - 1, 0);
			if (_refNum == 0 && _processing.parent)
			{
				_processing["txtProgress"].text = "";
				_processing.parent.removeChild(_processing);
			}
		}
		
		public static function set content(value:String):void
		{
			_processing["txtProgress"].text = value;
		}
		
		public static function resize():void
		{
			_processing.x = (_stage.stageWidth) * 0.5;
			_processing.y = (_stage.stageHeight) * 0.5;
			_maskLayer.x = -_maskLayer.width * 0.5;
			_maskLayer.y = -_maskLayer.height * 0.5;
		}
	}
}