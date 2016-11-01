package taven.utils
{
	/**
	 * 时间工具类
	 * @author Taven
	 */
	public class TimeUtils 
	{		
		public static function getTimeString2(time:int):String
		{
			var rs:Array = getTimeString(time).split(":") ;
			var day:uint = 0 ;
			var hour:int = rs.shift() ;
			if(hour >= 24)
			{
				while(hour >= 24)
				{
					hour -= 24 ;
					day += 1 ;
				}
				//
				if (hour < 10)
				{
					rs.unshift("0" + hour) ;
				}
				else 
				{
					rs.unshift(hour) ;
				}
				//
				if(day < 10)
				{
					rs.unshift("0" + day) ;
				}
				else
				{
					rs.unshift(day) ;
				}				
			}
			else
			{
				rs.unshift(String(hour)) ;
				rs.unshift("00") ;
			}
			return rs.join(":") ;
		}
		/**
		 * 获取时间显示的字符串
		 * 如果传入时间超过60秒, 即使showM为false仍然会显示分钟
		 * 如果传入时间超过3600秒, 即使showH为false仍然会显示时钟
		 * @param time		时间(秒)
		 * @param showM		是否显示分
		 * @param showH		是否显示时
		 * @return 
		 */
		public static function getTimeString(time:int, showM:Boolean = true, showH:Boolean = true):String
		{
			if (time <= 0)
			{
				if(showH)
				{
					return "00:00:00";
				}
				else
				{
					if(showM)
					{
						return "00:00";
					}
					else
					{
						return "00";
					}
				}
			}
			var hours:int = time / 3600;
			var minutes:int = (time - (hours * 3600)) / 60;
			var seconds:int = time - hours * 3600 - minutes * 60;
			var strTime:String = "";
			if (hours > 0)
			{
				showH = true;
				showM = true;
			}
			
			if (showH)
			{
				strTime += ((hours > 9 ? hours : ("0" + hours)) + ":");
			}
			
			if (showM)
			{
				strTime += ((minutes > 9 ? minutes : ("0" + minutes)) + ":");
			}
			
			strTime += (seconds > 9 ? seconds : ("0" + seconds));
			return strTime;
		}
		
		/**
		 * 获取时间的字符串 时分秒
		 * @param time
		 * @return 
		 */
		public static function getTimeArray(time:int):Array
		{
			var arr:Array = [];
			var hours:int = time / 3600;
			var minutes:int = (time - (hours * 3600)) / 60;
			var seconds:int = time - hours * 3600 - minutes * 60;
			if (hours > 9)
			{
				arr.push(Math.floor(hours / 10), hours % 10); 
			}
			else
			{
				arr.push(0, hours); 
			}
			
			if (minutes > 9)
			{
				arr.push(Math.floor(minutes / 10), minutes % 10); 
			}
			else
			{
				arr.push(0, minutes); 
			}
			
			if (seconds > 9)
			{
				arr.push(Math.floor(seconds / 10), seconds % 10); 
			}
			else
			{
				arr.push(0, seconds); 
			}
			return arr;
		}
		
		/**
		 * 获取时间时钟的字符串
		 * @param time
		 * @return 
		 */
		public static function getTimeHourString(time:int):String
		{
			if (time <= 0)
			{
				return "00";
			}
			var hours:int = time / 3600;
			return (hours > 9 ? hours.toString() : ("0" + hours));
		}
		
		/**
		 * 获取时间分钟的字符串
		 * @param time
		 * @return 
		 * 
		 */
		public static function getTimeMinuteString(time:int):String
		{
			if (time <= 0)
			{
				return "00";
			}
			var hours:int = time / 3600;
			var minutes:int = (time - (hours * 3600)) / 60;
			return (minutes > 9 ? minutes.toString() : ("0" + minutes));
		}
		
		/**
		 * 获取时间秒钟的字符串
		 * @param time
		 * @return 
		 * 
		 */
		public static function getTimeSecondString(time:int):String
		{
			if (time <= 0)
			{
				return "00";
			}
			var hours:int = time / 3600;
			var minutes:int = (time - (hours * 3600)) / 60;
			var seconds:int = time - hours * 3600 - minutes * 60;
			return (seconds > 9 ? seconds.toString() : ("0" + seconds));
		}
		
		/**
		 * 获取日期结构字符串
		 * @param date
		 * @param showY	是否显示年
		 * @param showT	是否显示时间
		 * @return 
		 */
		public static function getDateString(date:Date, showY:Boolean, showT:Boolean):String
		{
			var strDate:String = (date.month + 1) + "月" + date.date + "日";
			if (showY)
			{
				strDate = date.fullYear + "年" + strDate;
			}
			if (showT)
			{
				strDate += " " + (date.hours > 9 ? date.hours : ("0" + date.hours)) + ":" 
							+ (date.minutes > 9 ? date.minutes : ("0" + date.minutes))+ ":" 
							+ (date.seconds > 9 ? date.seconds : ("0" + date.seconds));
			}
			return strDate;
		}
		
		public static function getTimeWeekString(date:Date):String
		{
			var strDate:String = "周";
			switch(date.day)
			{
				case 0:
					strDate += "日";
					break;
				case 1:
					strDate += "一";
					break;
				case 2:
					strDate += "二";
					break;
				case 3:
					strDate += "三";
					break;
				case 4:
					strDate += "四";
					break;
				case 5:
					strDate += "五";
					break;
				case 6:
					strDate += "六";
					break;
				default:
					return "";
			}
			return strDate;
		}
		
	}
}
