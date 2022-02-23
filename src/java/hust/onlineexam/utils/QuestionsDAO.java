/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package hust.onlineexam.utils;

import hust.onlineexam.dbobjects.Exam;
import hust.onlineexam.dbobjects.Question;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author hongn
 */
public class QuestionsDAO {

    
    private static String query;
    private static PreparedStatement pst;
    private static ResultSet rs;

    public static ArrayList<Question> list_questions(Connection conn, String exam_id) {
        ArrayList<Question> list = new ArrayList<>();
        try {
            OnlineExamDAO examDAO = new OnlineExamDAO();
            Exam exam = examDAO.getExamInfo(conn, exam_id);
            int num_questions = exam.getExam_total_question();
            query = "select * from exam_question_bank where examID=? order by rand () limit 5";
            pst = conn.prepareStatement(query);
            pst.setString(1, exam_id);
            //pst.setInt(2, num_questions);
            rs = pst.executeQuery();
            while (rs.next()) {
                Question ques = new Question();
                ques.setQues_id(rs.getString("quesID"));
                ques.setExam_id(exam_id);
                ques.setQues_title(rs.getString("ques_title"));
                ques.setAns_choice1(rs.getString("ans_choice1"));
                ques.setAns_choice2(rs.getString("ans_choice2"));
                ques.setAns_choice3(rs.getString("ans_choice3"));
                ques.setAns_choice4(rs.getString("ans_choice4"));
                ques.setAns_correct(rs.getInt("ans_correct"));
                list.add(ques);
                        }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return list;
    }

}
