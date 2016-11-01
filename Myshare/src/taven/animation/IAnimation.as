package taven.animation
{
	/**
	 * 动画接口，FramePlayer实现了该接口
	 * @author kramer
	 */	
	public interface IAnimation
	{
		function get totalFrameNum():uint;
		function get currentFrameIndex():uint;
		function get currentFrameLabel():String;
		
		function play():void;
		function stop():void;
		
		function gotoAndPlay(frameIndex:uint):void;
		function gotoAndStop(frameIndex:uint):void;
		
		function hasLabel(label:String):Boolean;
		function gotoLabel(label:String):void;
			
		function update():void;
		function dispose():void;
	}
}