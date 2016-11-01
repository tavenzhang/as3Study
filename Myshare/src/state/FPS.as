package state 
{
	import flash.display.*;
	import flash.events.*;
	import flash.geom.*;
	import flash.system.*;
	import flash.text.*;
	import flash.utils.*;
	
	public class FPS extends Sprite
	{
		private var _currentY:int;
		private var _diagramTimer:int;
		private var _tfTimer:int;
		private var _diagram:BitmapData;
		private var _mem:TextField;
		private var _fps:TextField;
		private var _tfDelay:int = 0;
		private static var instance:FPS;
		private static const maxMemory:uint = 4.1943e+007;
		private static const diagramWidth:uint = 60;
		private static const tfDelayMax:int = 10;
		private static const diagramHeight:uint = 40;
		
		public function FPS():void
		{
			this.addEventListener(Event.ADDED_TO_STAGE, addToStageHandler);
		}
		
		private function addToStageHandler(e:Event):void
		{
			if (instance == null)
			{
				instance = this;
				_fps = new TextField();
				_mem = new TextField();
				this.mouseEnabled = false;
				this.mouseChildren = false;
				_fps.defaultTextFormat = new TextFormat("Tahoma", 10, 13421772);
				_fps.autoSize = TextFieldAutoSize.LEFT;
				_fps.text = "FPS: " + Number(stage.frameRate).toFixed(2);
				_fps.selectable = false;
				_fps.x = -diagramWidth - 2;
				addChild(_fps);
				_mem.defaultTextFormat = new TextFormat("Tahoma", 10, 13421568);
				_mem.autoSize = TextFieldAutoSize.LEFT;
				_mem.text = "MEM: " + bytesToString(System.totalMemory);
				_mem.selectable = false;
				_mem.x = -diagramWidth - 2;
				_mem.y = 10;
				addChild(_mem);
				_currentY = 20;
				_diagram = new BitmapData(diagramWidth, diagramHeight, true, 0x20ffff00);
				var _loc_2:Bitmap = new Bitmap(_diagram);
				_loc_2.y = _currentY + 4;
				_loc_2.x = -diagramWidth;
				addChildAt(_loc_2, 0);
				this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
				this.stage.addEventListener(Event.RESIZE, onResize);
				onResize();
				_diagramTimer = getTimer();
				_tfTimer = getTimer();
			}
		}
		
		private function bytesToString(memory:uint):String
		{
			var _str:String;
			if (memory < 1024)
			{
				_str = String(memory) + "b";
			}
			else if (memory < 10240)
			{
				_str = Number(memory / 1024).toFixed(2) + "kb";
			}
			else if (memory < 102400)
			{
				_str = Number(memory / 1024).toFixed(1) + "kb";
			}
			else if (memory < 1048576)
			{
				_str = int(memory / 1024) + "kb";
			}
			else if (memory < 10485760)
			{
				_str = Number(memory / 1048576).toFixed(2) + "mb";
			}
			else if (memory < 104857600)
			{
				_str = Number(memory / 1048576).toFixed(1) + "mb";
			}
			else
			{
				_str = int(memory / 1048576) + "mb";
			}
			return _str;
		}
		
		private function onEnterFrame(e:Event):void
		{
			_tfDelay++;
			if (_tfDelay >= tfDelayMax)
			{
				_tfDelay = 0;
				_fps.text = "FPS: " + Number(1000 * tfDelayMax / (getTimer() - _tfTimer)).toFixed(2);
				_tfTimer = getTimer();
			}
			var _loc_2:* = 1000 / (getTimer() - _diagramTimer);
			var _loc_3:* = _loc_2 > stage.frameRate ? (1) : (_loc_2 / stage.frameRate);
			_diagramTimer = getTimer();
			_diagram.scroll(1, 0);
			_diagram.fillRect(new Rectangle(0, 0, 1, diagramHeight), 0x20ffff00);
			_diagram.setPixel32(0, diagramHeight * (1 - _loc_3), 0xffcccccc);
			_mem.text = "MEM: " + bytesToString(System.totalMemory);
			var _loc_5:Number = System.totalMemory / maxMemory;
			_diagram.setPixel32(0, diagramHeight * (1 - _loc_5), 0xffff6600);
		}
		
		private function onResize(e:Event = null):void
		{
			var _point:Point = parent.globalToLocal(new Point(80, 90)); //stage.stageWidth 
			this.x = _point.x;
			this.y = _point.y;
		}
	}
}