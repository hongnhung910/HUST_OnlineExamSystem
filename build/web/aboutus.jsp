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

                        <p>????y l?? h??? th???ng thi Online d??nh cho sinh vi??n ?????i h???c B??ch khoa H?? N???i.</p>
                        <p>Gi???ng vi??n s??? ???????c cung c???p t??i kho???n ????ng nh???p v??o h??? th???ng ????? t???o th?? vi???n ????? thi, m??? l???p thi, l??n l???ch thi, ch???m ??i???m v?? ph???n h???i l???i cho sinh vi??n.</p>
                        <p>Sinh vi??n s??? ????ng nh???p v??o h??? th???ng b???ng ?????a ch??? email Microsoft do tr?????ng c???p c??ng v???i m???t kh???u l?? MSSV. Sau khi ????ng nh???p, sinh vi??n ph???i t??? thay ?????i m???t kh???u c???a m??nh ????? ?????m b???o t??nh b???o m???t.</p>
                        <p>N???u c?? b???t k?? th???c m???c hay ph???n h???i n??o v??? h??? th???ng, vui l??ng li??n h??? theo c??c ?????a ch??? b??n d?????i. </p>
                    </div>
                </div>

                <div class="container">

                    <div class="row">
                        <p>N???u c?? b???t k?? th???c m???c hay ph???n h???i n??o v??? h??? th???ng, vui l??ng li??n h??? theo ?????a ch??? b??n d?????i. </p>
                        <div class="col-md-6">
                            <h2>PH??NG C??NG T??C SINH VI??N</h2>
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
