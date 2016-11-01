/**
 * stats.as
 * https://github.com/mrdoob/Hi-ReS-Stats
 *
 * Released under MIT license:
 * http://www.opensource.org/licenses/mit-license.php
 *
 * How to use:
 *
 * addChild( new Stats() );
 *
 **/
package state
{
    import flash.display.BitmapData;
    import flash.display.Sprite;
    import flash.display.Stage;
    import flash.events.Event;
    import flash.events.KeyboardEvent;
    import flash.events.MouseEvent;
    import flash.events.StatusEvent;
    import flash.geom.Matrix;
    import flash.geom.Point;
    import flash.geom.Rectangle;
    import flash.net.LocalConnection;
    import flash.system.System;
    import flash.text.StyleSheet;
    import flash.text.TextField;
    import flash.ui.Keyboard;
    import flash.utils.getTimer;

    public class Stats extends Sprite
    {
		private const WIDTH:uint = 70;
		private const HEIGHT:uint = 100;
		private var _xml:XML;
        private var _stage:Stage;
		private var _text:TextField;
		private var _style:StyleSheet;
		private var _timer:uint;
		private var _fps:uint;
		private var _ms:uint;
		private var _msPrev:uint;
		private var _mem:Number;
		private var _memMax:Number;
		private var _graph:BitmapData;
		private var _rect:Rectangle;
		private var _fpsGraph:uint;
		private var _memGraph:uint;
		private var _memMaxGraph:uint;
		private var _colors:Colors = new Colors();
        private var _conn:LocalConnection;
        private var _obj:Object = new Object();
        private var _step:uint = 0;
		
        /**
         * <b>Stats</b> FPS, MS and MEM, all in one.
         */
        public function Stats(stage:Stage):void
        {
            _stage = stage;
            _memMax = 0;

            _xml = <xml><fps>FPS:</fps><ms>MS:</ms><mem>MEM:</mem><memMax>MAX:</memMax></xml>;

            _style = new StyleSheet();
            _style.setStyle('xml', { fontSize: '9px', fontFamily: '_sans', leading: '-2px' });
            _style.setStyle('fps', { color: hex2css(_colors.fps)});
            _style.setStyle('ms', { color: hex2css(_colors.ms)});
            _style.setStyle('mem', { color: hex2css(_colors.mem)});
            _style.setStyle('memMax', { color: hex2css(_colors.memmax)});

            _text = new TextField();
            _text.width = WIDTH;
            _text.height = 50;
            _text.styleSheet = _style;
            _text.condenseWhite = true;
            _text.selectable = false;
            _text.mouseEnabled = false;

            _rect = new Rectangle(WIDTH - 1, 0, 1, HEIGHT - 50);

            addEventListener(Event.ADDED_TO_STAGE, init, false, 0, true);
            addEventListener(Event.REMOVED_FROM_STAGE, destroy, false, 0, true);

            _conn = new LocalConnection();
            _conn.allowDomain("*");
            _conn.addEventListener(StatusEvent.STATUS, onStatus);
			
			_stage.addEventListener(KeyboardEvent.KEY_DOWN, keydownHandler);
			_stage.addEventListener(Event.RESIZE, resizeHandler);
			_stage.addChild(this);
			resizeHandler();
        }
		
		private function keydownHandler(event:KeyboardEvent):void
		{
			if (event.keyCode == Keyboard.INSERT)
			{
				if (parent)
				{
					parent.removeChild(this);
				}
				else
				{
					_stage.addChild(this);
					resizeHandler();
				}
			}
		}
		
		private function resizeHandler(event:Event = null):void
		{
			if (parent)
			{
				var _point:Point = parent.globalToLocal(new Point(20, 100));
				this.x = _point.x;
				this.y = _point.y;
			}
		}

        private function onStatus(event:StatusEvent):void
        {
            switch (event.level)
            {
                case "status":
                    break;
                case "error":
                    break;
            }
        }

        private function init(e:Event):void
        {

            graphics.beginFill(_colors.bg);
            graphics.drawRect(0, 0, WIDTH, HEIGHT);
            graphics.endFill();

            addChild(_text);

            _graph = new BitmapData(WIDTH, HEIGHT - 50, true, _colors.bg);
            graphics.beginBitmapFill(_graph, new Matrix(1, 0, 0, 1, 0, 50));
            graphics.drawRect(0, 50, WIDTH, HEIGHT - 50);

            addEventListener(MouseEvent.CLICK, onClick);
            addEventListener(Event.ENTER_FRAME, update);

        }

        private function destroy(e:Event):void
        {

            graphics.clear();

            while (numChildren > 0)
                removeChildAt(0);

            _graph.dispose();

            removeEventListener(MouseEvent.CLICK, onClick);
            removeEventListener(Event.ENTER_FRAME, update);

        }

        private function update(e:Event):void
        {

            _timer = getTimer();

            if (_timer - 1000 > _msPrev)
            {

                _msPrev = _timer;
                _mem = Number((System.totalMemory * 0.000000954).toFixed(3));
                _memMax = _memMax > _mem ? _memMax : _mem;

                _fpsGraph = Math.min(_graph.height, (_fps / stage.frameRate) * _graph.height);
                _memGraph = Math.min(_graph.height, Math.sqrt(Math.sqrt(_mem * 5000))) - 2;
                _memMaxGraph = Math.min(_graph.height, Math.sqrt(Math.sqrt(_memMax * 5000))) - 2;

                _graph.scroll(-1, 0);

                _graph.fillRect(_rect, _colors.bg);
                _graph.setPixel(_graph.width - 1, _graph.height - _fpsGraph, _colors.fps);
                _graph.setPixel(_graph.width - 1, _graph.height - ((_timer - _ms) >> 1), _colors.ms);
                _graph.setPixel(_graph.width - 1, _graph.height - _memGraph, _colors.mem);
                _graph.setPixel(_graph.width - 1, _graph.height - _memMaxGraph, _colors.memmax);

                _xml.fps = "FPS: " + _fps + " / " + stage.frameRate;
                _obj.fps = _fps;
                _xml.mem = "MEM: " + _mem;
                _xml.memMax = "MAX: " + _memMax;

                _fps = 0;

            }

            _fps++;

            _xml.ms = "MS: " + (_timer - _ms);
            _obj.stageFps = stage.frameRate;
            _obj.mem = _mem;
            _obj.memMax = _memMax;
            _obj.ms = (_timer - _ms);
            _ms = _timer;

            _text.htmlText = _xml;
            _step++;
            if (_step == 33)
            {
                _conn.send("_myConnection", "postFPS", _obj);
                _step = 0;
            }
        }

        private function onClick(e:MouseEvent):void
        {

            mouseY / height > .5 ? stage.frameRate-- : stage.frameRate++;
            _xml.fps = "FPS: " + _fps + " / " + stage.frameRate;
            _text.htmlText = _xml;

        }

        // .. Utils

        private function hex2css(color:int):String
        {
			return "#" + color.toString(16);
        }
    }
}

class Colors
{
    public var bg:uint = 0x88000033;
    public var fps:uint = 0xffff00;
    public var ms:uint = 0x00ff00;
    public var mem:uint = 0x00ffff;
    public var memmax:uint = 0xff0070;
}
