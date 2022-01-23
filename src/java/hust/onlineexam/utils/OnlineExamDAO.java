/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package hust.onlineexam.utils;

import hust.onlineexam.dbobjects.Exam;
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
public class OnlineExamDAO {
    
    public static Exam getExamInfo(Connection conn, String examID) {
        
        try {
            String sql = "select * from online_exams where examID=? ";
                        PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setString(1, examID);
            
            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                Exam row = new Exam();
                row.setExam_id(rs.getString("examID"));
                row.setExam_name(rs.getString("exam_name"));
                row.setExam_time_start(rs.getString("exam_time_start"));
                row.setExam_date_start(rs.getString("exam_date_start"));
                row.setExam_time_create(rs.getString("exam_time_created"));
                row.setExam_duration(rs.getString("exam_duration"));
                row.setExam_total_question(rs.getInt("total_question"));
                row.setMark_right_answer(rs.getFloat("mark_right_answers"));
                row.setMark_wrong_answer(rs.getFloat("mark_wrong_answers"));
                row.setExam_type(rs.getString("exam_type"));
                row.setCourse_id(rs.getString("courseID"));
                row.setTea_id(rs.getString("teaID"));
                return row;
        
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return null;
    }
    
}
