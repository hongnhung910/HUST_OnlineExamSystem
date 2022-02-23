/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package hust.onlineexam.utils;

import hust.onlineexam.dbobjects.Student;
import hust.onlineexam.dbobjects.Teacher;
import java.sql.*;

/**
 *
 * @author hongn
 */
public class DBUtils {

    public static Student findStudent(Connection conn, //
            String email, String password) throws SQLException {

        String sql = "SELECT * FROM students WHERE std_email = ? and std_password = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, email);
        pstm.setString(2, password);
        ResultSet rs = pstm.executeQuery();

        if (rs.next()) {
            int std_id = rs.getInt("stdID");
            String std_name = rs.getString("std_name");
            String std_DOB = rs.getString("std_dateofbirth");
            String std_phone = rs.getString("std_phone");
            String std_gender = rs.getString("std_gender");
            String std_faculty = rs.getString("std_faculty");
            String std_class = rs.getString("std_class");
            
            Student user = new Student();
            user.setStd_email(email);
            user.setStd_password(password);
            user.setStd_id(std_id);
            user.setStd_name(std_name);
            user.setStd_DOB(std_DOB);
            user.setStd_phone(std_phone);
            user.setStd_gender(std_gender);
            user.setStd_faculty(std_faculty);
            user.setStd_class(std_class);
                    
            return user;
        }
        return null;
    }
    
    public static Teacher findTeacher(Connection conn, //
            String email, String password) throws SQLException {

        String sql = "SELECT * FROM teachers WHERE teaEmail = ? and teaPassword = ?";

        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, email);
        pstm.setString(2, password);
        ResultSet rs = pstm.executeQuery();

        if (rs.next()) {

            String tea_id = rs.getString("teaID");
            String tea_name = rs.getString("teaName");
            String tea_phone = rs.getString("teaPhone");
            System.out.println("TEACHER NAME: "+ tea_name);
            Teacher user = new Teacher();
            user.setTea_email(email);
            user.setTea_password(password);
            user.setTea_id(tea_id);
            user.setTea_name(tea_name);
            user.setTea_phone(tea_phone);
            
            return user;
        }
        return null;
    }

}
