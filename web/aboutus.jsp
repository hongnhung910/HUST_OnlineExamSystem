<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>HUST Online Exams | About Us</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
        <link rel="stylesheet" type="text/css" href="static/css/aboutus.css">
        <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/carousel/">

        <style>
            body {
                padding-top: 3.5rem;
            }

            nav {
                font-family: sans-serif;
            }

            .navbar-brand {
                font-size: 20px;
                font-family: Georgia, 'Times New Roman', Times, serif;
            }
        </style>

    </head>
    <body>
        <form id="form1">
            <header style="background-image: url('footer.png');">
                <!--Navigation Bar-->
                <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-light">
                    <img src="logoEn.png"/>

                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarCollapse">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="index.jsp" style="color: #696969; font-size: 18px"><b>Home</b></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="aboutus.jsp" style="color: #696969; font-size: 18px">About</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="dropdown03" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: #696969; font-size: 18px">Login</a>
                                <div class="dropdown-menu" aria-labelledby="dropdown03">
                                    <a class="dropdown-item" href="login.jsp" >Student</a>
                                    <a class="dropdown-item" href="adminlogin.jsp">Teacher</a>

                                </div>
                            </li>

                        </ul>
                    </div>
                </nav>
            </header>

            <main role="main">

                <div class="jumbotron">
                    <div class="container">
                        <h1 class="display-4">About HUST Online Examination System</h1>

                        <p>Đây là hệ thống thi Online dành cho sinh viên Đại học Bách khoa Hà Nội.</p>
                        <p>Giảng viên sẽ được cung cấp tài khoản đăng nhập vào hệ thống để tạo thư viện đề thi, mở lớp thi, lên lịch thi, chấm điểm và phản hồi lại cho sinh viên.</p>
                        <p>Sinh viên sẽ đăng nhập vào hệ thống bằng địa chỉ email Microsoft do trường cấp cùng với mật khẩu là MSSV. Sau khi đăng nhập, sinh viên phải tự thay đổi mật khẩu của mình để đảm bảo tính bảo mật.</p>
                        <p>Nếu có bất kì thắc mắc hay phản hồi nào về hệ thống, vui lòng liên hệ theo các địa chỉ bên dưới. </p>
                    </div>
                </div>

                <div class="container">

                    <div class="row">
                        <p>Nếu có bất kì thắc mắc hay phản hồi nào về hệ thống, vui lòng liên hệ theo địa chỉ bên dưới. </p>
                        <div class="col-md-6">
                            <h2>PHÒNG CÔNG TÁC SINH VIÊN</h2>
                            <p> <i class="fa fa-phone-square" aria-hidden="true"></i> +84 243 869 2222</p>
                            <p> <i class="fa fa-envelope" aria-hidden="true"></i> hcth@hust.edu.vn</p>
                        </div>


                    </div>

                    <hr>

                </div>

            </main>

            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
            <script>window.jQuery || document.write('<script src="../assets/js/vendor/jquery.slim.min.js"><\/script>')</script><script src="../assets/dist/js/bootstrap.bundle.js"></script>

        </form>
    </body>
</html>
