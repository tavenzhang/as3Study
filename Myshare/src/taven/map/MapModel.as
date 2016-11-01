package taven.map
{
	import taven.utils.DisplayUtils;
	
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.EventDispatcher;
	import flash.geom.Matrix;
	
	/**
	 * 地图资源类
	 * @author Taven 
	 */	
	public class MapModel extends EventDispatcher implements IMapModel
	{
		// 格子大小
		public static const GridSize:int = 10;
		
		private var _mapView:MovieClip;
		private var _far:Sprite;
		private var _ground:Sprite;
		private var _content:Sprite;
		private var _front:Sprite;
		private var _size:Sprite; 		
		private var _path:Sprite;
		private var _movieView:MovieClip;
		
		// 地图宽
		private var _width:int;
		// 地图高
		private var _height:int;
		// 地图横向格子数
		private var _horizontalGridNum:uint;
		// 地图纵向格数
		private var _verticalGridNum:uint;
		// 地图总格数
		private var _gridTotal:uint;
		// 路径数据
		private var _pathData:Array;
		
		public function MapModel(mapView:MovieClip)
		{
			super(this);
			_mapView = mapView;
			
			_movieView = new MovieClip();
			_movieView.x = _movieView.y = 0;
			_mapView.addChild(_movieView);

			_ground = _mapView["ground_mc"];
			_ground.mouseChildren = false;
			DisplayUtils.disableNonameChildren(_ground);
			
			_far = _mapView["far_mc"];
			_far.mouseEnabled = false;
			DisplayUtils.disableNonameChildren(_far);
			
			_content = _mapView["content_mc"];
			DisplayUtils.disableNonameChildren(_content);
			
			_front= _mapView["front_mc"];
			_front.mouseEnabled = false;
			DisplayUtils.disableNonameChildren(_front);
			
//			_path = _mapView["path_mc"];
//			_path.mouseEnabled = false;
//			
//			_size = _mapView["size_mc"];
//			_width = _size.width;
//			_height = _size.height;
//			_size.mouseEnabled = false;
//
//			var scaleRatio:Number = 1 / GridSize;
//			_path.scaleX = scaleRatio;
//			_path.scaleY = scaleRatio;
//			_horizontalGridNum = _path.width;
//			_verticalGridNum = _path.height;
//			_gridTotal = _horizontalGridNum * _verticalGridNum;
//			var pathBitmapData:BitmapData = new BitmapData(_path.width, _path.height, true, 0x00ffffff);
//			pathBitmapData.draw(_path, new Matrix(scaleRatio, 0, 0, scaleRatio));
//			
//			_pathData = new Array(_horizontalGridNum);
//			for(var i:int = 0; i < _horizontalGridNum; i++)
//			{
//				_pathData[i] = new Array(_verticalGridNum);
//				for(var j:int = 0; j < _verticalGridNum; j++)
//				{
//					_pathData[i][j] = (pathBitmapData.getPixel32(i, j) == 0);
//				}
//			}
//			pathBitmapData.dispose();
			
			refreshPath();
		}
		
		public function refreshPath():void
		{
			_path = _mapView["path_mc"];
			_path.mouseEnabled = false;
			
			_size = _mapView["size_mc"];
			_width = _size.width;
			_height = _size.height;
			_size.mouseEnabled = false;
			
			var scaleRatio:Number = 1 / GridSize;
			_path.scaleX = scaleRatio;
			_path.scaleY = scaleRatio;
			_horizontalGridNum = _path.width;
			_verticalGridNum = _path.height;
			_gridTotal = _horizontalGridNum * _verticalGridNum;
			var pathBitmapData:BitmapData = new BitmapData(_path.width, _path.height, true, 0x00ffffff);
			pathBitmapData.draw(_path, new Matrix(scaleRatio, 0, 0, scaleRatio));
			
			_pathData = new Array(_horizontalGridNum);
			for(var i:int = 0; i < _horizontalGridNum; i++)
			{
				_pathData[i] = new Array(_verticalGridNum);
				for(var j:int = 0; j < _verticalGridNum; j++)
				{
					_pathData[i][j] = (pathBitmapData.getPixel32(i, j) == 0);
				}
			}
			pathBitmapData.dispose();
		}
		
		public function isBlock(x:int, y:int):Boolean
		{
			x = int(x / GridSize);
			y = int(y / GridSize);
			if (_pathData[x])
			{
				return _pathData[x][y] != 0;
			}
			return false;
		}
		
		public function get mapView():MovieClip
		{
			return _mapView;
		}
		
		public function get front():Sprite
		{
			return _front;
		}
		
		public function get content():Sprite
		{
			return _content;
		}
		
		public function get ground():Sprite
		{
			return _ground;
		}
		
		public function get far():Sprite
		{
			return _far;
		}
		
		public function get path():Sprite
		{
			return _path;
		}
		
		public function get movieView():MovieClip
		{
			return _movieView;
		}

		public function get width():int
		{
			return _width;
		}

		public function get height():int
		{
			return _height;
		}

		public function get data():Array
		{
			return _pathData;
		}
		
		public function get gridSize():uint
		{
			return GridSize;
		}
		
		public function get gridX():uint
		{
			return _horizontalGridNum;
		}
		
		public function get gridY():uint
		{
			return _verticalGridNum;
		}

		public function dispose():void
		{
			_ground = null;
			_far = null;
			_content = null;
			_front = null;
			_path = null;
			_size = null;
			_pathData.length = 0;
		}
	}
}