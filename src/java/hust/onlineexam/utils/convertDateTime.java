/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package hust.onlineexam.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
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

        return newFormat_time.format(time) +", "+ newFormat_date.format(date);
    }
}
