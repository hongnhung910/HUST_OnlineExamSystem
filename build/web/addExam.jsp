<%-- 
    Document   : addExam
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
                    <form role="form" action="addExamtoDB" method="post">

                        <div class="form-group">
                            <label>Tên bài thi</label>
                            <input type="text" class="form-control" name="examName" required>
                            <!-- Error -->
                            <div class="help-block with-errors"></div>
                        </div>
                        <div class="form-group">
                            <label>Mã bài thi</label>
                            <input type="text" class="form-control" name="examID" placeholder="<%=courseID%>_" required>

                        </div>
                        <div class="form-group">
                            <label>Ngày thi</label>
                            <input type="date" class="form-control" name="examDateStart" required>
                            <!-- Error -->
                            <div class="help-block with-errors"></div>
                        </div>
                        <div class="form-group">
                            <label>Thời gian bắt đầu</label>
                            <input type="time" class="form-control" name="examTimeStart" required>
                            <!-- Error -->
                            <div class="help-block with-errors"></div>
                        </div>
                        <div class="form-group">
                            <label>Thời gian làm bài</label>
                            <div class="form-control" style="display: inline-flex;">
                                <input type="number" min="0" max="23" placeholder="01" name="hourDuration" style="border: none; color: #555; text-align: center;"> giờ :
                                <input type="number" min="0" max="59" placeholder="00" name="minDuration" style="border: none; color: #555; text-align: center;"> phút
                            </div>
                            <!--<input type="time" class="form-control" id="" required>
                             Error -->
                            <div class="help-block with-errors"></div>
                        </div>

                        <div class="form-group">
                            <label>Số câu hỏi trong đề thi</label>
                            <div class="form-group">
                                <input type="number" class="form-control" name="num_ques" required />

                            </div>
                        </div>
                        <div class="form-group">
                            <label>Điểm cho mỗi câu đúng</label>
                            <div class="form-group">
                                <input type="number" class="form-control" name="mark_correct" required /> 
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Điểm trừ cho mỗi câu sai</label>
                            <div class="form-group">
                                <input type="number" class="form-control" name="mark_incorrect" required />

                            </div>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-dark btn-block">Tạo thư viện câu hỏi</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
