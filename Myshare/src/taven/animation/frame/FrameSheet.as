package taven.animation.frame
{
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;
	import taven.log.Console;
	
	/**
	 * 位图资源导入后在内存中还原展开
	 * @author kramer
	 */	
	public class FrameSheet
	{
		private var _rawData:ByteArray;
		private var _unitWidth:uint;
		private var _unitHeight:uint;
		private var _sheetImage:Bitmap;
		private var _frameNum:uint;
		private var _frameInfoVec:Vector.<FrameInfo>;
		private var _isReady:Boolean;
		
		private var _frameNumX:uint;
		private var _frameNumY:uint;
		
		private var _initializedFrameCount:uint;
		
		private var _imageLoader:Loader;
		
		public function FrameSheet(data:ByteArray)
		{
			_rawData = data;
			initialize();
		}
		
		private function initialize():void
		{
			_isReady = false;
			
			parseFrameInfo();
			parseSheet();
			_rawData = null;
		}
		
		private function parseFrameInfo():void
		{
			var infoData:ByteArray = new ByteArray();
			var infoLen:int = _rawData.readShort();
			_rawData.readBytes(infoData, 0, infoLen);
			_unitWidth = infoData.readShort();
			_unitHeight = infoData.readShort();
			_frameNum = infoData.readShort();
			_frameInfoVec = new Vector.<FrameInfo>();
			for(var i:int = 0; i < _frameNum; i++)
			{
				var frameInfo:FrameInfo = new FrameInfo();
				frameInfo.keyNum = infoData.readShort();
				frameInfo.offsetX = infoData.readShort();
				frameInfo.offsetY = infoData.readShort();
				frameInfo.contentWidth = infoData.readShort();
				frameInfo.contentHeight = infoData.readShort();
				frameInfo.sheetIndex = infoData.readShort();
				_frameInfoVec.push(frameInfo);
			}
		}
		
		private function parseSheet():void
		{
			var imageData:ByteArray = new ByteArray();
			_rawData.readBytes(imageData);
			imageData.position = 0;
			_imageLoader = new Loader();
			_imageLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onImageLoaded);
			_imageLoader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onError);
			_imageLoader.loadBytes(imageData);
		}
		
		private function removeImageLoaderEventListener():void
		{
			_imageLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onImageLoaded);
			_imageLoader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onError);
		}
		
		private function onImageLoaded(evt:Event):void
		{
			var info:LoaderInfo = evt.target as LoaderInfo;
			_sheetImage = info.content as Bitmap;
			_frameNumX = _sheetImage.width / _unitWidth;
			_frameNumY = _sheetImage.height / _unitHeight;
			_isReady = true;
		}
		
		private function onError(evt:Event):void
		{
			Console.write("文件解析失败");
		}
		
		public function get isReady():Boolean
		{
			return _isReady;
		}
		
		//frameIndex start from 1
		public function getFrameInfo(frameIndex:int):FrameInfo
		{
			var frameInfoIndex:uint = findFrameInfoIndex(frameIndex);
			var frameInfo:FrameInfo = _frameInfoVec[frameInfoIndex];
			if(frameInfo.bitmapData == null)
			{
				createFrameData(frameInfo, frameInfo.sheetIndex);
			}
			return frameInfo;
		}
		
		private function findFrameInfoIndex(frameIndex:uint):uint
		{
			var keyFrameLen:int = _frameInfoVec.length;
			for(var i:int = 0; i < keyFrameLen; i++)
			{
				var frameInfo:FrameInfo = _frameInfoVec[i];
				if(frameIndex == frameInfo.keyNum)
				{
					return  i;
				} 
				if(frameIndex < frameInfo.keyNum)
				{
					return i-1;
				}
			}
			return keyFrameLen - 1;
		}
		
		private function createFrameData(frameInfo:FrameInfo, sheetIndex:int):void
		{
			var xIndex:int = sheetIndex % _frameNumX;
			var yIndex:int = sheetIndex / _frameNumX;
			var startX:int = xIndex * _unitWidth;
			var startY:int = yIndex * _unitHeight;
			var frameRect:Rectangle = new Rectangle(startX, startY, frameInfo.contentWidth, frameInfo.contentHeight);
			var frameBitmapData:BitmapData;
			frameBitmapData = new BitmapData(frameInfo.contentWidth, frameInfo.contentHeight, true, 0xFF33FF);
			frameBitmapData.copyPixels(_sheetImage.bitmapData, frameRect, new Point(0, 0));
			frameInfo.bitmapData = frameBitmapData;
			_initializedFrameCount++;
			if(_initializedFrameCount >= _frameNum)
			{
				disposeSheetImage();
			}
		}
		
		private function disposeSheetImage():void
		{
			if(_sheetImage)
			{
				_sheetImage = null;
				_imageLoader.unloadAndStop();
				_imageLoader = null;
			}
		}
		
		public function dispose():void
		{
			for each(var frameInfo:FrameInfo in _frameInfoVec)
			{
				if(frameInfo.bitmapData)
				{
					frameInfo.bitmapData.dispose();
				}
				frameInfo = null;
			}
			_frameInfoVec = null;
			disposeSheetImage();
		}
	}
}