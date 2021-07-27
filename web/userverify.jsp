<%-- 
    Document   : Home
    Created on : Jul 2, 2021, 12:44:00 AM
    Author     : Alif Danish

        FOR LAKETOWN
--%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sql:setDataSource var="myDatasource"
                   driver="org.apache.derby.jdbc.ClientDriver"
                   url="jdbc:derby://localhost:1527/laketown" user="app"
                   password="app"/>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Joran LakeTown</title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400" rel="stylesheet" />    
	<link href="css/templatemo-style.css" rel="stylesheet" />
        
        <style>
            #event {
                font-family: Arial, Helvetica, sans-serif;
                border-collapse: collapse;
                width: 100%;
            }
                
            #event td, #event th {
                border: 1px solid #ddd;
                padding: 10px;
            }
                
            #event tr:nth-child(even){background-color: #f2f2f2;}
                
            #event tr:hover {background-color: #ddd;}
                
            #event th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color: #4CAF50;
                color: white;
            }
                
            /* Style buttons */
            .btn {
                background-color: #4CAF50; /* Blue background */
                border: none; /* Remove borders */
                color: white; /* White text */
                /*            padding: 12px 16px;  Some padding */
                font-size: 13px; /* Set a font size */
                cursor: pointer; /* Mouse pointer on hover */
            }
                
            /* Darker background on mouse-over */
            .btn:hover {
                background-color: darkred;
            }
        </style>
        <script> 
            function validate()
            { 
                var username = document.form.username.value; 
                var password = document.form.password.value;
                var conpassword = document.form.conpassword.value;
                var fullname = document.form.fullname.value;
                var email = document.form.email.value;
                
                if (fullname == null || fullname == "")
                { 
                    alert("Fullname cannot be blank"); 
                    return false; 
                }
                if (email == null || email == "")
                { 
                    alert("Email cannot be blank"); 
                    return false; 
                }
                if (username == null || username == "")
                { 
                    alert("Username cannot be blank"); 
                    return false; 
                }
                else if(password==null || password=="")
                { 
                    alert("Password cannot be blank"); 
                    return false; 
                } 
                else if(conpassword==null || conpassword=="")
                { 
                    alert("Confirm Password cannot be blank"); 
                    return false; 
                }
                if(password != conpassword){
                    alert("Confirm password not same as password");
                    return false;
                }
            }
        </script>
        <link rel="stylesheet" href="css/style.css">
</head>
<!--

-->
<body> 
    
    <div class="container">
        <!-- Top box -->
        <!-- Logo & Site Name -->
        <div class="placeholder">
            
            <div class="parallax-window" data-parallax="scroll" data-image-src="img/bgjoran.jpg">
                <div class="tm-header">
                    <div>
                        <h1 class="tm-site-title">JORAN BUKIT MERAH</h1>
                        <h1 class="tm-site-description">LAKETOWN</h1>	     
                         Welcome <%=request.getAttribute("email") %>
                       
                    </div>
                    <div class="row tm-header-inner" >   
                        <div class="col-md-6 col-12 tm-nav">
                            <ul class="tm-nav-ul">
                                <li class="tm-nav-li"><a href="Home.jsp" class="tm-nav-link active " style="font-size:20px" >Home</a></li>
                                <li class="tm-nav-li"><a href="about.jsp" class="tm-nav-link" style="font-size:20px">About</a></li>
                                <li class="tm-nav-li"><a href="contact.jsp" class="tm-nav-link" style="font-size:20px">Contact</a></li>
                                <li class="dropdown tm-nav-li">
                                    <a href="javascript:void(0)" class="tm-nav-link" style="font-size:20px">Menu</a>
                                    <div class="dropdown-content">
                                        <button id="myBtn" class="tm-nav-link" style="color:black " >PROFILE SETTING</button>
                                        <div id="myModal" class="modal">
                                            <!-- Modal content -->
                                            <div class="wrapper fadeInDown modal-content">
                                              <span class="close">&times;</span>
                                              <p style="text-align:center">PROFILE SETTING</p>
                                       
                    
                                            <form name="form" action="UserVerifyServlet" method="post" >

                                            <input type="text" id="login" class="fadeIn second" name="email" required="" placeholder="email" >

                                            <input type="password" id="password" class="fadeIn second " name="password" required="" placeholder="password">


                                            <input type="submit" class="fadeIn fourth" value="Login">
                                            </form>
                                                
                                            </div>

                                          </div>
                                        <a href="LogoutServlet" class="tm-nav-link">Logout</a>
                                    </div>
                            </ul>
                        </div>	        
                    </div>
                </div>
            </div>
        </div>        
        <main>
            <header class="row tm-welcome-section">
                <h2 class="col-12 text-center tm-section-title">PROFILE SETTING</h2>
            </header>
     <div class="wrapper fadeInDown">
                   <div id="formContent">

            <!-- Login Form -->
            <c:set var="id" value="${param.email}"/>
             
            <form name="form" action="EditUserServlet" method="post" onsubmit="return validate()">
                <sql:query var="result" dataSource="${myDatasource}">
                                SELECT * FROM USERS 
                                WHERE email = '<%=request.getAttribute("email") %>'
                            </sql:query> 
              <c:forEach var="row" items="${result.rows}"> 
                <tr>  
                  <td>Full Name</td>
                    <input type="text" class="fadeIn second" required=" " name="fullname" value="${row.fullname}">
                </tr>
                <tr>  
                  <td>Username</td>
                <input type="text" class="fadeIn second" name="username" required=" " value="${row.name}">
                </tr>
                <tr>  
                  <td>Email</td>
                <input type="text" class="fadeIn second"name="email" required=" " value="${row.email}"
                </tr>
                <tr>  
                  <td>Password</td>
                <input type="password" class="fadeIn third" name="password" required=" " value="${row.password}"
                </tr>
                <tr>  
                
                <input type="password" class="fadeIn second" name="conpassword" required=" "  placeholder="confirm password">
                
                <td><span style="color:red"><%=(request.getAttribute("errMessage") == null) ? ""
                                        : request.getAttribute("errMessage")%></span></td>
                <input type="submit" class="fadeIn fourth" value="Confirm">
              </c:forEach>
                
                
            </form>
        </div>
  <table id="event" border="1">
                        <tr>
                            <c:forEach var="columnName" items="${result.columnNames}">
                                <th><c:out value="${columnName}"/></th>
                                </c:forEach>
                            
                        </tr>
                        <c:forEach var="row" items="${result.rows}">
                            <tr>
                                
                                <td><c:out value="${row.id}"/> </td>
                                <td><c:out value="${row.name}"/> </td>
                                <td><c:out value="${row.password}"/> </td>
                                <td><c:out value="${row.fullname}"/> </td>
                                <td><c:out value="${row.email}"/> </td>
                                
                                                          
                            </tr>
                        </c:forEach>
                            
                    </table>
    </div>
    <script src="js/jquery.min.js"></script>
    <script src="js/parallax.min.js"></script>
    <script>
        $(document).ready(function(){
            // Handle click on paging links
            $('.tm-paging-link').click(function(e){
                
                var page = $(this).text().toLowerCase();
                $('.tm-gallery-page').addClass('hidden');
                $('#tm-gallery-page-' + page).removeClass('hidden');
                $('.tm-paging-link').removeClass('active');
                $(this).addClass("active");
            });
        });
    </script>
</body>
</html>