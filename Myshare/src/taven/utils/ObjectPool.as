package taven.utils
{
	/**
	 * 对象池
	 * @author Taven
	 */
	public class ObjectPool
	{
		// 对象类
		private var _objectClass:Class;
		// 已使用的对象列表
		private var _usedList:Array;
		// 未使用的对象列表
		private var _unusedList:Array;
		
		public function ObjectPool(objectClass:Class)
		{
			_objectClass = objectClass;
			_usedList = [];
			_unusedList = [];
		}
		
		/**
		 * 获取一个对象
		 * @return 
		 * 
		 */
		public function fetch():*
		{
			var object:*;
			if (_unusedList.length <= 0)
			{
				object = new _objectClass();
			}
			else
			{
				object = _unusedList.pop();
			}
			_usedList.push(object);
			return object;
		}
		
		/**
		 * 回收一个对象
		 * @param object
		 * 
		 */
		public function recycle(object:*):void
		{
			var index:int = _usedList.indexOf(object);
			if (index >= 0)
			{
				_unusedList.push(_usedList[index]);
				_usedList.splice(index, 1);
			}
		}
		
		/**
		 * 重置所有对象
		 * 
		 */
		public function reset():void
		{
			while(_usedList.length > 0)
			{
				_unusedList.push(_usedList.pop());
			}
		}
		
		/**
		 * 清理所有对象
		 * 
		 */
		public function purge():void
		{
			_usedList.length = 0;
			_unusedList.length = 0;
		}
	}
}
