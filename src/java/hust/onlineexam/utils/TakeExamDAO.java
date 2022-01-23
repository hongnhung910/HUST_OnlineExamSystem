/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package hust.onlineexam.utils;

/**
 *
 * @author hongn
 */
import hust.onlineexam.dbobjects.Exam;
import hust.onlineexam.dbobjects.TakeExam;
import java.sql.*;
import java.util.*;

public class TakeExamDAO {


    public static List<TakeExam> getAllTakeExam(Connection conn, int stdID) {
        List<TakeExam> take_exam = new ArrayList<>();
        try {

            String sql = "select * from take_exam where stdID=? ";
            

            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setInt(1, stdID);
            
            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                TakeExam row = new TakeExam();
                row.setStdID(rs.getInt("stdID"));
                row.setExamID(rs.getString("examID"));
                row.setTake_examID(rs.getString("take_exam_ID"));
                row.setStartDate(rs.getString("startDate"));
                row.setStartTime(rs.getString("startTime"));
                row.setDuration(rs.getString("duration"));
                row.setStatus(rs.getString("status"));
                row.setGrade(rs.getFloat("grade"));
                take_exam.add(row);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return take_exam;
    }

}
