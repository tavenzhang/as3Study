package taven.entity
{
	import flash.geom.Point;

	/**
	 * 实体的基本配置参数
	 * @author Taven
	 */	
	public class EntityDefinition
	{
		private var _id:String;
		private var _pos:Point;
		
		public function EntityDefinition(id:String, pos:Point)
		{
			_id = id;
			_pos = pos;
		}
		
		public function get id():String
		{
			return _id;
		}

		public function get pos():Point
		{
			return _pos;
		}
	}
}