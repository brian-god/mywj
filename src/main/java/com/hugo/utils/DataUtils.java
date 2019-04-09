package com.hugo.utils;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by online on 2017/1/1.
 */
public class DataUtils {
    public static String getTodayTime() {
        Date date = new Date();
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String todayTime = format.format(date);
        return todayTime;
    }

    public static Date getNeedTime(int hour, int minute, int second, int addDay, int... args){
        Calendar calendar = Calendar.getInstance();
        if(addDay != 0){
            calendar.add(Calendar.DATE,addDay);
        }
        calendar.set(Calendar.HOUR_OF_DAY,hour);
        calendar.set(Calendar.MINUTE,minute);
        calendar.set(Calendar.SECOND,second);
        if(args.length==1){
            calendar.set(Calendar.MILLISECOND,args[0]);
        }
        return calendar.getTime();
    }
}
