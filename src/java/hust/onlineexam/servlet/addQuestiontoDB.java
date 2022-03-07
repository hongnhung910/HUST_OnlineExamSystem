/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package hust.onlineexam.servlet;

import hust.onlineexam.dbobjects.Teacher;
import hust.onlineexam.utils.MySQLConnUtils;
import hust.onlineexam.utils.QuestionsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "addQuestiontoDB", urlPatterns = {"/addQuestiontoDB"})
public class addQuestiontoDB extends HttpServlet {

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
        request.setCharacterEncoding("utf-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession(false);
            Teacher user= (Teacher) session.getAttribute("user");
            String examID= (String) session.getAttribute("examID");
            String ques_title = request.getParameter("ques_title");
            String ans1 = request.getParameter("ans1");
            String ans2 = request.getParameter("ans2");
            String ans3 = request.getParameter("ans3");
            String ans4 = request.getParameter("ans4");
            
            
            int ans_correct = Integer.parseInt(request.getParameter("ans_correct"));
            boolean addQuestion = false;
            Connection conn;
            try {
                conn = MySQLConnUtils.getSQLServerConnection();
                int numofQuestion = QuestionsDAO.getNumofQuestions(conn, examID);
                numofQuestion=numofQuestion+1;
                String quesID = examID+"_"+String.valueOf(numofQuestion);
                addQuestion = QuestionsDAO.insertQuestion(conn, examID, quesID, ques_title, ans1, ans2, ans3, ans4, ans_correct);
                response.sendRedirect("addQuestion.jsp");
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(addQuestiontoDB.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(addQuestiontoDB.class.getName()).log(Level.SEVERE, null, ex);
            }
           
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
