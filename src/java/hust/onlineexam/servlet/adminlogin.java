
package hust.onlineexam.servlet;

import hust.onlineexam.dbobjects.Teacher;
import hust.onlineexam.utils.DBUtils;
import hust.onlineexam.utils.MySQLConnUtils;
import hust.onlineexam.utils.MyUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "adminlogin", urlPatterns = {"/adminlogin"})
public class adminlogin extends HttpServlet {

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
             out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>HUST</title>");            
            out.println("</head>");
            out.println("<body>");
            String email = request.getParameter("admin_email");
            String pass = request.getParameter("admin_pass");
            System.out.println("LOGIN INFO: email-"+email+"; pass-"+pass);
            Teacher user = null;
            boolean hasError = false;
            String errorString = null;
                
            if (email == null || pass == null || email.length() == 0 || pass.length() == 0) {
                hasError = true;
                errorString = "Required email and password!";
            } else {
                Connection conn = MySQLConnUtils.getSQLServerConnection();
                try {
                    // Find the user in the DB.
                    user = DBUtils.findTeacher(conn, email, pass);

                    if (user == null) {
                        hasError = true;
                        errorString = "Email or password invalid";
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                    hasError = true;
                    errorString = e.getMessage();
                }
            }
            
            if (hasError) {
                user = new Teacher();
                user.setTea_email(email);
                user.setTea_password(pass);

                // Store information in request attribute, before forward.
                request.setAttribute("err", errorString);
                RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
                
                dispatcher.forward(request, response);
            } else {
                errorString = "";
                HttpSession session = request.getSession();
                request.getSession().setAttribute("user", user);
                request.setAttribute("err", errorString);
                MyUtils.storeLoginedTeacher(session, user);
                
                // Redirect to userInfo page.
                response.sendRedirect("lecturerHome.jsp");
            }
            out.println("</body>"); out.println("</html>");

        } catch(Exception e) {
             
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
