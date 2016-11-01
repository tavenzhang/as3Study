package taven.utils
{
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.media.Sound;
	import flash.system.ApplicationDomain;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	import flash.utils.Endian;
	import flash.utils.getQualifiedClassName;
	
	/**
	 * Loader工具类
	 * @author Taven
	 */
	public class LoaderUtils 
	{
		/**
		 * 从加载器中获取MovieClip 
		 * @param name
		 * @param loader
		 * @return 
		 * 
		 */		
		public static function getMovieClipFromLoader(name:String, loader:Loader):MovieClip
		{
			var r:DisplayObject = getDisplayObjectFromLoader(name, loader);
			return ((r == null) ? null : (r as MovieClip));
		}
		
		/**
		 * 从加载器中获取Sprite
		 * @param name
		 * @param loader
		 * @return 
		 * 
		 */		
		public static function getSpriteFromLoader(name:String, loader:Loader):Sprite
		{
			var r:DisplayObject = getDisplayObjectFromLoader(name, loader);
			return ((r == null) ? null : (r as Sprite));
		}
		
		/**
		 * 从加载器中获取SimpleButton 
		 * @param name
		 * @param loader
		 * @return 
		 * 
		 */		
		public static function getSimpleButtonFromLoader(name:String, loader:Loader):SimpleButton
		{
			var r:DisplayObject = getDisplayObjectFromLoader(name, loader);
			return ((r == null) ? null : (r as SimpleButton));
		}
		
		/**
		 * 从加载器中获取Sound
		 * @param name
		 * @param loader
		 * @return 
		 * 
		 */		
		public static function getSoundFromLoader(name:String, loader:Loader):Sound
		{
			var classReference:Class = getClassFromLoader(name, loader);
			if (classReference != null)
			{
				try
				{
					return new classReference() as Sound;
				}
				catch(e:Error)
				{
					trace("Utils getSoundFromLoader error:" + e.toString());
					return null;
				}
			}
			return null;
		}
		
		/**
		 * 从加载器中获取BitmapData
		 */
		private static var _bmdPacket:Dictionary = new Dictionary(true);
		public static function getBitmapDataFromLoader(name:String, loader:Loader,isCache:Boolean = false):BitmapData
		{
			if (_bmdPacket[name])
			{
				return _bmdPacket[name];
			}
			//
			var bmd:BitmapData;
			var classReference:Class = getClassFromLoader(name, loader);
			if (classReference)
			{
				try
				{
					bmd = new classReference(0, 0) as BitmapData;
				}
				catch(e:Error)
				{
					trace("Utils getBitmapDataFromLoader error:" + e.toString());
				}
			}
			else
			{
				return null;
			}
			if(isCache)
			{
				if (bmd)
				{
					_bmdPacket[name] = bmd;
				}
			}
			return bmd;
		}
		
		/**
		 * 从加载器中获取Class
		 * @param name
		 * @param loader
		 * @return 
		 * 
		 */		
		public static function getClassFromLoader(name:String, loader:Loader):Class
		{
			var app:ApplicationDomain = loader.contentLoaderInfo.applicationDomain;
			if(app.hasDefinition(name))
			{
				return app.getDefinition(name) as Class;
			}
			return null;
		}
		
		/**
		 * 从加载器中获取DisplayObject
		 * @param name
		 * @param loader
		 * @return 
		 * 
		 */		
		public static function getDisplayObjectFromLoader(name:String, loader:Loader):DisplayObject
		{
			var classReference:Class = getClassFromLoader(name, loader);
			if (classReference != null)
			{
				return new classReference() as DisplayObject;
			}
			return null;
		}
		
		/**
		 * 获取类
		 * @param mc
		 * @param name
		 * @return 
		 * 
		 */
		public static function getClass(mc:MovieClip, name:String):Class
		{
			if (mc.loaderInfo.applicationDomain.hasDefinition(name))
			{
				return mc.loaderInfo.applicationDomain.getDefinition(name) as Class;
			}
			return null;
		}
		
		/**
		 * 获取实例化的对象
		 * @param mc
		 * @param name
		 * @return 
		 * 
		 */
		public static function getObject(mc:MovieClip, name:String):Object
		{
			var objectClass:Class = getClass(mc, name);
			if (objectClass)
			{
				return new objectClass();
			}
			return null;
		}
		
		/**
		 * 返回 DisplayObject 指定的类的类
		 * @param obj
		 * @return 
		 * 
		 */		
		public static function getClassByObject(obj:DisplayObject):Class
		{
			try
			{
				var mcs:Class = getClassFromLoader(getQualifiedClassName(obj), obj.loaderInfo.loader)as Class;
			}
			catch(e:Error)
			{
				trace("getClass " + obj.toString() + "error" + e.message);
				return null;
			}
			return mcs;
		}
		
		/**
		 * 从舞台某对象实例化新对象
		 * @param mc
		 * @param name
		 * @return 
		 */
		public static function getObjectFromStage(mc:MovieClip, name:String):Object
		{
			var child:DisplayObject = mc.getChildByName(name);
			if (child)
			{
				var className:String = getQualifiedClassName(child);
				var objClass:Class = getClass(mc, className);
				if (objClass)
				{
					return new objClass();
				}
			}
			return null;
		}
		
		/**
		 *获取loader的内容的Class
		 * @param loader
		 * @return Class
		 */
		public static function getLoaderClass(loader:Loader):Class
		{
			return loader.contentLoaderInfo.applicationDomain.getDefinition(getQualifiedClassName(loader.content)) as Class;
		}
		
		public static function getClassName(obj:Object):String
		{
			var name:String = getQualifiedClassName(obj);
			var index:int = name.indexOf("::");
			if(index != -1)
			{
				name = name.substr(index + 2);
			}
			return name;
		}
	}
}
