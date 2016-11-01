package taven.utils
{
	/**
	 * 动态脚本解释工具
	 * @author Taven
	 */
	public class ScriptUtils
	{
		/**
		 * 对一个对象与脚本文本进行执行, 无返回
		 * @param target
		 * @param script
		 */
		public static function doVoidScript(target:*, script:String):void
		{
			var scriptList:Array = script.split(";");
			for (var i:int = 0; i < scriptList.length; i++)
			{
				script = StringUtils.replace(scriptList[i], " ", "");
				var leftBracketIndex:int = script.indexOf("(");
				var rightBracketIndex:int = script.indexOf(")");
				if (leftBracketIndex != -1 && rightBracketIndex != -1)
				{
					if (leftBracketIndex + 1 == rightBracketIndex)
					{
						script = script.substr(0, leftBracketIndex);
						if (i < scriptList.length - 1)
						{
							target = target[script]();
						}
						else
						{
							target[script]();
						}
					}
					else
					{
						var args:String = script.substr(leftBracketIndex + 1, rightBracketIndex - leftBracketIndex - 1);
						script = script.substr(0, leftBracketIndex);
						if (i < scriptList.length - 1)
						{
							target = target[script].apply(null, args.split(","));
						}
						else
						{
							target[script].apply(null, args.split(","));
						}
					}
				}
				else
				{
					if (i < scriptList.length - 1)
					{
						target = target[script];
					}
					else
					{
						target[script];
					}
				}
				
				if (target == null)
				{
					return;
				}
			}
		}
		
		/**
		 * 对一个对象与脚本文本进行执行, 有返回
		 * @param target
		 * @param script
		 * @return 
		 */
		public static function doReturnScript(target:*, script:String):*
		{
			var scriptList:Array = script.split(";");
			for (var i:int = 0; i < scriptList.length; i++)
			{
				script = StringUtils.replace(scriptList[i], " ", "");
				var leftBracketIndex:int = script.indexOf("(");
				var rightBracketIndex:int = script.indexOf(")");
				if (leftBracketIndex != -1 && rightBracketIndex != -1)
				{
					if (leftBracketIndex + 1 == rightBracketIndex)
					{
						script = script.substr(0, leftBracketIndex);
						if (i < scriptList.length - 1)
						{
							target = target[script]();
						}
						else
						{
							return target[script]();
						}
					}
					else
					{
						var args:String = script.substr(leftBracketIndex + 1, rightBracketIndex - leftBracketIndex - 1);
						script = script.substr(0, leftBracketIndex);
						if (i < scriptList.length - 1)
						{
							target = target[script].apply(null, args.split(","));
						}
						else
						{
							return target[script].apply(null, args.split(","));
						}
					}
				}
				else
				{
					if (i < scriptList.length - 1)
					{
						target = target[script];
					}
					else
					{
						return target[script];
					}
				}
				
				if (target == null)
				{
					return target;
				}
			}
			return null;
		}
	}
}