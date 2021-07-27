<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" %>
<%@ page import ="java.sql.*;"%>
<sql:setDataSource var="myDatasource"
                   driver="org.apache.derby.jdbc.ClientDriver"
                   url="jdbc:derby://localhost:1527/laketown" user="app"
                   password="app"/>
<%-- 
    Document   : viewForm
    Created on : Jun 26, 2021, 8:36:53 PM
    Author     : Alif Danish
        
                        FOR LAKETOWN
--%>
    
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
                <button onclick="location.href = 'adminhome.jsp';" class="button">&laquo;&laquo;</button>
                <header class="row tm-welcome-section">
                    
                    <h2 class="col-12 text-center tm-section-title">View User</h2>
                </header>
                <div class="tm-container-inner-2 tm-contact-section">   
                    <c:set var="id" value="${param.id}"/>
                    <c:set var="name" value="${param.name}"/>
                    <c:set var="fullname" value="${param.fullname}"/>
                    <c:set var="email" value="${param.email}"/>
                        
                    <sql:update var="Update" dataSource="${myDatasource}">
                        UPDATE USERS
                        SET name=?, password=?, fullname=?, email=?
                        WHERE id=? 
                            
                        <sql:param value="${name}"/>
                        <sql:param value="${password}"/>
                        <sql:param value="${fullname}"/>
                        <sql:param value="${email}"/>
                        <sql:param value="${id}"/>
                    </sql:update>
                  <div id="test">        
                    
                    <br>
                    <sql:query var="result" dataSource="${myDatasource}">
                        SELECT id,name,password,fullname,email FROM USERS
                    </sql:query>
                      
                    <table id="event" border="1">
                        <tr>
                            <c:forEach var="columnName" items="${result.columnNames}">
                                <th><c:out value="${columnName}"/></th>
                                </c:forEach>
                            <th style="width:10px">Delete</th>
                        </tr>
                        <c:forEach var="row" items="${result.rows}">
                            <tr>
                                
                                <td><c:out value="${row.id}"/> </td>
                                <td><c:out value="${row.name}"/> </td>
                                <td><c:out value="${row.password}"/> </td>
                                <td><c:out value="${row.fullname}"/> </td>
                                <td><c:out value="${row.email}"/> </td>
                                <td><a href="deleteuser.jsp?id=${row.id}"><input type="submit" value="Delete Data" /></a></td>
                                                          
                            </tr>
                        </c:forEach>
                            
                    </table>  
                      
                  </div>
                       <p>
                            <input type="button" value="Create PDF" 
                                id="btPrint" onclick="createPDF()" />
                       </p>
                </div>
            </main>
            <footer class="tm-footer text-center">
            </footer>
        </div>
        <script src="js/jquery.min.js"></script>
        <script src="js/parallax.min.js"></script>
        <script>
    function createPDF() {
        var sTable = document.getElementById('test').innerHTML;

        var style = "<style>";
        style = style + "table {width: 100%;font: 17px Calibri;}";
        style = style + "table, th, td {border: solid 1px #DDD; border-collapse: collapse;";
        style = style + "padding: 2px 3px;text-align: center;}";
        style = style + "</style>";

        // CREATE A WINDOW OBJECT.
        var win = window.open('', '', 'height=1000,width=1000');

        win.document.write('<html><head>');
        win.document.write('<title>USER PROFILE</title>');   // <title> FOR PDF HEADER.
        win.document.write(style);          // ADD STYLE INSIDE THE HEAD TAG.
        win.document.write('</head>');
        win.document.write('<body>');
        win.document.write(sTable);         // THE TABLE CONTENTS INSIDE THE BODY TAG.
        win.document.write('</body></html>');

        win.document.close(); 	// CLOSE THE CURRENT WINDOW.

        win.print();    // PRINT THE CONTENTS.
    }
</script>    
    </body>
</html>