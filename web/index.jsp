<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>HUST Online Exams | Home</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
        <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/carousel/">

        <style>
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                user-select: none;
            }

            .imageselection {
                max-width: 200px;
                height: auto;
                -webkit-filter: grayscale(100%);
                filter: grayscale(100%);
                -webkit-transition: .2s ease-in-out;
                transition: .2s ease-in-out;
            }
            .imageselection:hover{
                -webkit-filter: grayscale(0);
                filter: grayscale(0);
                -webkit-transform: scale(1.3);
                transform: scale(1.3);
                font-weight: 900;
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }

        </style>

        <link rel="stylesheet" type="text/css" href="index.css">

    </head>
    <body style="padding-bottom: 0;">
        <form id="form1" style="padding-bottom: 0;">
            <header>
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

            <!--Image Carousel-->
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                </ol>

                <div class="carousel-inner">        
                    <div class="carousel-item active">
                        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><rect width="100%" height="100%" fill="#777"/></svg>
                        <img src="BGheader.png" />
                        <div class="container">
                            <div class="carousel-caption">
                                <h1><b>ONLINE EXAMINATION SYSTEM OF</b></h1>
                                <h1><b>HANOI UNIVERSITY OF SCIENCE AND TECHNOLOGY</b></h1>
                                <p>An efficient and a reliable tool for students and lecturers of HUST to schedule and take exams</p>
                            </div>
                        </div>
                    </div>


                </div>


                <!--Build with Ease and Logos section-->
                <div class="container-fluid padding">
                    <div class="row welcome text-center">
                        <div class="col-12">
                            <h2 class="display-4">Assess the system as</h2>
                        </div>
                        <hr/>

                    </div>
                </div>
                <div class="container-fluid">
                    <div class="row text-center padding">
                        <div class="col-xs-12 col-sm-6 col-md-6 select-item">
                            <a href="login.jsp" >
                                <img src="students.jpg" class="imageselection responsive" style="max-width: 200px"/>
                                <h3><span>Student</span></h3>
                            </a>

                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 select-item">
                            <a href="adminlogin.jsp">
                                <img src="lecturer.jpg" class="imageselection responsive" style="max-width: 200px"/>
                                <h3><span>Lecturer</span></h3>
                            </a>

                        </div>
                    </div>
                    <hr class="my-4"/>
                </div>

                <!--Connect Section-->
                <div class="container-fluid padding">
                    <div class="row text-center padding">
                        <div class="col-12">
                            <h2 class="socialnetwork">Connect via social networks</h2>
                        </div>
                        <div class="col-12 social padding">
                            <a href="https://www.facebook.com/dhbkhanoi/?fref=ts"><i class="fab fa-facebook"></i></a>
                            <a href="https://www.youtube.com/channel/UCILDWZ7oJhUcvWrYrRtLzVg"><i class="fab fa-youtube"></i></a>
                            <a href="https://twitter.com/DHBKHN_HUST"><i class="fab fa-twitter"></i></a>
                        </div>
                    </div>
                </div>
                <!--Footer-->
                <jsp:include page="footer.jsp"/>
        </form>
        
    </body>
</html>