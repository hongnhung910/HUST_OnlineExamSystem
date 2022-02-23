<%-- 
    Document   : lecturerHome
    Author     : hongn
--%>
<%@page import="hust.onlineexam.utils.teacherDAO"%>
<%@page import="hust.onlineexam.utils.MySQLConnUtils"%>
<%@page import="hust.onlineexam.dbobjects.Teacher"%>
<%@page import="hust.onlineexam.utils.convertDateTime"%>
<%@page import="hust.onlineexam.utils.OnlineExamDAO"%>
<%@page import="hust.onlineexam.dbobjects.Exam"%>
<%@page import="hust.onlineexam.utils.courseDAO"%>
<%@page import="hust.onlineexam.dbobjects.Course"%>
<%@page import="hust.onlineexam.utils.TakeExamDAO"%>
<%@page import="java.util.List"%>
<%@page import="hust.onlineexam.dbobjects.TakeExam"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Teacher user = (Teacher) request.getSession().getAttribute("user");
    if (user != null) {
        request.setAttribute("user", user);
    }

    Connection conn = MySQLConnUtils.getSQLServerConnection();
    List<String> courses = teacherDAO.getCoursebyTeacher(conn, user.getTea_id());
    System.out.println("Courses by this teacher " + courses);
%>
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
        <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
        <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/carousel/">
        <link rel="stylesheet" type="text/css" href="index.css">
        <link rel="stylesheet" type="text/css" href="lecturerHome.css">
    </head>
    <style>
        .exams-container {
            width: 100%;
            font-family: roboto;
        }
        .exam-chapter {
            display: block;
            cursor: pointer;
        }
        .exam {
            background-color: #F7F8FA;
            display: block;
            padding: 10px;
            color: #000;
        }
        .exam:hover {
            text-decoration: none;
        }
        .exam-chapter {
            border: 2px solid #D3D3D3;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: beige;
        }
        .exam-exam {
            border: 0.1px solid #dfdede;

        }
        .show {
            display: flex;
        }
        .exam-exam .exam-icon {
            color: seagreen;
            margin: 4px;
        }
        .exam-exam .exam-title {
            font-size: 20px;
            opacity: 0.9;
        }
        .courses-title {
            margin: 100px auto 16px;
            text-align: center;
            font-weight: bold;
            color:dimgray;
        }
        .exam-title {
            margin: 0;
        }
        .exem-description {
            margin: 0;
            opacity: 0.7;
        }
        .exam-icon {
            font-size: 20px;
            display: block;
        }
        html, body {
            height: 100%;
        }
        body {
            display: flex;
            flex-direction: column;
        }
        .content {
            flex: 1 0 auto;
        }
        .footer {
            flex-shrink: 0;
        }
    </style>
    <body style="padding-bottom: 0;">
        <!--Navigation Bar-->
        <%@include file="adminnavbar.jsp"%>
        
        <div class="content"> 
            <h1 class="courses-title">Courses and Exams </h1>
            <div class="courses-container">
                <div class="exams-container">
                    <%
                        if (!courses.isEmpty()) {
                            for (String course : courses) {
                                Course courseInfo = courseDAO.getCourseInfo(conn, course);       
                                String courseID = courseInfo.getCourse_id();
                                List<Exam> listExams = OnlineExamDAO.getExambyTeacher(conn, user.getTea_id(), courseID);
                    %>
                    <div class="exam-item">
                        <div class="exam exam-chapter">
                            <div class="exam-info">
                                <h3 class="exam-title"><%=course%> - <%= courseInfo.getCourse_name()%></h3>
                                <p class="exem-description"></p>
                            </div>
                                <a class="btn btn-dark" href="createExam?id=<%=courseID%>">Add Exam</a>
                            
                        </div>
                        <%
                            if (!listExams.isEmpty()) {
                                for (Exam exam : listExams) {
                        %>

                        <a href="./entranceExam.html" class="exam exam-exam" target="_blank">
                            <div class="exam-info">
                                <h3 class="exam-title" style="margin-left: 30px;"><%=exam.getExam_name() %></h3>
                                <p class="exem-description"></p>
                            </div>
                        </a>
                        <%
                                }
                            }
                        %>
                    </div>
                    <%
                            }
                        }
                    %>

                </div>
            </div>
        </div>
        <%@include file="footer.jsp"%>


    </body>
</html>

