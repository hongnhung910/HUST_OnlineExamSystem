<%-- 
    Document   : takeExam
    Created on : Jan 19, 2022, 5:23:53 AM
    Author     : hongn
--%>

<%@page import="hust.onlineexam.utils.courseDAO"%>
<%@page import="hust.onlineexam.dbobjects.Course"%>
<%@page import="hust.onlineexam.utils.convertDateTime"%>
<%@page import="hust.onlineexam.utils.MySQLConnUtils"%>
<%@page import="hust.onlineexam.utils.OnlineExamDAO"%>
<%@page import="hust.onlineexam.dbobjects.Exam"%>
<%@page import="hust.onlineexam.dbobjects.Student"%>
<%@page import="hust.onlineexam.dbobjects.Question"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%
    Student user = (Student) request.getSession().getAttribute("user");
    if (user != null) {
        request.setAttribute("user", user);
    }

    ArrayList<Question> question_list = (ArrayList<Question>) session.getAttribute("question-list");
    String exam_id = (String) session.getAttribute("exam_id");
    Exam exam = OnlineExamDAO.getExamInfo(MySQLConnUtils.getSQLServerConnection(), exam_id);
    Course course = courseDAO.getCourseInfo(MySQLConnUtils.getSQLServerConnection(), exam.getCourse_id());
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>HUST Online Exams | <%=(exam.getExam_id().toUpperCase())%></title>
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
        <link rel="stylesheet" type="text/css" href="./lecturerHome.css">
        <link rel="stylesheet" href="./courseInside.css">
        <link rel="stylesheet" href="./entranceExam.css">
        <link rel="stylesheet" href="./takeExam.css">
    </head>

    <c:set var="selectedexam" value="${param.selectedexam}" scope="session" />
    <body style="padding: 0;">
        <div class="body-section"  style="color: black;">
            <nav class="nav-left">
                <button class="btn exit-btn btn-danger">
                    <a class="submit-link" href="./studentHome.jsp">Exit the exam</a>
                </button>
                <div class="static-items">
                    <p id="MyClockDisplay" class="clock"></p>
                    <button class="btn submit-btn btn-primary">
                        <a class="submit-link" href="#" onclick="grading(key)">Submit</a>
                    </button>
                </div>
            </nav>
            <div class="content-container">
                <div class="exam-header">
                    <img class="logo exam-logo" src="logoEn.png">
                    <div class="exam-student">
                        <div class="exam-student-name"><%=user.getStd_name()%></div>
                        <img src="./iconsfemale.jpg" alt="" class="exam-student-avt">
                        <button class="btn btn-primary exam-student-logout">
                            <a class="submit-link" href="./login.jsp">Logout</a>
                        </button>
                    </div>
                </div>


                <br/><br/><br/>    
                <form action="evaluate" method="POST">

                    <div class="exam-info">
                        <div class="exam-course-name">
                            <%=course.getCourse_name().toUpperCase()%> (<%=exam.getCourse_id().toUpperCase()%>) </div>
                        <div class="exam-test-name"><%=exam.getExam_name()%></div>
                        <div  id="exam-date" class="exam-test-date" style="font-size: 1.8rem;">
                            Ngày thi: <%=convertDateTime.dateFormater(exam.getExam_date_start())%></div>
                        <div class="exam-test-info">
                            <div id="start" class="test-info-start">
                                Thời gian bắt đầu: <%=convertDateTime.timeFormater(exam.getExam_time_start())%> 
                            </div>
                            <div id="dur" class="test-info-time">
                                Thời gian làm bài: <%=convertDateTime.durationFormater(exam.getExam_duration())%></div>

                            <div id="due" class="test-info-due">
                                Thời gian kết thúc: <%=convertDateTime.calculate_Endtime(exam.getExam_time_start(), exam.getExam_duration())%></div>
                        </div>
                    </div>

                    <%
                        if (question_list != null) {
                            int quescount = 1;
                            for (Question q : question_list) {
                    %>

                    <div class="form-group exam-question exam-question-radio" style="margin:20px;">
                        <label class="col-lg-2 control-label question-tag">Question <%=quescount%></label>
                        <% quescount = quescount + 1;%>
                        <div class="col-lg-10 text-left">
                            <input type="hidden" value="<%=q.getQues_id()%>" name="question<%=quescount%>_id">
                            <h5 class="question-content"><%=q.getQues_title()%></h5>

                            <div class="exam-question-answer">
                                <div class="answer-box">
                                    <input type="hidden" name="question<%=quescount%>_option" required="required" value="1">A</div>
                                <div class="answer-content"><%=q.getAns_choice1()%> </div>
                            </div>
                            <div class="exam-question-answer">
                                <div class="answer-box">
                                    <input type="hidden" name="question<%=quescount%>_option" required="required" value="2">B</div>
                                <div class="answer-content"><%=q.getAns_choice2()%></div>
                            </div>
                            <div class="exam-question-answer">
                                <div class="answer-box">
                                    <input type="hidden" name="question<%=quescount%>_option" required="required" value="3">C</div>
                                <div class="answer-content"><%=q.getAns_choice3()%></div>
                            </div>
                            <div class="exam-question-answer">
                                <div class="answer-box">
                                    <input type="hidden" name="question<%=quescount%>_option" required="required" value="4">D</div>
                                <div class="answer-content"><%=q.getAns_choice4()%></div>
                            </div>

                        </div>
                    </div>

                    <%}
                        }
                    %>

                    <br><br>
                </form>
            </div>
        </div>
        <script>

// Set the date we're counting down to
            var countDownDate = new Date("2024-01-05 15:37:25").getTime();
            var due = new Date("2022-01-30 <%=convertDateTime.Endtime(exam.getExam_time_start(), exam.getExam_duration())%>").getTime();
            
// Update the count down every 1 second
            var x = setInterval(function () {

                // Get today's date and time
                var now = new Date().getTime();

                // Find the distance between now and the count down date
                var distance = due - now;

                // Time calculations for days, hours, minutes and seconds
                
                var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                var seconds = Math.floor((distance % (1000 * 60)) / 1000);

                // Output the result in an element with id="demo"
                document.getElementById("MyClockDisplay").innerHTML = hours + "h "
                        + minutes + "m " + seconds + "s ";

                // If the count down is over, write some text 
                if (distance < 0) {
                    clearInterval(x);
                    document.getElementById("MyClockDisplay").innerHTML = "EXPIRED";
                }
            }, 1000);


        </script>
    </body>
    <!-- comment <script src="./timeManager.js"></script>-->
    <script src="./checkboxQuestion.js"></script>
    <script src="./radioQuestion.js"></script>



</html>
