<%-- 
    Document   : editForm
    Created on : Jun 25, 2021, 11:07:08 PM
    Author     : Alif Danish
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
    
<sql:setDataSource var="myDatasource"
                   driver="org.apache.derby.jdbc.ClientDriver"
                   url="jdbc:derby://localhost:1527/laketown" user="app"
                   password="app"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    
<html>
    
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Admin-View User</title>
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet" />
        <link href="css/all.min.css" rel="stylesheet" />
        <link href="css/templatemo-style.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
                            <h2 class="tm-site-title" style="color: red" >ADMINISTRATION PAGE </h2>
                        </div>
                        <div class="row tm-header-inner">   
                            <nav class="col-md-6 col-12 tm-nav">
                                
                                <ul class="tm-nav-ul">
                                    <li class="tm-nav-li"><a href="Home.jsp" class="tm-nav-link " style="font-size:20px" >Home</a></li>
                                    <li class="dropdown tm-nav-li">
                                    <a href="javascript:void(0)" class="tm-nav-link">Event</a>
                                    <div class="dropdown-content">
                                        <a href="vieweventBooking.jsp" class="tm-nav-link">View Event</a>
                                        <a href="viewEvent.jsp" class="tm-nav-link">Edit Event</a>
                                    </div>
                                    <li class="dropdown tm-nav-li">
                                    <a href="javascript:void(0)" class="tm-nav-link">Pond</a>
                                    <div class="dropdown-content">
                                        <a href="viewpondBooking.jsp" class="tm-nav-link">View Booking</a>
                                        <a href="viewPond.jsp" class="tm-nav-link">Edit Pond</a>
                                    </div>
                                    <li class="dropdown tm-nav-li">
                                    <a href="javascript:void(0)" class="tm-nav-link">Menu</a>
                                    <div class="dropdown-content">
                                        <a href="viewuser.jsp" class="tm-nav-link">View User</a>
                                        <a href="AdminLogoutServlet" class="tm-nav-link">Logout</a>
                                    </div>
                                </ul>
                            </nav>	        
                        </div>
                    </div>
                </div>
            </div>
                
            <main>
                <header class="row tm-welcome-section">
                    <h2 class="col-12 text-center tm-section-title">View User</h2>
                </header>
                <div class="tm-container-inner-2 tm-contact-section">   
                   
                    <h1>List Employee</h1>
                    <br>
                    <% String ID = request.getParameter("id"); %>
                    
                    <sql:query var="result" dataSource="${myDatasource}">
                        SELECT * FROM USERS 
                        WHERE id = <%=ID %>
                    </sql:query>
                        
                        
                    <sql:update var="res" dataSource="${myDatasource}">
                        DELETE FROM USERS WHERE ID = <%= ID %>
                    </sql:update>
                        
                    <table id="event" border="1">
                        <form action="viewuser.jsp" method="POST">
                        <tr>
                            <c:forEach var="columnName" items="${result.columnNames}">
                                <th><c:out value="${columnName}"/></th>
                                </c:forEach>
                        </tr>
                        <c:forEach var="row" items="${result.rows}">
                            <tr>
                                
                                <td><c:out value="${row.id}"/> </td>
                                <td><c:out value="${row.name}"/> </td>
                                <td><c:out value="${row.fullname}"/> </td>
                                <td><c:out value="${row.password}"/> </td>
                                
                                <td><c:out value="${row.email}"/> </td>
                                <td><input type="hidden" name="id" value="${row.id}" /></td>
                                <td><input type="submit" value="Delete Data" /></td>       
                            </tr>
                        </c:forEach>
                        </form>
                    </table>
                  
                        
                        
                </div>
            </main>
            <footer class="tm-footer text-center">
            </footer>
        </div>
        <script src="js/jquery.min.js"></script>
        <script src="js/parallax.min.js"></script>
            
    </body>
</html>