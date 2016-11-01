package taven.camera
{
	/**
	 * 
	 * @author kramer
	 * 可以被摄像头跟踪的对象必须实现的接口
	 */	
	public interface ICameraTarget
	{
		function get x():Number;
		function get y():Number;
	}
}