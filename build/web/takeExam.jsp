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

    if (exam_id != null) {
        String take_exam_id = exam_id+"_"+String.valueOf(user.getStd_id());
        request.setAttribute("exam_id", exam_id);
        request.setAttribute("take_exam_id", take_exam_id);
    }
    Exam exam = OnlineExamDAO.getExamInfo(MySQLConnUtils.getSQLServerConnection(), exam_id);

    Course course = courseDAO.getCourseInfo(MySQLConnUtils.getSQLServerConnection(), exam.getCourse_id());
%>
<!DOCTYPE html>
<html lang="vi">
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
        <link rel="stylesheet" href="./takeExam.css">
    </head>
    <style>
        .submit-button {
            background-color: #f4511e;
            width: 20%;
            border-radius: 5px;
            border: none;
            color: white;
            padding: 16px 32px;
            text-align: center;
            font-size: 16px;
            margin: 4px 2px;
            opacity: 0.6;
            transition: 0.3s;
            display: inline-block;
            text-decoration: none;
            cursor: pointer;
            align-items: center;
        }

        .submit-button:hover {
            opacity: 1
        }
    </style>

    <body style="padding: 0;">
        <div class="body-section"  style="color: black;">
            <nav class="nav-left">
                <button class="btn exit-btn btn-danger">
                    <a class="submit-link" href="./studentHome.jsp">Exit the exam</a>
                </button>
                <div class="static-items">

                    <p id="MyClockDisplay" class="clock">_h _m _s</p>
                    <div class="btn submit-btn btn-danger" style="font-size: 2em; font-family: Orbitron;" >
                        <b>Remaining Time</b> 
                    </div>

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
                <form action="takeExam" method="POST">

                    <div class="exam-info">
                        <div class="exam-course-name">
                            <%=course.getCourse_name().toUpperCase()%> (<%=exam.getCourse_id().toUpperCase()%>) </div>
                        <div class="exam-test-name"><%=exam.getExam_name()%></div>
                        <div  id="exam-date" class="exam-test-date" style="font-size: 1.8rem;">
                            Ng??y thi: <%=convertDateTime.dateFormater(exam.getExam_date_start())%></div>
                        <div class="exam-test-info">
                            <div id="start" class="test-info-start">
                                Th???i gian b???t ?????u: <%=convertDateTime.timeFormater(exam.getExam_time_start())%> 
                            </div>
                            <div id="dur" class="test-info-time">
                                Th???i gian l??m b??i: <%=convertDateTime.durationFormater(exam.getExam_duration())%></div>

                            <div id="due" class="test-info-due">
                                Th???i gian k???t th??c: <%=convertDateTime.calculate_Endtime(exam.getExam_time_start(), exam.getExam_duration())%></div>
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
                                <div>
                                    <input  type="radio" name="question<%=quescount%>_option" required="required" value="1"></div>
                                <div class="answer-content"><%=q.getAns_choice1()%> </div>
                            </div>
                            <div class="exam-question-answer">
                                <div>
                                    <input type="radio" name="question<%=quescount%>_option" required="required" value="2"></div>
                                <div class="answer-content"><%=q.getAns_choice2()%></div>
                            </div>
                            <div class="exam-question-answer">
                                <div>
                                    <input type="radio" name="question<%=quescount%>_option" required="required" value="3"></div>
                                <div class="answer-content"><%=q.getAns_choice3()%></div>
                            </div>
                            <div class="exam-question-answer">
                                <div>
                                    <input type="radio" name="question<%=quescount%>_option" required="required" value="4"></div>
                                <div class="answer-content"><%=q.getAns_choice4()%></div>
                            </div>

                        </div>
                    </div>

                    <%}
                        }
                    %>

                    <center> <button class="submit-button" onclick="show_correctAns()">Submit</button> </center>

                    <br><br>
                </form>
            </div>
        </div>
        <script>
            var due = new Date("<%=convertDateTime.getCurrentDate()%> <%=convertDateTime.Endtime(convertDateTime.getCurrentTime(), exam.getExam_duration())%>");
                var x = setInterval(function () {

                    // Get today's date and time
                    var now = new Date();
                    
                    // Find the distance between now and the count down date
                    var distance = due - now;

                    // Time calculations for days, hours, minutes and seconds
                    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
                    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                    var seconds = Math.floor((distance % (1000 * 60)) / 1000);

                    // Output the result in an element with id="demo"
                    document.getElementById("MyClockDisplay").innerHTML = hours + "h "
                            + minutes + "m " + seconds + "s ";

                    // If the count down is over, write some text 
                    if (distance < 0) {
                        clearInterval(x);
                        document.getElementById("MyClockDisplay").innerHTML = "<%=convertDateTime.getCurrentTime()%>";
                        console.log('H???t gi??? l??m b??i thi!');
                    }
                }, 1000);

        </script>
    </body>
    <script src="./checkboxQuestion.js"></script>
    <script src="./radioQuestion.js"></script>



</html>
