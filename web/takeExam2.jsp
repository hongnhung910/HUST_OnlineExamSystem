<%-- 
    Document   : takeExam2
    Created on : Jan 24, 2022, 3:49:43 PM
    Author     : Vu Nghia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Exam 1: Risc-V Processor Basic</title>
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
        <style>
        </style>
    </head>
    <c:set var="selectedexam" value="${param.selectedexam}" scope="session" />

    <body>
        <div class="body-section"  style="color: black;">
            <nav class="nav-left">
            <button class="btn exit-btn btn-danger">
                <a class="submit-link" href="./studentHome.jsp">Back to exam list</a>
            </button>
            <div class="static-items">
                <div id="MyClockDisplay" class="clock" onload="showTime()"></div>
                <button class="btn submit-btn btn-primary">
                    <a class="submit-link" href="#" onclick="grading(key)">Submit</a>
                </button>
            </div>
        </nav>

        <div class="content-container">
            <div class="exam-header">
                <img class="logo exam-logo" src="logoEn.png">
                <div class="exam-student">
                    <div class="exam-student-name">Nguyen Thi Hong Nhung</div>
                    <img src="./iconsfemale.jpg" alt="" class="exam-student-avt">
                    <button class="btn btn-primary exam-student-logout">
                        <a class="submit-link" href="./login.jsp">Logout</a>
                    </button>
                </div>
            </div>
            <sql:setDataSource 
                var="db" 
                driver="com.mysql.jdbc.Driver"
                url="jdbc:mysql://localhost:3306/hustdb?autoReconnect=true&useSSL=false"
                user="root"
                password="31101999"></sql:setDataSource>
            <sql:query var="listcourse" dataSource="${db}" >
                SELECT * FROM courses;
            </sql:query>
                <c:set var="questioncnt" value="0" />
            <div class="exam-info">
                <div class="exam-course-name">Kiến trúc máy tính</div>
                <div class="exam-test-name">Kiểm tra giữa kỳ 20211</div>
                <div class="exam-test-info">
                    <div id="start" class="test-info-start">Start: 02:29:36 PM</div>
                    <div id="due" class="test-info-due">Due: 02:59:36 PM</div>
                    <div id="dur" class="test-info-time">Duration: 45 minutes</div>
                </div>
            </div>

            <div class="exam-questions">
                <sql:setDataSource 
                    var="db" 
                    driver="com.mysql.jdbc.Driver"
                    url="jdbc:mysql://localhost:3306/hustdb?autoReconnect=true&useSSL=false"
                    user="root"
                    password="31101999"></sql:setDataSource>

        <sql:query var="mcq" dataSource="${db}">
            select * from exam_question_bank;
        </sql:query>
                <c:set var="questioncnt" value="0" />
                <c:forEach var="mcqexam" items="${mcq.rows}" >
                    <c:set var="questioncnt" value="${questioncnt+1}" scope="page" />
                    <div id="${questioncnt}" class="exam-question exam-question-radio">
                    <div class="exam-question-question">
                        <div class="question-tag">Question <c:out value="${questioncnt}"></c:out></div>
                        <div class="question-content"><c:out value="${mcqexam.ques_title}"></c:out>
                        </div>
                    </div>
                    <div class="exam-question-answers">
                        <div class="exam-question-answer">
                            <div class="answer-box">A</div>
                            <div class="answer-content"><c:out value="${mcqexam.ans_choice1}"></c:out></div>
                        </div>
                        <div class="exam-question-answer">
                            <div class="answer-box">B</div>
                            <div class="answer-content"><c:out value="${mcqexam.ans_choice2}"></c:out></div>
                        </div>
                        <div class="exam-question-answer">
                            <div class="answer-box">C</div>
                            <div class="answer-content"><c:out value="${mcqexam.ans_choice3}"></c:out></div>
                        </div>
                        <div class="exam-question-answer">
                            <div class="answer-box">D</div>
                            <div class="answer-content"><c:out value="${mcqexam.ans_choice4}"></c:out></div>
                        </div>
                    </div>
                </div>
                </c:forEach>
        </div>
            <div class="exam-question exam-farewell" id="farewell-area">
                <div class="alert-noti farewell-noti" style="font-size: 2rem;">Chúc mừng bạn đã hoàn thành bài thi</div>
                <div id="grade-noti" style="font-size: 4rem;"></div>
                <img src="./congrat.png" alt="farewell" class="farewell-img">
            </div>    
    </div>
        </div>
        
        <%@include file="footer.jsp"%>
        <script src="./timeManager.js"></script>
        <script src="./checkboxQuestion.js"></script>
        <script src="./radioQuestion.js"></script>
        <script>
// Chấm điểm
        let key = [{"examID":"et4040_ck", "quesID":"et4040_ck_01", "ques_title":"Trong ki\u1ebfn tr\u00fac x\u1eed l\u00fd 4 bits. Thanh ghi MBR l\u00e0m nhi\u1ec7m v\u1ee5 g\u00ec?", "ans_choice1":"\u0110\u1ecdc d\u1eef li\u1ec7u t\u1eeb \u00f4 nh\u1edb trong b\u1ed9 nh\u1edb", "ans_choice2":"Ghi d\u1eef li\u1ec7u ra b\u1ed9 nh\u1edb", "ans_choice3":"\u0110\u1ecdc \u0111\u1ecba ch\u1ec9 \u00f4 nh\u1edb trong b\u1ed9 nh\u1edb", "ans_choice4":"T\u00edn hi\u1ec7u \u0111\u1ecdc d\u1eef li\u1ec7u t\u1eeb m\u1ed9t \u00f4 nh\u1edb trong b\u1ed9 nh\u1edb.", "ans_correct":"\u0110\u1ecdc d\u1eef li\u1ec7u t\u1eeb \u00f4 nh\u1edb trong b\u1ed9 nh\u1edb"},
 {"examID":"et4040_ck", "quesID":"et4040_ck_02", "ques_title":"C\u00e1c lo\u1ea1i BUS n\u00e0o s\u1eed d\u1ee5ng trong ki\u1ebfn tr\u00fac v\u00e0o/ra c\u1ee7a m\u00e1y t\u00ednh s\u1ed1 l\u00e0:", "ans_choice1":"C\u1ea3 3 lo\u1ea1i BUS: D\u1eef li\u1ec7u, \u0111\u1ecba ch\u1ec9, \u0111i\u1ec1u khi\u1ec3n", "ans_choice2":"BUS \u0111\u1ecba ch\u1ec9", "ans_choice3":"BUS \u0111i\u1ec1u khi\u1ec3n", "ans_choice4":"BUS d\u1eef li\u1ec7u", "ans_correct":"C\u1ea3 3 lo\u1ea1i BUS: D\u1eef li\u1ec7u, \u0111\u1ecba ch\u1ec9, \u0111i\u1ec1u khi\u1ec3n"},
 {"examID":"et4040_ck", "quesID":"et4040_ck_03", "ques_title":"Lo\u1ea1i BUS n\u00e0o l\u00e0m nhi\u1ec7m v\u1ee5 \u0111i\u1ec1u khi\u1ec3n c\u00e1c t\u00edn hi\u1ec7u \u0111\u1ecdc/ghi d\u1eef li\u1ec7u gi\u1eefa chip vi x\u1eed l\u00fd v\u00e0 b\u1ed9 nh\u1edb", "ans_choice1":"BUS \u0111i\u1ec1u khi\u1ec3n", "ans_choice2":"BUS \u0111\u1ecba ch\u1ec9", "ans_choice3":"BUS d\u1eef li\u1ec7u", "ans_choice4":"BUS \u0111\u1ecba ch\u1ec9 v\u00e0 BUS \u0111i\u1ec1u khi\u1ec3n.", "ans_correct":"BUS d\u1eef li\u1ec7u"},
 {"examID":"et4040_ck", "quesID":"et4040_ck_04", "ques_title":"Lo\u1ea1i BUS n\u00e0o l\u00e0m nhi\u1ec7m v\u1ee5 \u0111i\u1ec1u khi\u1ec3n c\u00e1c t\u00edn hi\u1ec7u \u0111\u1ecdc/ghi d\u1eef li\u1ec7u gi\u1eefa chip vi x\u1eed l\u00fd v\u00e0 b\u1ed9 nh\u1edb", "ans_choice1":"BUS \u0111i\u1ec1u khi\u1ec3n", "ans_choice2":"BUS \u0111\u1ecba ch\u1ec9", "ans_choice3":"BUS d\u1eef li\u1ec7u", "ans_choice4":"BUS \u0111\u1ecba ch\u1ec9 v\u00e0 BUS \u0111i\u1ec1u khi\u1ec3n.", "ans_correct":"BUS d\u1eef li\u1ec7u"},
 {"examID":"et4040_ck", "quesID":"et4040_ck_05", "ques_title":"Lo\u1ea1i BUS n\u00e0o l\u00e0m nhi\u1ec7m v\u1ee5 \u0111i\u1ec1u khi\u1ec3n c\u00e1c t\u00edn hi\u1ec7u \u0111\u1ecdc/ghi d\u1eef li\u1ec7u gi\u1eefa chip vi x\u1eed l\u00fd v\u00e0 b\u1ed9 nh\u1edb", "ans_choice1":"BUS \u0111i\u1ec1u khi\u1ec3n", "ans_choice2":"BUS \u0111\u1ecba ch\u1ec9", "ans_choice3":"BUS d\u1eef li\u1ec7u", "ans_choice4":"BUS \u0111\u1ecba ch\u1ec9 v\u00e0 BUS \u0111i\u1ec1u khi\u1ec3n.", "ans_correct":"BUS d\u1eef li\u1ec7u"},
 {"examID":"et4040_ck", "quesID":"et4040_ck_06", "ques_title":"Lo\u1ea1i BUS n\u00e0o l\u00e0m nhi\u1ec7m v\u1ee5 \u0111i\u1ec1u khi\u1ec3n c\u00e1c t\u00edn hi\u1ec7u \u0111\u1ecdc/ghi d\u1eef li\u1ec7u gi\u1eefa chip vi x\u1eed l\u00fd v\u00e0 b\u1ed9 nh\u1edb", "ans_choice1":"BUS \u0111i\u1ec1u khi\u1ec3n", "ans_choice2":"BUS \u0111\u1ecba ch\u1ec9", "ans_choice3":"BUS d\u1eef li\u1ec7u", "ans_choice4":"BUS \u0111\u1ecba ch\u1ec9 v\u00e0 BUS \u0111i\u1ec1u khi\u1ec3n.", "ans_correct":"BUS d\u1eef li\u1ec7u"},
 {"examID":"et4040_ck", "quesID":"et4040_ck_07", "ques_title":"Lo\u1ea1i BUS n\u00e0o l\u00e0m nhi\u1ec7m v\u1ee5 \u0111i\u1ec1u khi\u1ec3n c\u00e1c t\u00edn hi\u1ec7u \u0111\u1ecdc/ghi d\u1eef li\u1ec7u gi\u1eefa chip vi x\u1eed l\u00fd v\u00e0 b\u1ed9 nh\u1edb", "ans_choice1":"BUS \u0111i\u1ec1u khi\u1ec3n", "ans_choice2":"BUS \u0111\u1ecba ch\u1ec9", "ans_choice3":"BUS d\u1eef li\u1ec7u", "ans_choice4":"BUS \u0111\u1ecba ch\u1ec9 v\u00e0 BUS \u0111i\u1ec1u khi\u1ec3n.", "ans_correct":"BUS d\u1eef li\u1ec7u"},
 {"examID":"et4040_ck", "quesID":"et4040_ck_08", "ques_title":"Lo\u1ea1i BUS n\u00e0o l\u00e0m nhi\u1ec7m v\u1ee5 \u0111i\u1ec1u khi\u1ec3n c\u00e1c t\u00edn hi\u1ec7u \u0111\u1ecdc/ghi d\u1eef li\u1ec7u gi\u1eefa chip vi x\u1eed l\u00fd v\u00e0 b\u1ed9 nh\u1edb", "ans_choice1":"BUS \u0111i\u1ec1u khi\u1ec3n", "ans_choice2":"BUS \u0111\u1ecba ch\u1ec9", "ans_choice3":"BUS d\u1eef li\u1ec7u", "ans_choice4":"BUS \u0111\u1ecba ch\u1ec9 v\u00e0 BUS \u0111i\u1ec1u khi\u1ec3n.", "ans_correct":"BUS d\u1eef li\u1ec7u"},
 {"examID":"et4230_gk", "quesID":"et4230_gk_01", "ques_title":"M\u1ea1ng m\u00e1y t\u00ednh l\u00e0 g\u00ec?", "ans_choice1":"C\u00e1c m\u00e1y t\u00ednh k\u1ebft n\u1ed1i v\u1edbi nhau qua h\u1ec7 th\u1ed1ng c\u00e1p \u0111\u1ec3 trao \u0111\u1ed5i th\u00f4ng tin", "ans_choice2":"C\u00e1c m\u00e1y t\u00ednh trao \u0111\u1ed5i th\u00f4ng tin v\u1edbi nhau theo t\u1eadp giao th\u1ee9c m\u1ea1ng", "ans_choice3":"C\u00e1c m\u00e1y t\u00ednh k\u1ebft n\u1ed1i qua m\u00f4i tr\u01b0\u1eddng truy\u1ec1n tin v\u00e0 trao \u0111\u1ed5i th\u00f4ng tin theo m\u1ed9t ki\u1ebfn tr\u00fac m\u1ea1ng x\u00e1c \u0111\u1ecbnh", "ans_choice4":"C\u00e1c m\u00e1y t\u00ednh k\u1ebft n\u1ed1i v\u1edbi nhau chia s\u1ebb ngu\u1ed3n th\u00f4ng tin chung", "ans_correct":"C\u00e1c m\u00e1y t\u00ednh k\u1ebft n\u1ed1i qua m\u00f4i tr\u01b0\u1eddng truy\u1ec1n tin v\u00e0 trao \u0111\u1ed5i th\u00f4ng tin theo m\u1ed9t ki\u1ebfn tr\u00fac m\u1ea1ng x\u00e1c \u0111\u1ecbnh"},
 {"examID":"et4230_gk", "quesID":"et4230_gk_02", "ques_title":"L\u1ee3i \u00edch c\u1ee7a m\u1ea1ng m\u00e1y t\u00ednh mang l\u1ea1i l\u00e0?", "ans_choice1":"T\u0103ng kh\u1ea3 n\u0103ng ph\u00e1t hi\u1ec7n v\u00e0 ch\u1ed1ng th\u00e2m nh\u1eadp m\u1ea1ng b\u1ea5t h\u1ee3p ph\u00e1p", "ans_choice2":"R\u00fat ng\u1eafn th\u1eddi gian trao \u0111\u1ed5i th\u00f4ng tin", "ans_choice3":"Gi\u00fap b\u1ea3o v\u1ec7 th\u00f4ng tin t\u1ea1i c\u00e1c n\u00fat m\u1ea1ng t\u1ed1t h\u01a1n", "ans_choice4":"T\u1ea1o nhi\u1ec1u c\u01a1 h\u1ed9i thu\u1eadn l\u1ee3i cho c\u00f4ng vi\u1ec7c, kinh doanh,\u2026", "ans_correct":"T\u1ea1o nhi\u1ec1u c\u01a1 h\u1ed9i thu\u1eadn l\u1ee3i cho c\u00f4ng vi\u1ec7c, kinh doanh,\u2026"}];
        
        function grading(key) {
            let question = document.getElementsByClassName('exam-question');
            console.log(question);
            var questions = [...question];
            console.log(questions);
            let answers = [];
            let grade = 0;
            questions.forEach(function answerLookUp(question) {
                let i = question.querySelector('.answer-box--ticked ~ .answer-content');
                // console.log(i);
                if(i !== null) {
                    answers.push(i.innerHTML);
                }
                else {
                    answers.push(null);
                }
            });
            console.log(answers);
            for( let i = 0; i < key.length; i++) {
                if(key[i].ans_correct === answers[i]) {
                    grade += 1;
                }
            }
            console.log(grade);
            document.querySelector('.exam-questions').style.display = 'none';
            document.querySelector('#farewell-area').style.display = 'flex';
            document.querySelector('#farewell-area #grade-noti').innerHTML = 'Điểm bài thi: ' + grade;
            return grade;
        }
        </script>
    </body>
</html>
