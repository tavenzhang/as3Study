package taven.animation.frame
{
	import taven.dataset.HashMap;
	
	import flash.geom.Point;
	import flash.utils.ByteArray;
	
	/**
	 * 将位图序列资源解析为帧序列
	 * @author kramer
	 */	
	public class FrameSequence
	{
		private var _url:String;
		private var _index:int;
		
		private var _rawData:ByteArray;
		private var _sheet:FrameSheet;
		
		private var _frameWidth:uint;
		private var _frameHeight:uint;
		private var _totalFrameNum:uint;
		private var _anchor:Point;
		private var _labelMap:HashMap;
		
		private var _referredCount:uint;
		private var _isValid:Boolean = true;
		
		public function FrameSequence(url:String, index:int)
		{
			_url = url;
			_index = index;
		}
		
		public function get url():String
		{
			return _url;
		}
		
		public function get index():int
		{
			return _index;
		}
		
		public function setData(data:ByteArray):void
		{
			_rawData = data;
			if (_rawData)
			{
				parseHead();
				parseSpriteSheet();
				_rawData = null;
				_isValid = true;
			}
			else
			{
				_isValid = false;
			}
		}
		
		private function parseHead():void
		{
			var headData:ByteArray = new ByteArray();
			var headLen:uint = _rawData.readShort();
			_rawData.readBytes(headData, 0, headLen);
			headData.position = 0;
			_frameWidth = headData.readShort();
			_frameHeight = headData.readShort();
			_totalFrameNum = headData.readShort();
			_anchor = new Point(headData.readShort(), headData.readShort());
			var labelObj:Object = headData.readObject();
			var labelCombination:String = labelObj.l as String;
			var labelIndexCombination:String = labelObj.i as String;
			parseLabel(labelCombination, labelIndexCombination);
		}
		
		private function parseLabel(labelCombination:String, indexCombination:String):void
		{
			var labelArr:Array = labelCombination.split(",");
			var labeIndexArr:Array = indexCombination.split(",");
			_labelMap = new HashMap();
			var labelLen:int = labelArr.length;
			for(var i:int = 0; i < labelLen; i++)
			{
				var frameLabelInfo:FrameLabelInfo = new FrameLabelInfo(labelArr[i], labeIndexArr[i*2], labeIndexArr[i*2 + 1]); 
				_labelMap.add(labelArr[i], frameLabelInfo);
			}
		}
		
		private function parseSpriteSheet():void
		{
			_sheet = new FrameSheet(_rawData);
		}
		
		public function getTotalFrameNum():uint
		{
			return _totalFrameNum;
		}
		
		public function getLabelInfo(label:String):FrameLabelInfo
		{
			return _labelMap.getValue(label);
		}
		
		public function getLabelMap():HashMap
		{
			return _labelMap;
		}
		
		public function getFrameInfoByIndex(frameIndex:uint):FrameInfo
		{
			if(isReady == true)
			{
				return _sheet.getFrameInfo(frameIndex);
			}
			return null;
		}
		
		public function get isReady():Boolean
		{
			return _sheet && _sheet.isReady;
		}
		
		public function get isValid():Boolean
		{
			return _isValid;
		}
		
		public function get referredCount():uint
		{
			return _referredCount;
		}
		
		public function set referredCount(value:uint):void
		{
			_referredCount = value;
		}
		
		public function get anchor():Point
		{
			return _anchor;
		}
		
		public function get frameWidth():uint
		{
			return _frameWidth;
		}
		
		public function get frameHeight():uint
		{
			return _frameHeight;
		}
		
		public function dispose():void
		{
			if(_sheet != null)
			{
				_sheet.dispose();
				_sheet = null;
			}
		}
	}
}