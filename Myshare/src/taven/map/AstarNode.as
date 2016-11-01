package taven.map
{
	import flash.geom.Point;

	public class AstarNode
	{
		/**起点到当前点的代价*/
		public var g:Number;
		/**f=g+h  代价总消耗*/
		public var f:Number;
		/** 父级节点*/
		public var pId:int;
		/**节点索引*/
		private var _nodeIdex:int;
		/**节点位置Point*/
		public var point:Point;

		private var _isOpen:Boolean;

		private var _isClose:Boolean;


		public function AstarNode(posPoint:Point, fValue:Number, gValue:Number, pNode:int, nodeIndex:int)
		{
			point=posPoint;
			f=fValue;
			g=gValue;
			pId=pNode;
			_nodeIdex = nodeIndex;
			resetStatue();
		}

		/**节点索引*/
		public function get nodeIdex():int
		{
			return _nodeIdex;
		}

		public function get isOpen():Boolean
		{
			return _isOpen;
		}

		public function set isOpen(value:Boolean):void
		{
			_isOpen=value;
			if (_isOpen && _isClose)
			{
				_isClose=false;
			}
		}

		public function get isClose():Boolean
		{
			return _isClose;
		}

		public function set isClose(value:Boolean):void
		{
			_isClose=value;
			if (_isOpen && _isClose)
			{
				_isOpen=false;
			}
		}

		private function resetStatue():void
		{
			isClose=false;
			_isOpen=false;
		}

	}
}
