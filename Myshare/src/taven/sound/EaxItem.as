package taven.sound
{
	import taven.log.Console;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.TimerEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.net.URLRequest;
	import flash.utils.Timer;
	
	/**
	 * 环境音效
	 * @author Taven
	 * 
	 */
	public class EaxItem extends Sound
	{
		private var _resource:String;
		private var _isPlay:Boolean = false;
		private var _soundchannel:SoundChannel = null;
		private var _maxVolume:int = 0;
		private var _currentVolume:Number = 0;
		private var _soundTime:int = 0;
		private var _replay:Boolean = false;
		private var _fade:Boolean = true;
		private static var _timer:Timer;
		private static var _soundTransformList:Array = [];
		
		public function playerUrl(resource:String, volume:int, fade:Boolean, replay:Boolean):void
		{
			if (_timer == null)
			{
				_timer = new Timer(100);
				_timer.start();
			}
			_resource = resource;
			_replay = replay;
			_maxVolume = volume;
			_isPlay = true;
			_fade = fade;
			_currentVolume = _fade ? 0 : _maxVolume;
			addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			load(new URLRequest(_resource));
			addEventListener(Event.COMPLETE, completeFun);
		}
		
		private function ioErrorHandler(event:IOErrorEvent):void
		{
			Console.write(_resource + " 音效素材没有找到");
		}
		
		public function stopSound():void
		{
			_isPlay = false;
			if (_soundchannel != null)
			{
				//_soundTime = _soundchannel.position;
				_soundTime = 0;
				if (_fade)
				{
					_currentVolume = _maxVolume - _maxVolume % 4;
					_timer.addEventListener(TimerEvent.TIMER, soundOut);
				}
				else
				{
					_currentVolume = 0;
				}
				_soundchannel.soundTransform = getSTF(_currentVolume);
				_soundchannel.removeEventListener(Event.SOUND_COMPLETE, playSoundComplete);
			}
		}
		
		public function updateSoundTransform(volume:int):void
		{
			_maxVolume = volume;
			if (_soundchannel)
			{
				if (_isPlay)
				{
					_currentVolume = _fade ? volume - volume % 4 : _maxVolume;
					_soundchannel.soundTransform = getSTF(_currentVolume);
				}
				else
				{
					_isPlay = true;
					_currentVolume = _fade ? 0 : _maxVolume;
					if (_soundchannel)
					{
						_soundchannel.stop();
						_soundchannel = play(_replay ? (0) : (_soundTime), 1, getSTF(_currentVolume));
						_soundchannel.addEventListener(Event.SOUND_COMPLETE, playSoundComplete);
						_timer.addEventListener(TimerEvent.TIMER, soundIn);
					}
				}
			}
		}
		
		private function completeFun(event:Event):void
		{
			if (_isPlay)
			{
				_soundchannel = play(0, 1, getSTF(_currentVolume));
				if (_soundchannel)
				{
					_soundchannel.addEventListener(Event.SOUND_COMPLETE, playSoundComplete);
					_timer.addEventListener(TimerEvent.TIMER, soundIn);
				}
			}
		}
		
		private function playSoundComplete(event:Event):void
		{
			var channel:SoundChannel = event.currentTarget as SoundChannel;
			channel.removeEventListener(Event.SOUND_COMPLETE, playSoundComplete);
			if (channel == _soundchannel && _isPlay)
			{
				stopSound();
				_soundTime = 0;
				if (_replay)
				{
					updateSoundTransform(_maxVolume);
				}
			}
		}
		
		private function soundIn(event:Event):void
		{
			if (_isPlay && _currentVolume < _maxVolume)
			{
				_currentVolume = _currentVolume + 4;
				_soundchannel.soundTransform = getSTF(_currentVolume);
			}
			else
			{
				_timer.removeEventListener(TimerEvent.TIMER, soundIn);
			}
		}
		
		private function soundOut(event:Event):void
		{
			if (!_isPlay && _currentVolume > 0)
			{
				_currentVolume = _currentVolume - 10;
				_soundchannel.soundTransform = getSTF(_currentVolume);
				if (_currentVolume <= 0)
				{
					_soundchannel.stop();
				}
			}
			else
			{
				_timer.removeEventListener(TimerEvent.TIMER, soundOut);
			}
		}
		
		private static function getSTF(volume:int):SoundTransform
		{
			if (!_soundTransformList[volume])
			{
				_soundTransformList[volume] = new SoundTransform(volume * 0.01);
			}
			return _soundTransformList[volume];
		}

		public function get isPlay():Boolean
		{
			return _isPlay;
		}
	}
}