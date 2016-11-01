package taven.sound
{
	import flash.utils.clearTimeout;
	import flash.utils.setTimeout;
	

	/**
	 * 声音管理器
	 * @author Taven
	 * 
	 */
	public class SoundManager
	{
		private static var _mute:int = 1;
		private static var _bgVolume:int = 100;
		private static var _soundList:Array = [];
		private static var _bgSound:SoundItem = null;
		
		private static var _eaxVolume:int = 60;
		private static var _eaxList:Array = [];
		
		private static var _tempMute:int;
		
		private static var _urlArr:Array;
		private static var _sound:SoundItem;
		private static var _playedSoundArr:Array;
		private static var _randIndex:int;
		
		private static var _replyInterval:int = 3000;
		
		public static function set bgVolume(value:int):void
		{
			_bgVolume = value;
			upBgVolume();
		}
		
		public static function set mute(value:int):void
		{
			_mute = value;
			upBgVolume();
			upEaxVolume();
		}
		
		public static function get mute():int
		{
			return _mute;
		}
		
		private static function upBgVolume():void
		{
			var volume:int = _bgVolume * _mute;
			if (_bgSound != null)
			{
				_bgSound.updateSoundTransform(volume);
			}
		}
		
		public static function playBgSound(urlArr:Array, fadeIn:Boolean = true, replyInterval:int = 1):void
		{
			_replyInterval = replyInterval;
			_sound = null;
			_urlArr = urlArr;
			_playedSoundArr = [];
			if (_urlArr.length == 0)
			{
				stopBgSound();
				return;
			}
			
			_randIndex = int(_urlArr.length * Math.random());
			_playedSoundArr.push(_randIndex);
			var volume:int = _bgVolume * _mute;
			if (_soundList[_urlArr[_randIndex]] != null)
			{
				_sound = _soundList[_urlArr[_randIndex]];
				_sound.updateSoundTransform(volume);
			}
			else
			{
				_sound = new SoundItem();
				_soundList[_urlArr[_randIndex]] = _sound;
				_sound.playerUrl(_urlArr[_randIndex], volume, fadeIn, soundEnd);
			}
			if (_bgSound != null && _bgSound != _sound)
			{
				_bgSound.stopSound();
			}
			_bgSound = _sound;
		}
		
		private static function soundEnd():void
		{
			var interval:int = setTimeout(function():void
			{
				clearTimeout(interval);
				var j:int = _randIndex;
				if(_urlArr.length > 1)
				{
					while(j == _randIndex || _playedSoundArr.indexOf(j) >= 0)
					{
						j = int(_urlArr.length * Math.random());
					}
				}
				_randIndex = j;
				_playedSoundArr.push(j);
				if (_playedSoundArr.length == _urlArr.length)
				{
					_playedSoundArr = [];
				}
				var volume:int = _bgVolume * _mute;
				if (_soundList[_urlArr[j]] != null)
				{
					_sound = _soundList[_urlArr[j]];
					_sound.updateSoundTransform(volume);
				}
				else
				{
					_sound = new SoundItem();
					_soundList[_urlArr[j]] = _sound;
					_sound.playerUrl(_urlArr[j], volume, true, soundEnd);
				}
				
				if (_bgSound != null && _bgSound != _sound)
				{
					_bgSound.stopSound();
				}
				_bgSound = _sound;
			}, _replyInterval);
		}
		
		public static function stopBgSound() : void
		{
			if (_bgSound != null)
			{
				_bgSound.stopSound();
			}
			_bgSound = null;
		}
		
		public static function pauseSound():void
		{
			_tempMute = mute;
			mute = 0;
		}
		
		public static function continueSound():void
		{
			mute = _tempMute;
		}
		
		//////////////////////////////////////////////////////
		// 环境音响部分
		//////////////////////////////////////////////////////
		public static function set eaxVolume(value:int):void
		{
			_eaxVolume = value;
			upEaxVolume();
		}
		
		private static function upEaxVolume():void
		{
			var volume:int = _eaxVolume * _mute;
			for each(var eax:EaxItem in _eaxList)
			{
				if (eax.isPlay)
				{
					eax.updateSoundTransform(volume);
				}
			}
		}
		
		public static function playEax(url:String, repeat:Boolean, fade:Boolean = false):void
		{
			var eax:EaxItem = null;
			if (url == "")
			{
				return;
			}
			
			var volume:int = _eaxVolume * _mute;
			if (_eaxList[url] != null)
			{
				eax = _eaxList[url];
				eax.updateSoundTransform(volume);
			}
			else
			{
				eax = new EaxItem();
				_eaxList[url] = eax;
				eax.playerUrl(url, volume, fade, repeat);
			}
		}
		
		public static function stopEax(url:String):void
		{
			var eax:EaxItem = _eaxList[url];
			if (eax != null)
			{
				eax.stopSound();
			}
		}
	}
}