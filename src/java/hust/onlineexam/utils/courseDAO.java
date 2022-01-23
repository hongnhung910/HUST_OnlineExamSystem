/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package hust.onlineexam.utils;

import hust.onlineexam.dbobjects.Course;
import hust.onlineexam.dbobjects.Exam;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author hongn
 */
public class courseDAO {
    public static Course getCourseInfo(Connection conn, String courseID) {
        
        try {
            String sql = "select * from courses where courseID=? ";
                        PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setString(1, courseID);
            
            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                Course row = new Course();
                row.setCourse_id(rs.getString("courseID"));
                row.setCourse_name(rs.getString("courseName"));
                
                return row;
        
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return null;
    }
    
}
