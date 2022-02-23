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
    public static List<Exam> getExambyTeacher(Connection conn, String teaID, String courseID){
        List<Exam> listExam = new ArrayList<>();
        try {
            String sql = "select * from online_exams where teaID=? and courseID=?";
                        PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setString(1, teaID);
            pstm.setString(2, courseID);
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
                listExam.add(row);    
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return listExam;
    }
       public static boolean insertExam(Connection conn, String examID, String exam_name, String exam_time_start,
                    String exam_duration, int total_ques, float mark_correct, float mark_incorrect,
                    String courseID, String teacherID,String exam_date_start) {
        boolean result = false;
        try {
            String query = "insert into online_exams (examID, exam_name, exam_time_start, exam_duration, total_question,"
                    + "mark_right_answers, mark_wrong_answers, exam_type, exam_time_created, courseID, teaID, exam_date_start) "
                    + "values('"+examID+"' , '"+exam_name+"', '"+exam_time_start+"',"
                    + "'"+exam_duration+"',"+total_ques+","+mark_correct+","+mark_incorrect+","
                    + "'TN',NULL,'"+courseID+"','"+teacherID+"','"+exam_date_start+"')";
            
            //String query = "replace into take_exam (take_exam_ID, examID, stdID, grade, status) values(?,?,?,?,?)";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.executeUpdate();
            result = true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;
    }
    
}
