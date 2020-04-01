package util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class TimeUtil 
{
	public static String getCurrentTime()
	{
		Calendar calendar = Calendar.getInstance();
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH)+1;
		int day = calendar.get(Calendar.DATE);
		String time = String.valueOf(year)+"-"+String.valueOf(month)+"-"+String.valueOf(day);
		return time;
	}

	public static String getTimeIncludingMinute(){
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy:MM:dd HH:mm ");
		Date date = new Date(System.currentTimeMillis());
		return simpleDateFormat.format(date);

	}
}
