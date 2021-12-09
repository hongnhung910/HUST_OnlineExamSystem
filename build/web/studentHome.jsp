<%-- 
    Document   : studentHome
    Created on : Dec 7, 2021, 8:11:56 PM
    Author     : hongn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
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
    <body style="padding-bottom: 0;">
        <form id="lecturerHome">
            <!--Navigation Bar-->
            <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-light">
                <img src="logoEn.png">

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="#" style="color: #696969; font-size: 18px"><b>Courses</b></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" style="color: #696969; font-size: 18px">Profile</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" style="color: #696969; font-size: 18px">Notifications</a>
                        </li>
                        <li class="nav-item nav-logout">
                            <a class="nav-link" href="index.html" style="color: #fff; font-size: 18px">Logout</a>
                        </li>
                    </ul>
                </div>
            </nav>
            <h1 class="courses-title">Your upcoming exam</h1>
            <div class="courses-container">
                <a href="courseInside.html" class="course-container">
                    <div class="course-info">
                        <img class="course-avt" src="ktmtAVT.png" alt="Kien truc may tinh">
                        <h2 class="course-name">Kiến trúc máy tính</h2>
                        <p class="course-time">Time: 10:30AM - 12:30pm</p>
                        <div class="course-extra">
                            <p class="course-students">Students: 58</p>
                            <p class="course-exams">Exams: 4</p>
                        </div>
                    </div>
                </a>
                <a href="./exam1/index.html" class="course-container">
                    <div class="course-info">
                        <img class="course-avt" src="ktmtAVT.png" alt="Kien truc may tinh">
                        <h2 class="course-name">Trí tuệ nhân tạo</h2>
                        <p class="course-time">Time: 10:30AM - 12:30pm</p>
                        <div class="course-extra">
                            <p class="course-students">Students: 58</p>
                            <p class="course-exams">Exams: 4</p>
                        </div>
                    </div>
                </a>
                <a class="course-container">
                    <div class="course-info">
                        <img class="course-avt" src="ktmtAVT.png" alt="Kien truc may tinh">
                        <h2 class="course-name">Cấu trúc dữ liệu</h2>
                        <p class="course-time">Time: 10:30AM - 12:30pm</p>
                        <div class="course-extra">
                            <p class="course-students">Students: 58</p>
                            <p class="course-exams">Exams: 4</p>
                        </div>
                    </div>
                </a>
                <a class="course-container">
                    <div class="course-info">
                        <img class="course-avt" src="ktmtAVT.png" alt="Kien truc may tinh">
                        <h2 class="course-name">Kiến trúc máy tính</h2>
                        <p class="course-time">Time: 10:30AM - 12:30pm</p>
                        <div class="course-extra">
                            <p class="course-students">Students: 58</p>
                            <p class="course-exams">Exams: 4</p>
                        </div>
                    </div>
                </a>
                <a class="course-container">
                    <div class="course-info">
                        <img class="course-avt" src="ktmtAVT.png" alt="Kien truc may tinh">
                        <h2 class="course-name">Kiến trúc máy tính</h2>
                        <p class="course-time">Time: 10:30AM - 12:30pm</p>
                        <div class="course-extra">
                            <p class="course-students">Students: 58</p>
                            <p class="course-exams">Exams: 4</p>
                        </div>
                    </div>
                </a>
                <a class="course-container">
                    <div class="course-info">
                        <img class="course-avt" src="ktmtAVT.png" alt="Kien truc may tinh">
                        <h2 class="course-name">Kiến trúc máy tính</h2>
                        <p class="course-time">Time: 10:30AM - 12:30pm</p>
                        <div class="course-extra">
                            <p class="course-students">Students: 58</p>
                            <p class="course-exams">Exams: 4</p>
                        </div>
                    </div>
                </a>
            </div>

            <footer style="background-image: url('footer.png');">
                <div class="container-fluid padding">
                    <div class="row text-center">
                        <div class="col-md-4">
                            <hr class="light">
                            <h5> <i class="fa fa-info-circle" aria-hidden="true"></i> More Info</h5>
                            <hr class="light">
                            <p><b>Hanoi University of Science and Technology © 2021</b></p>
                            <p> <i class="fa fa-phone-square" aria-hidden="true"></i> +84 243 869 2222</p>
                            <p> <i class="fa fa-envelope" aria-hidden="true"></i> hcth@hust.edu.vn</p>
                            <p> <i class="fa fa-map-marker" aria-hidden="true"></i> 1 Dai Co Viet Road, Ha Noi, Viet Nam</p>
                        </div>
                        <div class="col-md-4">
                            <hr class="light" />
                            <h5> <i class="fa fa-calendar" aria-hidden="true"></i> Working Hours</h5>
                            <hr class="light" />
                            <p>Monday: 9PM-5PM</p>
                            <p>Saturday:10AM-4PM</p>
                            <p>Sunday: Closed</p>
                        </div>
                        <div class="col-md-4">
                            <hr class="light">
                            <h5> <i class="fa fa-link" aria-hidden="true"></i> Quick Links</h5>
                            <hr class="light" />
                            <p><a href="https://en.hust.edu.vn/home">About HUST</a></p>
                            <p><a href="https://ctt.hust.edu.vn/">Other services</a></p>
                            <p><a href="https://en.hust.edu.vn/accreditation-results?p_p_id=58&p_p_lifecycle=0&p_p_state=maximized&p_p_mode=view&saveLastPath=false&_58_struts_action=%2Flogin%2Flogin#">Any questions</a></p>
                            <p><a href="https://www.google.com/maps/place/Hanoi+University+of+Science+%26+Technology+(HUST)/@21.007025,105.843136,16z/data=!4m5!3m4!1s0x0:0x55e92a5b07a97d03!8m2!3d21.0070253!4d105.843136?hl=en-US">Map</a></p>
                        </div>

                    </div>
                </div>
            </footer>
        </form>
    </body>
</html>
