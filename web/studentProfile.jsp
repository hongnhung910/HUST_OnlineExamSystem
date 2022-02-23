<%-- 
    Document   : studentProfile
    Created on : Jan 18, 2022, 7:18:25 PM
    Author     : hongn
--%>

<%@page import="hust.onlineexam.utils.convertDateTime"%>
<%@page import="hust.onlineexam.utils.OnlineExamDAO"%>
<%@page import="hust.onlineexam.dbobjects.Exam"%>
<%@page import="hust.onlineexam.utils.courseDAO"%>
<%@page import="hust.onlineexam.dbobjects.Course"%>
<%@page import="hust.onlineexam.utils.TakeExamDAO"%>
<%@page import="hust.onlineexam.utils.MySQLConnUtils"%>
<%@page import="java.util.List"%>
<%@page import="hust.onlineexam.dbobjects.TakeExam"%>
<%@page import="java.sql.Connection"%>
<%@page import="hust.onlineexam.dbobjects.Student"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<%
    Student user = (Student) request.getSession().getAttribute("user");
    if (user != null) {
        request.setAttribute("user", user);
    }

    Connection conn = MySQLConnUtils.getSQLServerConnection();
    List<TakeExam> takeExams = TakeExamDAO.getDoneExam(conn, user.getStd_id());

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Profile</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
        <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/carousel/">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;500&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="./index.css">
        <link rel="stylesheet" href="./studentInfor.css">
        <link rel="stylesheet" href="./takeExam.css">
        

    </head>
   <body style="padding-bottom: 0;">
        <header>
            <!--Navigation Bar-->
            <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-light">
                <img src="logoEn.png">

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="#" style="color: #696969; font-size: 18px">${user.getStd_name()}</a>
                        </li>
                        <li class="nav-item">
                            <img src="iconsfemale.jpg" alt="" class="exam-student-avt" style="margin-right: 30px;">
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="studentHome.jsp" style="color: #696969; font-size: 18px; margin-right: 30px;"><b>Courses</b></a>
                        </li>

                        <li class="nav-item" style="background-color:#2C9CDB; border-radius: 5px; padding-left: 10px; padding-right: 10px;">
                            <a class="nav-link" href="index.jsp" style="color: #fff; font-size: 18px">Logout</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>

        <div id="content-container"  style="color: #696969; margin: 50px 50px 50px 50px;">
            
            <h1 id="student-title" class="exam-course-name" style="padding: 50px;">Thông tin sinh viên</h1>

            <div class="exam-question" id="personal-infor">
                <button type="button" class="btn btn-secondary float-right" >Đổi mật khẩu</button>
                <h2 class="personal-infor-title infor-title">Thông tin cá nhân</h2>
                <div class="personal-infor-content">
                    <div class="infor-content-col1">
                        <img src="iconsfemale.jpg" alt="Profile" class="content-col1-avt" style="width: 200px;height: 200px; margin-left: 50px; border-radius: 50%;">
                    
                    </div>
                    <div class="infor-content-col3">
                        <div class="content-col3-row">Họ và tên : <%=user.getStd_name()%></div>
                        <div class="content-col3-row">MSSV : <%=user.getStd_id()%></div>
                        <div class="content-col3-row">Khoa/Viện quản lý : Viện <%=user.getStd_faculty()%></div>
                        <div class="content-col3-row">Lớp : <%=user.getStd_class()%></div>
                    </div>
                    <div class="infor-content-col3" style="margin-right: 50px;">
                        <div class="content-col3-row">Giới tính : <%=user.getStd_gender()%></div>
                        <div class="content-col3-row">Ngày sinh : <%=convertDateTime.dateFormater(user.getStd_DOB())%></div>
                        <div class="content-col3-row">Email : <%=user.getStd_email()%></div>
                        <div class="content-col3-row">Số điện thoại : <%=user.getStd_phone()%></div>
                    </div>
                    

                </div>   
            </div>

            <div class="exam-question" id="courses-infor">
                <h2 class="courses-infor-title infor-title">Kết quả các bài thi</h2>
                <table class="table table-ligh table-hover courses-infor-content">
                    <thead class="thead-light">
                        <tr>
                            <th scope="col">Mã học phần</th>
                            <th scope="col">Tên học phần</th>
                            <th scope="col">Bài kiểm tra</th>
                            <th scope="col">Ngày thi</th>
                            <th scope="col">Điểm số</th>

                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (!takeExams.isEmpty()) {
                                for (TakeExam exam : takeExams) {
                                    String examID = exam.getExamID();
                                    Exam examinfo = OnlineExamDAO.getExamInfo(conn, examID);
                                    Course courseinfo = courseDAO.getCourseInfo(conn, examinfo.getCourse_id());

                        %>
                        <tr>
                            <td><%=examinfo.getCourse_id().toUpperCase()%></td>
                            <td><%=courseinfo.getCourse_name()%></td>
                            <td><%=examinfo.getExam_name()%></td>
                            <td><%=convertDateTime.datetimeFormater(examinfo.getExam_date_start(), examinfo.getExam_time_start())%></td>
                            <td><%=exam.getGrade()%></td>
                        </tr>
                        <%
                                }
                            } else {
                                out.println("There is no completed exam ");
                            }
                        %>


                    </tbody>
                </table>
            </div>

        </div>

        <jsp:include page="footer.jsp"/>

    </body>
</html>
