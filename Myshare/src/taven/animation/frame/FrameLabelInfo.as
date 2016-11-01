package taven.animation.frame
{
	/**
	 * 
	 * @author kramer
	 * 帧标签的描述信息，包括帧名称，起始编号
	 */	
	public class FrameLabelInfo
	{
		public var name:String;
		public var startIndex:uint;
		public var endIndex:uint;
		
		public function FrameLabelInfo(name:String, startIndex:uint, endIndex:uint)
		{
			this.name = name;
			this.startIndex = startIndex;
			this.endIndex = endIndex;
		}
	}
}