package hust.onlineexam.servlet;

import hust.onlineexam.dbobjects.Student;
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
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import static jdk.internal.util.StaticProperty.userName;

@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>HUST Online Exams</title>");
            out.println("</head>");
            out.println("<body>");
            String email = request.getParameter("email");
            String pass = request.getParameter("pass");

            Student user = null;
            boolean hasError = false;
            String errorString = null;

            if (email == null || pass == null || email.length() == 0 || pass.length() == 0) {
                hasError = true;
                errorString = "Required email and password!";
            } else {
                Connection conn = MySQLConnUtils.getSQLServerConnection();
                try {
                    // Find the user in the DB.
                    user = DBUtils.findStudent(conn, email, pass);

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
                user = new Student();
                user.setStd_email(email);
                user.setStd_password(pass);

                // Store information in request attribute, before forward.
                request.setAttribute("err", errorString);
                RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
                
                dispatcher.forward(request, response);
            } else {
                errorString = "";
                HttpSession session = request.getSession();
                request.getSession().setAttribute("user", user);
                request.setAttribute("err", errorString);
                MyUtils.storeLoginedStudent(session, user);
                
                // Redirect to userInfo page.
                response.sendRedirect("studentHome.jsp");
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
        }
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
