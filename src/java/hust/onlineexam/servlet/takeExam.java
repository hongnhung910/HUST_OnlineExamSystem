/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package hust.onlineexam.servlet;

import hust.onlineexam.dbobjects.Exam;
import hust.onlineexam.dbobjects.Student;
import hust.onlineexam.utils.MySQLConnUtils;
import hust.onlineexam.utils.OnlineExamDAO;
import hust.onlineexam.utils.TakeExamDAO;
import hust.onlineexam.utils.UpdateQuery;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hongn
 */
@WebServlet(name = "takeExam", urlPatterns = {"/takeExam"})
public class takeExam extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()){
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>HUST Online Exams</title>");
            out.println("</head>");
            out.println("<body>");
            int correct=0;
            HttpSession session = request.getSession(false);
            Student user = (Student) session.getAttribute("user");
            String exam_id = (String) session.getAttribute("exam_id");
            String take_exam_id = exam_id+"_"+String.valueOf(user.getStd_id());
            request.setAttribute("take_exam_id",take_exam_id);
            Connection conn = MySQLConnUtils.getSQLServerConnection();
            Exam exam = OnlineExamDAO.getExamInfo(conn, exam_id);
            int num_ques = (int) exam.getExam_total_question();
            
            System.out.print("Num of questions: "+ num_ques);
            for (int i = 2; i <= num_ques+1; i++) {
                String ques_id = request.getParameter("question" + i + "_id");
                int option = Integer.parseInt(request.getParameter("question" + i + "_option"));  
                System.out.println("Option: "+option);
                TakeExamDAO.insertResultExam(conn, take_exam_id, ques_id, option);
                String query = "select ans_correct from exam_question_bank where quesID=?";
                PreparedStatement pst = conn.prepareStatement(query);
                pst.setString(1, ques_id);
                ResultSet correct_ans = pst.executeQuery();

                if (correct_ans.next()) {
                    request.setAttribute("question" + i + "_option", option);
                    request.setAttribute("question" + i + "_id", ques_id);
                    request.setAttribute("question" + i + "_correct_ans", correct_ans.getInt(1));
                    System.out.print("Correct Answer is: " + correct_ans.getInt(1));
                    if (option == correct_ans.getInt(1)) {
                        correct++;
                        request.setAttribute("question" + i + "_correct", "true");
                    } else {
                        request.setAttribute("question" + i + "_correct", "false");
                    }
                }
            }
            float grade = correct*(float)exam.getMark_right_answer();
            System.out.print("Mark :"+correct);
            request.getSession().setAttribute("correct_answers",correct);
            
            boolean i = TakeExamDAO.insertTakeExam(conn,exam,user.getStd_id(),grade); 
            
            if (i==true){
                //response.sendRedirect("studentHome.jsp");
                response.sendRedirect("resultExam.jsp");
            } else {
                System.out.println("takeExam.java [Error] SQLError");
            }
            
            out.println("</body>"); out.println("</html>");
        } catch (Exception e) {
            System.out.println("takeExam.java [Error] Exception");
            e.printStackTrace();
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
