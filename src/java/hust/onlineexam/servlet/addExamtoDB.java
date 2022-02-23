/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package hust.onlineexam.servlet;

import hust.onlineexam.dbobjects.Teacher;
import hust.onlineexam.utils.MySQLConnUtils;
import hust.onlineexam.utils.OnlineExamDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "addExamtoDB", urlPatterns = {"/addExamtoDB"})
public class addExamtoDB extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession(false);
            Teacher user= (Teacher) session.getAttribute("user");
            String teaID = user.getTea_id();
            String exam_name = request.getParameter("examName");
            String exam_time_start = request.getParameter("examTimeStart");
            String exam_date_start = request.getParameter("examDateStart");;
            String exam_duration = request.getParameter("hourDuration") + ":" + request.getParameter("minDuration") + ":00";
            int total_ques = Integer.parseInt(request.getParameter("num_ques"));
            float mark_correct = Float.parseFloat(request.getParameter("mark_correct"));
            float mark_incorrect = Float.parseFloat(request.getParameter("mark_incorrect"));;
            String examID = request.getParameter("examID");;       
            String courseID = (String) session.getAttribute("courseID");;
            boolean addExam = false;
            try {
                Connection conn = MySQLConnUtils.getSQLServerConnection();
                addExam = OnlineExamDAO.insertExam(conn, examID, exam_name, exam_time_start, exam_duration, total_ques, mark_correct, mark_incorrect, courseID, teaID, exam_date_start);
            
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(addExamtoDB.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(addExamtoDB.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet addExamtoDB</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Information " + exam_name + "</h1>");
            out.println("<h1>Information " + exam_time_start + "</h1>");
            out.println("<h1>Information " + exam_date_start + "</h1>");
            out.println("<h1>Information " + exam_duration + "</h1>");
            out.println("<h1>Add to database " + addExam + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
