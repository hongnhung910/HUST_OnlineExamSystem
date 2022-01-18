<%-- 
    Document   : studentHome
    Created on : Dec 7, 2021, 8:11:56 PM
    Author     : hongn
--%>
<%@page import="db_objects.Student"%>
<%@page import="db_objects.Exam"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Student std = (Student) request.getSession().getAttribute("std");
    if (std != null) {
        request.setAttribute("student", std);
    }
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "sql" uri = "http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
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
            <%@include file="studentNavbar.jsp"%>
            <h1 class="courses-title">Your upcoming exam</h1>

            <sql:setDataSource 
                var="db" 
                driver="com.mysql.jdbc.Driver"
                url="jdbc:mysql://localhost:3306/login_accounts?characterEncoding=utf8"
                user="root"
                password="Meoluoi910@"></sql:setDataSource>
            <sql:query var="listcourse" dataSource="${db}" >
                SELECT * FROM courses;
            </sql:query>

            <div class="courses-container">
                <table border="1" class="center" style="color:#000;">
                    <tr>
                        <th>Course ID</th>
                        <th>Course name</th>

                    </tr>
                    <c:forEach var="tb_course" items="${listcourse.rows}">
                        <tr>
                            <td><c:out value="${tb_course.courseID}"/></td>
                            <td><c:out value="${tb_course.courseName}"/></td>

                        </tr>
                    </c:forEach>
                </table>
            </div>  
        </form>
        <%@include file="footer.jsp"%>
    </body>
</html>
