package taven.resource
{
	/**
	 * 资源项
	 * @author Taven
	 */
	public class ResourceItem
	{
		private var _key:String;
		
		private var _data:*;
		
		public function ResourceItem(key:String, data:*)
		{
			_key = key;
			_data = data;
		}
		
		public function get key():String
		{
			return _key;
		}

		public function get data():*
		{
			return _data;
		}
	}
}