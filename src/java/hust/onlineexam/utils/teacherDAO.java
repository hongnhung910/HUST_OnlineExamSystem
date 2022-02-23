/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package hust.onlineexam.utils;

import hust.onlineexam.dbobjects.TakeExam;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author hongn
 */
public class teacherDAO {

    public static List<String> getCoursebyTeacher(Connection conn, String teacherID) {
        List<String> listcourses = new ArrayList<>();
        try {

            String sql = "select * from teachers where teaID=? ";

            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setString(1, teacherID);

            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                String courses = rs.getString("courses");
                String[] list = courses.split(",");
                return ArrayToListConversion(list);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return listcourses;

    }

    public static <T> List<T> ArrayToListConversion(T array[]) {
//creating the constructor of the List class  
        List<T> list = new ArrayList<>();
//using for-each loop to iterate over the array  
        for (T t : array) {
//adding each element to the List  
            list.add(t);
        }
//returns the list converted into Array  
        return list;
    }
}
