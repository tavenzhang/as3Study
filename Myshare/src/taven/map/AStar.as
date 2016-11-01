package taven.map
{
	import flash.geom.Point;
	import flash.utils.Dictionary;

	/**
	 * A*寻路 二叉堆 taven
	 */
	public class AStar
	{
		/**
		 *  一个点周围的8个点列表，p.add(aroundsData[i])这样获取
		 */
		public static const aroundsData:Array=[new Point(1, 0), new Point(0, 1), new Point(-1, 0), new Point(0, -1), new Point(1, 1), new Point(-1, 1), new Point(-1, -1), new Point(1, -1)];
		/**
		 * 单例
		 */
		private static var _instance:AStar;

		/**
		 * 开始寻找路径
		 * @param p_start 开始点
		 * @param p_end   终点
		 * isGridCaoody 是否是格子坐标，如果是格子坐标 无需转换
		 * @return        路径数组
		 *
		 */
		public static function find(p_start:Point, p_end:Point,isGridCaoody:Boolean=false):Array
		{
			return instance._find(p_start, p_end,isGridCaoody);
		}

		//--------------------------------------------------
		// public static function
		//--------------------------------------------------

		/**
		 * 初始化寻路数据
		 * @param mapModel 地图模型
		 * @param maxTry   最大寻路步数
		 *
		 */
		public static function init(mapModel:IMapModel, maxTry:int=1000):void
		{
			instance._mapModel=mapModel;
			instance._maxTry=maxTry;
		}

		/**
		 * 获取当前设置的最大寻路步数，限制超时返回
		 * @return
		 *
		 */
		public static function get maxTry():int
		{
			return instance._maxTry;
		}

		private static function get instance():AStar
		{
			if (_instance == null)
			{
				_instance=new AStar();
			}
			return _instance;
		}

		//--------------------------------------------------
		// Constructor
		//--------------------------------------------------

		public function AStar()
		{
		}

		//斜向移动一格的路径评分
		private const COST_DIAGONAL:int=14;

		//横或竖向移动一格的路径评分
		private const COST_STRAIGHT:int=10;
		//(单个)节点数组 是否在关闭列表中 索引
		private const NOTE_CLOSED:int=2;
		//(单个)节点数组 节点ID 索引
//		private const NOTE_ID:int=0;
		//(单个)节点数组 是否在开启列表中 索引
		private const NOTE_OPEN:int=1;
		//节点的父节点(ID)列表
		//(从起点移动到)节点的移动耗费列表
		private var _gCostList:Array;

		//地图模型
		private var _mapModel:IMapModel;

		//最大寻路步数，限制超时返回
		private var _maxTry:int;
		//节点坐标列表
		//private var _nodeList:Array;

		//节点(数组)地图,根据节点坐标记录节点开启关闭状态和ID
		//开放列表长度
		//private var _openCount:int;
		//节点加入开放列表时分配的唯一ID(从0开始)
		//根据此ID(从下面的列表中)存取节点数据

		//开放列表，存放节点ID
		//节点路径评分列表
		//private var _pathScoreList:Array;

		//--------------------------------------------------
		// public function
		//--------------------------------------------------
		private var _openLeng:int=0;
		private var _newOpenList:Array;
		//节点路径评分列表  当前节点
		private var _curNode:AstarNode;

		private var _mapDataDic:Dictionary;
		
		private var _nodeDic:Dictionary;
	
		private var _nodeNum:int =0;
		/**
		 * 开始寻路
		 *
		 * @param p_start		起点坐标
		 * @param p_end 		终点坐标
		 * @return 				找到的路径(数组 : [Point], ... )
		 */
		private function _find(p_start:Point, p_end:Point,isGridCaoody:Boolean=false):Array
		{
			if (_mapModel == null)
			{
				return null;
			}
			p_start=isGridCaoody? p_start:transPoint(p_start);
			var endPos:Point=isGridCaoody? p_end.clone():transPoint(p_end.clone());
			if (!isCanMove(endPos))
			{
				return null;
			}
		
			initLists();
			addOpenNote(p_start, 0, 0, 0);
			var currTry:int=0;
			var currNoteP:Point;

			var g:int;
			var f:int;
			while (_openLeng>0)
			{
				//超时返回
				if (++currTry > _maxTry)
				{
					destroyLists();
					return null;
				}
				//每次取出开放列表最前面的ID
				_curNode=_newOpenList[0];
				//将编码为此ID的元素列入关闭列表
				closeNote(_curNode);
				currNoteP=_curNode.point;
				//如果终点被放入关闭列表寻路结束，返回路径
				if (endPos.equals(currNoteP))
				{
					return getPath(p_start, _curNode);
				}
				//获取周围节点，排除不可通过和已在关闭列表中的
				var aroundNotes:Array=getArounds(currNoteP);
				//对于周围的每一个节点
				for each (var note:Point in aroundNotes)
				{
					//计算F和G值
					g=_curNode.g + ((note.x == currNoteP.x || note.y == currNoteP.y) ? COST_STRAIGHT : COST_DIAGONAL);
					f=g + (Math.abs(endPos.x - note.x) + Math.abs(endPos.y - note.y)) * COST_STRAIGHT;

					var nodeItem:AstarNode=  getNodeByPoint(note);
					if (nodeItem) //如果节点已在播放列表中
					{
						//如果新的G值比节点原来的G值小,修改F,G值，换父节点
						if (g < nodeItem.g)
						{
							nodeItem.g=g;
							nodeItem.f=f;
							nodeItem.pId=_curNode.nodeIdex;
							aheadNote(_newOpenList.indexOf(nodeItem) + 1); // _newOpenList.indexOf(checkingId) + 1
						}
					}
					else //如果节点不在开放列表中
					{
						//将节点放入开放列表
						addOpenNote(note, f, g,  _curNode.nodeIdex);
					}
				}
			}
			//开放列表已空，找不到路径
			destroyLists();
			return null;
		}

		/**
		 * @private
		 * 将(新加入开放别表或修改了路径评分的) 节点向前移动     只需要比较当前节点 到根节点的大小,保证第一个依然是最小
		 */
		private function aheadNote(p_index:int):void
		{
			var father:int;
			var changeNode:AstarNode;
			while (p_index > 1)
			{
				//父节点的位置
				father=int(p_index / 2);
				//如果该节点的F值小于父节点的F值则和父节点交换
				if (getF(p_index) < getF(father))
				{
					changeNode=_newOpenList[p_index - 1];
					_newOpenList[p_index - 1]=_newOpenList[father - 1];
					_newOpenList[father - 1]=changeNode;
					p_index=father;
				}
				else
				{
					break;
				}
			}
		}

		/**
		 * @private 以二叉树 方式 排列  二叉树排序
		 * 将(取出开启列表中路径评分最低的节点后从队尾移到最前的)节点向后移动  删除一个元素之后  重头开始整理排序
		 */
		private function backNote():void
		{
			//尾部的节点被移到最前面
			var checkIndex:int=1;
			var tmp:int;
			var changeNode:AstarNode;
			var _openCount:int = _newOpenList.length;
			while (true)
			{
				tmp=checkIndex;

				//如果有子节点
				if (2 * tmp <= _openCount)
				{

					//如果子节点的F值更小
					if (getF(checkIndex) > getF(2 * tmp))
					{
						//记节点的新位置为子节点位置
						checkIndex=2 * tmp;
					}

					//如果有两个子节点
					if (2 * tmp + 1 <= _openCount)
					{

						//如果第二个子节点F值更小
						if (getF(checkIndex) > getF(2 * tmp + 1))
						{
							//更新节点新位置为第二个子节点位置
							checkIndex=2 * tmp + 1;
						}
					}
				}

				//如果节点位置没有更新结束排序
				if (tmp == checkIndex)
				{
					break;
				}
				//反之和新位置交换，继续和新位置的子节点比较F值
				else
				{
					changeNode=_newOpenList[tmp - 1];
					_newOpenList[tmp - 1]=_newOpenList[checkIndex - 1];
					_newOpenList[checkIndex - 1]=changeNode;
				}
			}
		}

		/**
		 * @private
		 * 将节点加入关闭列表
		 */
		private function closeNote(node:AstarNode):void
		{
			_openLeng--;
			node.isClose=true;
			_newOpenList[0]=_newOpenList.pop(); //将最后一个放置到第一个 可以用于重新排序
			backNote();
		}

		/**
		 * @private
		 * 销毁数组
		 */
		private function destroyLists():void
		{
			_newOpenList.length=0;
			_openLeng =0;
		}

		/**
		 * 还原数据内容
		 */
		private function eachArray(element:Point, index:int, arr:Array):void
		{
			element.x*=_mapModel.gridSize;
			element.y*=_mapModel.gridSize;
		}

		/**
		 * @private
		 * 获取某节点的周围节点，排除不能通过和已在关闭列表中的
		 */
		private function getArounds(p:Point):Array
		{
			var arr:Array=[];
			var checkP:Point;
			var canDiagonal:Boolean;
			var i:int=0;

			//右
			checkP=p.add(aroundsData[i]);
			i++;
			var canRight:Boolean=isCanMove(checkP);
			
			if (canRight && !isClosed(checkP))
			{
				arr.push(checkP);
			}
			//下
			checkP=p.add(aroundsData[i]);
			i++;
			var canDown:Boolean=isCanMove(checkP);

			if (canDown && !isClosed(checkP))
			{
				arr.push(checkP);
			}

			//左
			checkP=p.add(aroundsData[i]);
			i++;
			var canLeft:Boolean=isCanMove(checkP);

			if (canLeft && !isClosed(checkP))
			{
				arr.push(checkP);
			}
			//上
			checkP=p.add(aroundsData[i]);
			i++;
			var canUp:Boolean=isCanMove(checkP);

			if (canUp && !isClosed(checkP))
			{
				arr.push(checkP);
			}
			//右下
			checkP=p.add(aroundsData[i]);
			i++;
			canDiagonal=isCanMove(checkP);

			if (canDiagonal && canRight && canDown && !isClosed(checkP))
			{
				arr.push(checkP);
			}
			//左下
			checkP=p.add(aroundsData[i]);
			i++;
			canDiagonal=isCanMove(checkP);

			if (canDiagonal && canLeft && canDown && !isClosed(checkP))
			{
				arr.push(checkP);
			}
			//左上
			checkP=p.add(aroundsData[i]);
			i++;
			canDiagonal=isCanMove(checkP);

			if (canDiagonal && canLeft && canUp && !isClosed(checkP))
			{
				arr.push(checkP);
			}
			//右上
			checkP=p.add(aroundsData[i]);
			i++;
			canDiagonal=isCanMove(checkP);

			if (canDiagonal && canRight && canUp && !isClosed(checkP))
			{
				arr.push(checkP);
			}

			return arr;
		}

		/**
		 * @private
		 * 获取某节点的路径评分
		 *
		 * @param p_index	节点在开启列表中的索引(从1开始)
		 */
		private function getF(p_index:int):int
		{
			return (_newOpenList[p_index-1] as AstarNode).f;
		}
		/**
		 * @private
		 * 获取路径
		 * @param p_start	起始点坐标
		 * @param p_id		终点的ID
		 * @return 			路径坐标(Point)数组
		 */
		private function getPath(p_start:Point, lastNode:AstarNode):Array
		{
			var arr:Array=[];
			//var lastNode:AstarNode = _nodeDic[p_id] as AstarNode;
			//var startNode:AstarNode = getNodeByPoint(p_start);
			var noteP:Point=  lastNode.point;
			while (!p_start.equals(noteP))
			{
				arr.push(noteP);
				lastNode = _nodeDic[lastNode.pId];//父级递归
				noteP =lastNode.point;
				//trace("lastNodeId =" +lastNode.pId )
				//trace("lastNode =" +lastNode)
			}
			arr.push(p_start);
			destroyLists();
			arr.reverse();
			//优化路径
			optimize(arr);
			arr.forEach(eachArray);
			return arr;
		}

		/**
		 * @private
		 * 初始化数组
		 */
		private function initLists():void
		{
			_newOpenList=[];
			_nodeDic = new Dictionary();
			_nodeNum =0;
		}

		/**
		 * 是否可行走  非障碍
		 * @param p	坐标
		 * @return
		 */
		private function isCanMove(p:Point):Boolean
		{
			if (p.x < 0 || p.x >= _mapModel.gridX || p.y < 0 || p.y >= _mapModel.gridY)
			{
				return false;
			}
			return _mapModel.data[p.x][p.y]==0;
		}

		/**
		 * @private
		 * 判断某节点是否在关闭列表中
		 */
		private function isClosed(p:Point):Boolean
		{
			var node:AstarNode =getNodeByPoint(p);
			return node&&node.isClose;
		}

		/**
		 * @private
		 * 判断某节点是否在开放列表
		 */
		private function isOpen(p:Point):Boolean
		{
			var node:AstarNode =getNodeByPoint(p);
			return node&&node.isOpen;
		}
		
		private function getNodeByPoint(p:Point):AstarNode
		{
			return  _nodeDic[p.x+"_"+p.y] as AstarNode;
		}

		//--------------------------------------------------
		// private function
		//--------------------------------------------------

		/**
		 * @private
		 * 将节点加入开放列表
		 *
		 * @param p		节点在地图中的x y坐标
		 * @param P_score	节点的路径评分
		 * @param p_cost	起始点到节点的移动成本
		 * @param p_fatherId	父节点
		 */
		private function addOpenNote(p:Point, p_score:int, p_cost:int, p_fatherId:int):AstarNode
		{
			//新添加
			_nodeNum++;
			_openLeng++;
			var node:AstarNode=new AstarNode(p, p_score, p_cost, p_fatherId,_nodeNum);
			_newOpenList.push(node);
			node.isOpen=true;
			_nodeDic[p.x+"_"+p.y] = node;
			_nodeDic[node.nodeIdex] = node;
			//对插入数据进行二叉树 排序
			aheadNote(_newOpenList.length);
			return node;
		}

		/**
		 * 优化寻路路径 （寻直走点，消减能直走点之间的点）
		 * @param arr
		 * @param index
		 */
		private function optimize(arr:Array, index:int=0):void
		{
			if (arr == null)
			{
				return;
			}

			var _nLen:int=arr.length - 1;

			if (_nLen < 2)
			{
				return;
			}

			var p1:Point=arr[index];
			var p2:Point;
			var dis:int;
			var angle:Number;
			var newArr:Array=[];
			for (var i:int=_nLen; i > index; i--)
			{
				p2=arr[i];
				dis=Point.distance(p1, p2);
				angle=Math.atan2(p2.y - p1.y, p2.x - p1.x);

				for (var c:int=1; c < dis; c++)
				{
					var checkP:Point=p1.add(Point.polar(c, angle));
					checkP.x=int(checkP.x);
					checkP.y=int(checkP.y);
					if (_mapModel.data[checkP.x][checkP.y])
					{
						newArr.push(checkP);
					}
					else
					{
						newArr=[];
						break;
					}
				}
				var w:int=newArr.length;
				if (w > 0)
				{
					arr.splice(index + 1, i - index - 1);
					index+=w - 1;
					break;
				}
			}
			if (index < _nLen)
			{
				optimize(arr, ++index);
			}
		}

		private function transPoint(p:Point):Point
		{
			p.x=int(p.x / _mapModel.gridSize); //按比例缩放
			p.y=int(p.y / _mapModel.gridSize);
			return p;
		}
	}
}
