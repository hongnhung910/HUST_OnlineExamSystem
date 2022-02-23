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
import hust.onlineexam.dbobjects.ResultExam;
import hust.onlineexam.dbobjects.TakeExam;
import java.sql.*;
import java.util.*;

public class TakeExamDAO {

    public static TakeExam getTakeExam(Connection conn, String take_exam_id) {
        TakeExam row = new TakeExam();
        try {
            String sql = "select * from take_exam where take_exam_ID=? ";
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setString(1, take_exam_id);

            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                row = new TakeExam();
                row.setStdID(rs.getInt("stdID"));
                row.setExamID(rs.getString("examID"));
                row.setTake_examID(rs.getString("take_exam_ID"));
                row.setSubmitTime(rs.getString("submitTime"));
                row.setStartTime(rs.getString("startTime"));
                row.setStatus(rs.getString("status"));
                row.setGrade(rs.getFloat("grade"));
                return row;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return row;
    }

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
                row.setSubmitTime(rs.getString("submitTime"));
                row.setStartTime(rs.getString("startTime"));
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

    public static boolean insertTakeExam(Connection conn, Exam exam, int stdID, float grade) {
        boolean result = false;
        try {

            String query = "replace into take_exam (take_exam_ID, examID, stdID, grade, status) values(?,?,?,?,?)";
            PreparedStatement pst = conn.prepareStatement(query);
            String take_exam_ID = String.valueOf(exam.getExam_id()) + "_" + stdID;
            pst.setString(1, take_exam_ID);
            pst.setString(2, exam.getExam_id());
            pst.setInt(3, stdID);
            pst.setFloat(4, grade);
            pst.setString(5, "0");
            pst.executeUpdate();
            result = true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;
    }

    public static List<TakeExam> getDoneExam(Connection conn, int stdID) {
        List<TakeExam> take_exam = new ArrayList<>();
        try {

            String sql = "select * from take_exam where stdID=? and status='1'";

            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setInt(1, stdID);

            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                TakeExam row = new TakeExam();
                row.setStdID(rs.getInt("stdID"));
                row.setExamID(rs.getString("examID"));
                row.setTake_examID(rs.getString("take_exam_ID"));
                row.setSubmitTime(rs.getString("submitTime"));
                row.setStartTime(rs.getString("startTime"));
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

    public static List<TakeExam> getComingExam(Connection conn, int stdID) {
        List<TakeExam> take_exam = new ArrayList<>();
        try {

            String sql = "select * from take_exam where stdID=? and status='0'";

            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setInt(1, stdID);

            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                TakeExam row = new TakeExam();
                row.setStdID(rs.getInt("stdID"));
                row.setExamID(rs.getString("examID"));
                row.setTake_examID(rs.getString("take_exam_ID"));
                row.setSubmitTime(rs.getString("submitTime"));
                row.setStartTime(rs.getString("startTime"));
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

    public static void insertResultExam(Connection conn, String take_exam_id, String quesID, int std_choice) {

        try {
            boolean result = false;
            String query = "replace into result_exam (take_exam_ID, result_exam_ID, quesID, std_choice) values(?,?,?,?)";
            PreparedStatement pst = conn.prepareStatement(query);
            String result_exam_id = "re_" + take_exam_id;
            pst.setString(1, take_exam_id);
            pst.setString(2, result_exam_id);
            pst.setString(3, quesID);
            pst.setInt(4, std_choice);
            pst.executeUpdate();
            result = true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

    }

    public static int getStudentChoice(Connection conn, String take_exam_id, String ques_id) {
        int std_choice = 1;
        try {

            String sql = "select * from result_exam where take_exam_ID=? and quesID=?";

            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setString(1, take_exam_id);
            pstm.setString(2, ques_id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                System.out.println("Student Choice: " + rs.getInt("std_choice"));
                return rs.getInt("std_choice");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return std_choice;
    }
}
