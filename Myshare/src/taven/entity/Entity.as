package taven.entity
{
	
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	import flash.geom.Point;

	/**
	 * 实体类
	 * @author Taven
	 */	
	public class Entity extends Sprite
	{
		// 定义数据
		private var _definition:EntityDefinition;
		
		// 是否选中
		private var _selected:Boolean;
		
		// 是否有效
		private var _enable:Boolean;
		
		// 共享静态成员
		private static var sMatrix:Matrix = new Matrix();
		private static var sPoint:Point = new Point();
		
		public function Entity(definition:EntityDefinition)
		{
			_definition = definition;
			x = definition.pos.x;
			y = definition.pos.y;
			_enable = true;
		}
		
		public function get definition():EntityDefinition
		{
			return _definition;
		}
		
		public function set selected(value:Boolean):void
		{
			_selected = value;
		}
		
		public function get selected():Boolean
		{
			return _selected;
		}
		
		public function set enable(value:Boolean):void
		{
			_enable = value;
		}
		
		public function get enable():Boolean
		{
			return _enable;
		}
		
		/**
		 * 基于像素点的碰撞检测
		 * @param	point
		 * @return
		 */
		public function hitTest(point:Point):Boolean
		{
			var bmapData:BitmapData = new BitmapData(1, 1, true, 0x00000000);
			sMatrix.a = this.scaleX;
			sMatrix.tx = -point.x;
			sMatrix.ty = -point.y;
			bmapData.draw(this, sMatrix);
			return bmapData.hitTest(sPoint, 1, sPoint);
		}
		
		public function update():void
		{
			
		}
		
		public function dispose():void
		{
			_definition = null;
		}
	}
}