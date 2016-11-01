package taven.manager
{
	import flash.display.DisplayObject;

	public interface ITipsCreator
	{
		function getView(args:*):DisplayObject;
	}
}