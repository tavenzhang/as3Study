package taven.loading
{
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.Stage;
	
	import taven.manager.FrameManager;
	import taven.utils.DisplayUtils;
	import taven.utils.MathUtils;
	
	/**
	 * 加载等待界面
	 * @author Taven
	 * 
	 */
	public class Loading extends Sprite
	{
		private static var _stage:Stage;
		
		private static var _loading:MovieClip;
		
		private static var _background:Sprite = new Sprite();
		
		private static var _maskLayer:Sprite = new Sprite();
		
		private static var _mcPet:MovieClip;
		
		// 引用次数
		private static var _refNum:int = 0;
		
		public static function setup(stage:Stage, loading:MovieClip, width:int, height:int):void
		{
			_stage = stage;
			_loading = loading;
			_loading.addChildAt(_background, 0);
			
			var cover:Shape = new Shape();
			cover.graphics.beginFill(0, 0.3);
			cover.graphics.drawRect(0, 0, width, height);
			cover.graphics.endFill();
			_maskLayer.addChild(cover);
			
			_loading.addChildAt(_maskLayer, 0);
			_loading["mcPic"].gotoAndStop(1);
			var petIndex:int = MathUtils.rangeRandom(0, 2);
			for (var i:int = 0; i < 3; i++)
			{
				var mcPet:MovieClip = _loading["mcPet" + i];
				if (i == petIndex)
				{
					_mcPet = mcPet;
				}
				else
				{
					DisplayUtils.stopAllMovieClip(mcPet);
					DisplayUtils.removeFromParent(mcPet);
				}
			}
		}
		
		public static function setBackground(view:DisplayObject):void
		{
			_background.removeChildren();
			_background.addChild(view);
			if (_stage)
			{
				resize();
			}
		}

		public static function show(showBackground:Boolean = false):void
		{
			_refNum++;
			_stage.addChild(_loading);
			if (_refNum == 1)
			{
				_loading["mcPic"].gotoAndStop(1);
				FrameManager.addTickListener(2000, nextFrame);	
			}
			//var frame:int = MathUtils.rangeRandom(1, 60);
			//_loading["mcPic"].gotoAndPlay(_lastFrame);
			if (!_background.visible)
			{
				_background.visible = showBackground;
			}
			resize();
		}	
		
		public static function nextFrame():void
		{
			(_loading["mcPic"] as MovieClip).nextFrame();
		}
		
		public static function resize():void
		{
			_loading.x = (_stage.stageWidth) * 0.5;
			_loading.y = (_stage.stageHeight) * 0.5;
			_maskLayer.x = -_maskLayer.width * 0.5;
			_maskLayer.y = -_maskLayer.height * 0.5;
			_background.x = -_background.width * 0.5;
			_background.y = -_background.height * 0.5;
		}
		
		public static function hide():void
		{
			_refNum = Math.max(_refNum - 1, 0);
			if (_refNum == 0 && _loading.parent)
			{
				_background.visible = false;
				_loading.parent.removeChild(_loading);
				FrameManager.removeTickListener(nextFrame);
			}
		}
		
		public static function set fileName(value:String):void
		{
			_loading["txtFile"].text = value;
		}
		
		public static function set progress(value:Number):void
		{
			_loading["txtProgress"].text = value + "%";
			_loading["mcProgress"].gotoAndStop(value);
			_mcPet.gotoAndStop(value);
		}
		
		public static function set fileCount(value:String):void
		{
			_loading["txtCount"].text = value;
		}
	}
}