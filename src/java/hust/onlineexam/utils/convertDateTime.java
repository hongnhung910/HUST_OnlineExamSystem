/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package hust.onlineexam.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.temporal.ChronoUnit;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author hongn
 */
public class convertDateTime {

    public static String datetimeFormater(String inputdate, String inputtime) throws ParseException {

        SimpleDateFormat oldFormat_date = new SimpleDateFormat("yyyy-MM-dd");
        Date date = oldFormat_date.parse(inputdate);
        SimpleDateFormat newFormat_date = new SimpleDateFormat("dd/MM/yyyy");

        SimpleDateFormat oldFormat_time = new SimpleDateFormat("hh:mm:ss");
        Date time = oldFormat_time.parse(inputtime);
        SimpleDateFormat newFormat_time = new SimpleDateFormat("hh.mm aa");

        return newFormat_time.format(time) + ", " + newFormat_date.format(date);
    }

    public static String dateFormater(String inputdate) throws ParseException {

        SimpleDateFormat oldFormat_date = new SimpleDateFormat("yyyy-MM-dd");
        Date date = oldFormat_date.parse(inputdate);
        SimpleDateFormat newFormat_date = new SimpleDateFormat("dd/MM/yyyy");
        return newFormat_date.format(date);
    }

    public static String timeFormater(String inputtime) throws ParseException {

        SimpleDateFormat oldFormat_time = new SimpleDateFormat("hh:mm:ss");
        Date time = oldFormat_time.parse(inputtime);
        SimpleDateFormat newFormat_time = new SimpleDateFormat("hh:mm aa");

        return newFormat_time.format(time);
    }

    public static String durationFormater(String inputtime) throws ParseException {

        double minutes = 0;
        String[] split = inputtime.split(":");

        minutes += Double.parseDouble(split[0]) * 60;
        minutes += Double.parseDouble(split[1]);
        minutes += Double.parseDouble(split[2]) / 60;
        return String.valueOf((int) minutes) + " phút";
    }
    

    public static String calculate_Endtime(String start, String duration) throws ParseException {
        SimpleDateFormat timeformat = new SimpleDateFormat("hh:mm:ss");
        Date startTime = timeformat.parse(start);
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(startTime);
        
        
        int minutes = 0;
        String[] split = duration.split(":");

        minutes += Integer.parseInt(split[0]) * 60;
        minutes += Integer.parseInt(split[1]);
        minutes += Integer.parseInt(split[2]) / 60;

        calendar.add(Calendar.MINUTE, minutes);

        SimpleDateFormat newFormat_time = new SimpleDateFormat("hh:mm aa");
        return newFormat_time.format(calendar.getTime());
    }
    public static String Endtime(String start, String duration) throws ParseException {
        SimpleDateFormat timeformat = new SimpleDateFormat("hh:mm:ss");
        Date startTime = timeformat.parse(start);
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(startTime);
        
        
        int minutes = 0;
        String[] split = duration.split(":");

        minutes += Integer.parseInt(split[0]) * 60;
        minutes += Integer.parseInt(split[1]);
        minutes += Integer.parseInt(split[2]) / 60;

        calendar.add(Calendar.MINUTE, minutes);

        return timeformat.format(calendar.getTime());
    }
}
