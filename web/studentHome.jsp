<%-- 
    Document   : studentHome
    Created on : Dec 7, 2021, 8:11:56 PM
    Author     : hongn
--%>
<%@page import="hust.onlineexam.utils.convertDateTime"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="hust.onlineexam.utils.courseDAO"%>
<%@page import="hust.onlineexam.dbobjects.Course"%>
<%@page import="hust.onlineexam.utils.OnlineExamDAO"%>
<%@page import="java.sql.Connection"%>
<%@page import="hust.onlineexam.dbobjects.TakeExam"%>
<%@page import="hust.onlineexam.utils.MySQLConnUtils"%>
<%@page import="hust.onlineexam.utils.TakeExamDAO"%>
<%@page import="hust.onlineexam.dbobjects.Student"%>
<%@page import="hust.onlineexam.dbobjects.Exam"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Student user = (Student) request.getSession().getAttribute("user");
    if (user != null) {
        request.setAttribute("user", user);
    }
    Connection conn = MySQLConnUtils.getSQLServerConnection();
    List<TakeExam> takeExams = TakeExamDAO.getAllTakeExam(conn, user.getStd_id());
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "sql" uri = "http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>HUST Online Exams | Home</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
        <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/carousel/">
        <link rel="stylesheet" type="text/css" href="index.css">
        <link rel="stylesheet" type="text/css" href="lecturerHome.css">
    </head>
    <body>

        <!--Navigation Bar-->
        <%@include file="studentNavbar.jsp"%>
        <div class="container" style="padding: 50px; color: #696969;">
            <h2 class="courses-title card-header my-3">Your upcoming exam</h2>
            <div class="row">
                <%
                    if (!takeExams.isEmpty()) {
                        for (TakeExam exam : takeExams) {
                            String examID = exam.getExamID();
                            Exam examinfo = OnlineExamDAO.getExamInfo(conn, examID);
                            Course courseinfo = courseDAO.getCourseInfo(conn, examinfo.getCourse_id());
                %>
                <div class="col-md-3 my-3">
                    <div class="card bg-danger text-white w-100">

                        <div class="card-body">
                            <h5 class="card-title"><b><%=courseinfo.getCourse_id()%></b></h5>
                            <h5 class="card-title"><b><%=courseinfo.getCourse_name()%></b></h5>
                            <h6><%=examinfo.getExam_name()%></h6>
                            <p>Start time: 
                                <%=convertDateTime.datetimeFormater(examinfo.getExam_date_start(), examinfo.getExam_time_start())%></p>
                            <p>Duration: <%=examinfo.getExam_duration()%></p>
                            <div class="mt-3 d-flex justify-content-between">
                                <a class="btn btn-dark" href="SelectExam?id=<%=examID%>">Take exam</a> 
                            </div>
                        </div>
                    </div>
                </div>
                <%
                        }
                    } else {
                        out.println("There is no upcoming exam ");
                    }
                %>

            </div>
        </div>
        <%@include file="footer.jsp"%>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script>window.jQuery || document.write('<script src="../assets/js/vendor/jquery.slim.min.js"><\/script>')</script><script src="../assets/dist/js/bootstrap.bundle.js"></script>


    </body>
</html>
