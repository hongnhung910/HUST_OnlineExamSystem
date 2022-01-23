<%-- 
    Document   : studentProfile
    Created on : Jan 18, 2022, 7:18:25 PM
    Author     : hongn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link rel="stylesheet" type="text/css" href="./lecturerHome.css">
        <link rel="stylesheet" href="./courseInside.css">
        <link rel="stylesheet" href="./takeExam.css">
        <link rel="stylesheet" href="./entranceExam.css">
        <link rel="stylesheet" href="./studentInfor.css">
    </head>
    <body>

        
        <div id="content-container"  style="color: #696969;">

            <div class="exam-header">
                <img class="logo exam-logo" src="logoEn.png">
                <div class="exam-student">
                    <div class="exam-student-name">Vu Trong Nghia</div>
                    <img src="AVT.jpg" alt="" class="exam-student-avt">
                    <button class="btn btn-primary exam-student-logout">
                        <a class="submit-link" href="index.jsp">Logout</a>
                    </button>
                </div>
            </div>
        
            <h1 id="student-title" class="exam-course-name">Thông tin sinh viên</h1>

            <div class="exam-question" id="personal-infor">
                <h2 class="personal-infor-title infor-title">Thông tin cá nhân</h2>
                <div class="personal-infor-content">
                    <div class="infor-content-col1">
                        <img src="AVT.jpg" alt="Profile" class="content-col1-avt">
                        <div class="content-col1-mssv">MSSV: 20172720</div>
                    </div>
                    <div class="infor-content-col2">
                        <div class="content-col2-row">Họ và tên : Vũ Trọng Nghĩa</div>
                        <div class="content-col2-row">Năm vào trường : 2017</div>
                        <div class="content-col2-row">Bậc đào tạo : Đại học đại trà</div>
                        <div class="content-col2-row">Chương trình : Kỹ thuật điện tử - viễn thông-2017</div>
                        <div class="content-col2-row">Khoa/Viện quản lý : Viện Điện tử - Viễn thông</div>
                        <div class="content-col2-row">Tình trạng học tập : Học</div>
                    </div>
                    <div class="infor-content-col3">
                        <div class="content-col3-row">Giới tính : Nam</div>
                        <div class="content-col3-row">Lớp : ĐTVT.03-K62</div>
                        <div class="content-col3-row">Khóa học : 62</div>
                        <div class="content-col3-row">Email : nghia.vt172720@sis.hust.edu.vn</div>
                    </div>
                </div>
            </div>
            <div class="exam-question" id="courses-infor">
                <h2 class="courses-infor-title infor-title">Thông tin các khóa học</h2>
                <table class="table courses-infor-content">
                    <thead>
                        <tr>
                            <th scope="col">Id khóa học</th>
                            <th scope="col">Tên khóa học</th>
                            <th scope="col">Ngày bắt đầu</th>
                            <th scope="col">Số bài thi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>Kiến trúc máy tính</td>
                            <td>11/12/2021</td>
                            <td>12</td>
                        </tr>
                        <tr>
                            <th scope="row">2</th>
                            <td>Lập trình nâng cao</td>
                            <td>11/12/2021</td>
                            <td>15</td>
                        </tr>
                        <tr>
                            <th scope="row">3</th>
                            <td>Trí tuệ nhân tạo</td>
                            <td>11/12/2021</td>
                            <td>9</td>
                        </tr>
                    </tbody>
                </table>

            </div>
            <div class="exam-question" id="courses-infor">
                <h2 class="courses-infor-title infor-title">Lịch sử tham gia thi</h2>
                <table class="table courses-infor-content">
                    <thead>
                        <tr>
                            <th scope="col">Id bài làm</th>
                            <th scope="col">Tên bài thi</th>
                            <th scope="col">Tên khóa học</th>
                            <th scope="col">Thời gian</th>
                            <th scope="col">Điểm thi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>Exam 1: Cấu trúc tập lệnh Risc-v</td>
                            <td>Kiến trúc máy tính</td>
                            <td>January 18, 2022 08:40:00</td>
                            <td>8.5</td>
                        </tr>
                        <tr>
                            <th scope="row">2</th>
                            <td>Exam 1: Lập trình Java Core cơ bản</td>
                            <td>Lập trình nâng cao</td>
                            <td>January 18, 2022 08:40:00</td>
                            <td>9</td>
                        </tr>
                        <tr>
                            <th scope="row">3</th>
                            <td>Exam 1: Các giải thuật tìm kiếm</td>
                            <td>Trí tuệ nhân tạo</td>
                            <td>January 18, 2022 08:40:00</td>
                            <td>10</td>
                        </tr>
                    </tbody>
                </table>

            </div>
        </div>

        <%@include file="footer.jsp"%>

    </body>
</html>
