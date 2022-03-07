<%-- 
    Document   : addQuestion
    Created on : Feb 23, 2022, 7:19:52 PM
    Author     : hongn
--%>

<%@page import="hust.onlineexam.dbobjects.Teacher"%>
<%@page import="hust.onlineexam.utils.courseDAO"%>
<%@page import="hust.onlineexam.dbobjects.Course"%>
<%@page import="hust.onlineexam.utils.convertDateTime"%>
<%@page import="hust.onlineexam.utils.MySQLConnUtils"%>
<%@page import="hust.onlineexam.utils.OnlineExamDAO"%>
<%@page import="hust.onlineexam.dbobjects.Exam"%>
<%@page import="hust.onlineexam.dbobjects.Student"%>
<%@page import="hust.onlineexam.dbobjects.Question"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%
    Teacher user = (Teacher) request.getSession().getAttribute("user");
    String courseID = (String) request.getSession().getAttribute("courseID");
    Connection conn = MySQLConnUtils.getSQLServerConnection();
    Course courseInfo = courseDAO.getCourseInfo(conn, courseID);
    if (user != null) {
        request.setAttribute("user", user);
        request.setAttribute("courseID", courseID);
    }
%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1252">
        <meta HTTP-EQUIV="Content-language" CONTENT="vi">
        <title>HUST Online Exams | Create Exam</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
        <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
        <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/carousel/">
        <link rel="stylesheet" type="text/css" href="index.css">
        <link rel="stylesheet" type="text/css" href="lecturerHome.css">
    </head>
    <style>
        body {
            background: #cc0000;
            background: -webkit-linear-gradient(to top, #b30000, #cc0000);
            background: linear-gradient(to top, #b30000, #cc0000);
        }
        .container {
            max-width: 550px;
        }
        .has-error label,
        .has-error input,
        .has-error textarea {
            color: red;
            border-color: red;
        }
        .list-unstyled li {
            font-size: 13px;
            padding: 4px 0 0;
            color: red;
        }

    </style>
    <body>
        <!--Navigation Bar-->
        <%@include file="adminnavbar.jsp"%>
        <div class="container mt-5">
            <div class="card" style="margin-top:100px;">
                <h5 class="card-header text-center font-weight-bold"><%=courseID%> - <%=courseInfo.getCourse_name()%></h5>
                <div class="card-body">
                    <form role="form" action="addQuestiontoDB" method="post">

                        <div class="form-group">
                            <label>Câu hỏi</label>
                            <textarea class="form-control" name="ques_title" placeholder="Nội dung câu hỏi" required=""></textarea>
                        </div>
                        <div class="form-group">
                            <label>Đáp án 1</label>
                            <input type="text" class="form-control" name="ans1" required>

                        </div>
                        <div class="form-group">
                            <label>Đáp án 2</label>
                            <input type="text" class="form-control" name="ans2" required>
                            <!-- Error -->
                            <div class="help-block with-errors"></div>
                        </div>
                        <div class="form-group">
                            <label>Đáp án 3</label>
                            <input type="text" class="form-control" name="ans3" required>
                        </div>
                        <div class="form-group">
                            <label>Đáp án 4</label>
                            <input type="text" class="form-control" name="ans4" required>
                        </div>

                        <div class="form-group">
                            <label>Đáp án đúng</label>
                            <div class="form-group">
                                <input type="number" class="form-control" name="ans_correct"  min="1" max="4" required />

                            </div>
                        </div>

                        <div class="form-group">
                            <button type="submit" class="btn btn-dark btn-block">ADD</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>