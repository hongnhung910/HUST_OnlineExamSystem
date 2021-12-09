/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import db_objects.Student;
import db_objects.Teacher;
import java.sql.*;

/**
 *
 * @author hongn
 */
public class DBUtils {

    public static Student findStudent(Connection conn, //
            String email, String password) throws SQLException {

        String sql = "SELECT * FROM students WHERE email = ? and password = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, email);
        pstm.setString(2, password);
        ResultSet rs = pstm.executeQuery();

        if (rs.next()) {
            int std_id = rs.getInt("std_id");
            String std_name = rs.getString("std_name");
            String std_DOB = rs.getString("std_dateofbirth");
            String std_phone = rs.getString("std_phone");
            String std_gender = rs.getString("std_gender");

            Student user = new Student();
            user.setStd_email(email);
            user.setStd_password(password);
            user.setStd_id(std_id);
            user.setStd_name(std_name);
            user.setStd_DOB(std_DOB);
            user.setStd_phone(std_phone);
            user.setStd_gender(std_gender);
            
            return user;
        }
        return null;
    }
    
    public static Teacher findTeacher(Connection conn, //
            String email, String password) throws SQLException {

        String sql = "SELECT * FROM teachers WHERE email = ? and password = ?";

        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, email);
        pstm.setString(2, password);
        ResultSet rs = pstm.executeQuery();

        if (rs.next()) {

            int tea_id = rs.getInt("tea_id");
            String tea_name = rs.getString("tea_name");
            String tea_phone = rs.getString("tea_phone");
            
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
