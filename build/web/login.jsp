<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

        <title>HUST Online Exams | Login</title>
        <style>
            #logreg-forms{
                width:412px;
                margin:10vh auto;
                background-color:#f3f3f3;
                box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
                transition: all 0.3s cubic-bezier(.25,.8,.25,1);
            }
            #logreg-forms form {
                width: 100%;
                max-width: 410px;
                padding: 15px;
                margin: auto;
            }
            #logreg-forms .form-control {
                position: relative;
                box-sizing: border-box;
                height: auto;
                padding: 10px;
                font-size: 16px;
            }
            #logreg-forms .form-control:focus {
                z-index: 2;
            }
            #logreg-forms .form-signin input[type="text"] {
                margin-bottom: -1px;
                border-bottom-right-radius: 0;
                border-bottom-left-radius: 0;

            }
            #logreg-forms .form-signin input[type="password"] {
                border-top-left-radius: 0;
                border-top-right-radius: 0;
            }

            #logreg-forms a{
                display: block;
                padding-top:10px;
                color:grey;
            }


            #logreg-forms input[type="submit"]{
                margin-top:10px;
                background-color: #4a4747
            }

            #logreg-forms .form-reset, #logreg-forms .form-signup{
                display: none;
            }

            #logreg-forms .form-signup input {
                margin-bottom: 2px;
            }

            /* Mobile */

            @media screen and (max-width:500px){
                #logreg-forms{
                    width:300px;
                }

            }

        </style>
    </head>
    <body>
        <div id="logreg-forms">
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
            <form class="form-signin" action="login" method="POST" style="margin-top: 150px;">
                <h1 class="h3 mb-3 font-weight-normal" style="text-align: center">Login</h1>
                <hr/>
                <input type="text" class="form-control" placeholder="Email" required="" autofocus="" name="email"/>
                <input type="password" class="form-control" placeholder="Password" required="" name="pass"/><br>
                
                <input class="btn btn-success btn-block" type="submit" value="Login" style="color:white;"><br/>

                <p style="color:red; text-align: center;">${err}</p>
                <hr/>
            </form>

        </div>
    </body>
</html>
