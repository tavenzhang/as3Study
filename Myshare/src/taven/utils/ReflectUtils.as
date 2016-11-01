package taven.utils
{
	import flash.utils.describeType;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;

	/**
	 * 反射工具类
	 * @author Taven
	 */
	public class ReflectUtils
	{
		/**
		 * 确定某类是否继承某超类
		 * @param type
		 * @param superType
		 * @return 
		 * 
		 */
		public static function typeImplements(type:Class, superType:Class):Boolean
		{
			if (type == superType)
			{
				return true;
			}
			
			var factoryDescription:XML = describeType(type).factory[0];
			return (factoryDescription.children().(
				name() == "implementsInterface" || name() == "extendsClass").(
				attribute("type") == getQualifiedClassName(superType)).length() > 0);
		}
		
		public static function getClass(name:String):Class
		{
			var classReference:Class;
			try
			{
				classReference = getDefinitionByName(name) as Class;
			}
			catch (e:Error)
			{
				return null;
			}
			return classReference;
		}
	}
}