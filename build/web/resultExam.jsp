<%-- 
    Document   : resultExam
    Created on : Jan 30, 2022, 5:06:20 AM
    Author     : hongn
--%>

<%@page import="hust.onlineexam.dbobjects.TakeExam"%>
<%@page import="hust.onlineexam.utils.TakeExamDAO"%>
<%@page import="java.util.List"%>
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
    int correct_answers = (Integer) request.getSession().getAttribute("correct_answers");
    ArrayList<Question> question_list = (ArrayList<Question>) session.getAttribute("question-list");
    String exam_id = (String) session.getAttribute("exam_id");
    String take_exam_id = exam_id + "_" + String.valueOf(user.getStd_id());

    if (exam_id != null) {
        request.setAttribute("exam_id", exam_id);
        request.setAttribute("take_exam_id", take_exam_id);
    }
    Exam exam = OnlineExamDAO.getExamInfo(MySQLConnUtils.getSQLServerConnection(), exam_id);
    TakeExam takeExam = TakeExamDAO.getTakeExam(MySQLConnUtils.getSQLServerConnection(), take_exam_id);
    int total_ques = exam.getExam_total_question();
    Course course = courseDAO.getCourseInfo(MySQLConnUtils.getSQLServerConnection(), exam.getCourse_id());
    System.out.print("Take Exam ID: " + take_exam_id);
    System.out.print("Num of correct answers: " + correct_answers);
%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>HUST Online Exams | Result <%=(exam.getExam_id().toUpperCase())%></title>
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
        .answer-wrong--ticked {
            background-color: #EC0000;
            color: white;
        }
    </style>

    <body>
        <div class="body-section"  style="color: black;">
            <nav class="nav-left">
                <button class="btn exit-btn btn-danger">
                    <a class="submit-link" href="./studentHome.jsp">Exit the exam</a>
                </button>
                <div class="static-items">

                    <div class="btn submit-btn btn-danger" style="font-size: 16px;" >
                        <p style="font-size: 24px;"><b>Exam Result</b></p>
                        <p>Correct: <%= correct_answers %>/ <%= total_ques %></p>
                        <p>Incorrect: <%= total_ques-correct_answers %>/ <%= total_ques %></p>
                        <p><b>Score: <%= takeExam.getGrade() %></b></p>
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
                <form>

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
                            int correct = 0;
                            int std_choice;
                            for (Question q : question_list) {
                                std_choice = TakeExamDAO.getStudentChoice(MySQLConnUtils.getSQLServerConnection(), take_exam_id, q.getQues_id());
                                correct = q.getAns_correct();

                    %>

                    <div class="form-group exam-question exam-question-radio" style="margin:20px;">
                        <label class="col-lg-2 control-label question-tag">Question <%=quescount%></label>
                        <% quescount = quescount + 1;%>
                        <div class="col-lg-10 text-left">
                            <input type="hidden" value="<%=q.getQues_id()%>" name="question<%=quescount%>_id" readonly>
                            <h5 class="question-content"><%=q.getQues_title()%></h5>

                            <div class="exam-question-answer">
                                <%
                                    if (std_choice == 1 && correct != 1) {
                                %> 
                                <div class="answer-box answer-wrong--ticked">
                                <%
                                    } else if (correct == 1) {
                                %>
                                        <div class="answer-box answer-correct--ticked">                                   
                                    <% } else {%>
                                            <div class="answer-box">  
                                <% }%>
                                <input type="hidden" name="question<%=quescount%>_option" value="<%=q.getAns_choice1()%>" readonly></div>
                                <div class="answer-content"><%=q.getAns_choice1()%> </div>
                            </div>

                            <div class="exam-question-answer">
                                <%
                                    if (std_choice == 2 && correct != 2) {
                                %> 
                                <div class="answer-box answer-wrong--ticked">
                                <%
                                    } else if (correct == 2) {
                                %>
                                <div class="answer-box answer-correct--ticked">   
                                <% } else {%>
                                <div class="answer-box">  
                                <% }%>
                                <input type="hidden" name="question<%=quescount%>_option" value="<%=q.getAns_choice2()%>" readonly></div>
                                <div class="answer-content"><%=q.getAns_choice2()%></div>
                            </div>
                            <div class="exam-question-answer">
                                <%
                                    if (std_choice == 3 && correct != 3) {
                                %> 
                                <div class="answer-box answer-wrong--ticked">
                                <%
                                    } else if (correct == 3) {
                                %>
                                <div class="answer-box answer-correct--ticked">   
                                <% } else {%>
                                <div class="answer-box">           
                                <% }%>
                                <input type="hidden" name="question<%=quescount%>_option" value="<%=q.getAns_choice3()%>" readonly></div>
                                <div class="answer-content"><%=q.getAns_choice3()%></div>
                            </div>
                            <div class="exam-question-answer">
                                <%
                                    if (std_choice == 4 && correct != 4) {
                                %> 
                                        <div class="answer-box answer-wrong--ticked">
                                <%
                                    } else if (correct == 4) {
                                %>
                                            <div class="answer-box answer-correct--ticked">
                                    
                                        <% } else {%>
                                                <div class="answer-box">
                                    
                                <% }%>
                                <input type="hidden" name="question<%=quescount%>_option" value="<%=q.getAns_choice4()%>" readonly></div>
                                <div class="answer-content"><%=q.getAns_choice4()%></div> 
                                
                            </div>
                                <% if (correct != std_choice){
                                    %>
                                    <p style="color: #EC0000; font-size: 16px; margin-top: 20px; margin-left: 40px;"><b>INCORRECT</b></p>
                                    <%
                                } else { %>
                                    <p style="color: #52cc00; font-size: 16px; margin-top: 20px; margin-left: 40px;"><b>CORRECT</b></p>
                                <% } %>
                        </div>
                                
                    </div>
                    <%   
                            }
                        }

                    %>
                    <br><br>
                </form>
            </div>
        </div>

    </body>
</html>
