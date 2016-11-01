package taven.animation.frame
{
	
	import flash.utils.ByteArray;
	
	import taven.resource.ResourceCache;
	import taven.resource.ResourceManager;
	
	/**
	 * 管理位图序列，位图序列Bitmapdata缓存逻辑在此
	 * @author kramer
	 * 
	 */	
	public class FrameSequenceManager
	{
		private static var _frameSequenceCache:ResourceCache = new ResourceCache();
		
		public function FrameSequenceManager(blocker:Blocker)
		{
		}
		
		/**
		 * 当缓存不持有sequence对象的引用时，就可以将该对象清理
		 * @param sequence
		 */
		public static function recyleFrameSequence(sequence:FrameSequence):void
		{
			sequence.referredCount--;
			
			// 检查是不是需清理
			var sequenceList:Array = _frameSequenceCache.fetch(sequence.url);
			var isReferred:Boolean = false;
			for each(sequence in sequenceList)
			{
				if (sequence.referredCount > 0)
				{
					isReferred = true;
					break;
				}
			}
			
			if (!isReferred)
			{
				for each(sequence in sequenceList)
				{
					sequence.dispose();
				}
				sequenceList.length = 0;
				_frameSequenceCache.remove(sequence.url)
			}
		}
		
		/**
		 * 获取序列帧列表: 针对于有多动画合并的资源文件
		 * @param url
		 * @param num
		 * @return 
		 */
		public static function getFrameSequence(url:String, num:int = 1):Array
		{
			var sequenceList:Array = [];
			if (_frameSequenceCache.containsKey(url))
			{
				for (var i:int = 0; i < num; i++)
				{
					sequenceList = _frameSequenceCache.fetch(url);
					for each(var sequence:FrameSequence in sequenceList)
					{
						sequence.referredCount += 1;
					}
				}
			}
			else
			{
				for (i = 0; i < num; i++)
				{
					sequence = new FrameSequence(url, i);
					sequenceList.push(sequence);
					sequence.referredCount += 1;
				}
				_frameSequenceCache.put(url, sequenceList);
				ResourceManager.loadFile(url, resourceLoadedHandler, null, { url: url, num: num }, ResourceManager.NO_CACHE);
			}
			return sequenceList;
		}
		
		/**
		 * 多动画合并的资源文件加载完成响应
		 * @param data
		 * @param args
		 */
		private static function resourceLoadedHandler(data:ByteArray, args:Object):void
		{
			var validList:Array = [];
			var sequenceList:Array = _frameSequenceCache.fetch(args.url);
			
			if (sequenceList)
			{
				data.position = 0;
				var sequenceNum:int = data.readShort();
				for (var i:int = 0; i < sequenceNum; i++)
				{
					var sequenceId:int = data.readShort();
					var sequenceLen:int = data.readUnsignedInt();
					var sequenceData:ByteArray = new ByteArray();
					try
					{
						data.readBytes(sequenceData, 0, sequenceLen);
					}
					catch (error:Error)
					{
						//TODO
						//Console.write("角色动作解析异常" +　args.url, Console.ERROR);
					}
					var sequence:FrameSequence = sequenceList[sequenceId];
					validList.push(sequenceId);
					if (sequence)
					{
						sequence.setData(sequenceData);
					}
				}
				
				for (i = 0; i < args.num; i++)
				{
					if (validList.indexOf(i) < 0)
					{
						sequence = sequenceList[i];
						if (sequence)
						{
							sequence.setData(null);
						}
					}
				}
			}
		}
	}
}
class Blocker{}