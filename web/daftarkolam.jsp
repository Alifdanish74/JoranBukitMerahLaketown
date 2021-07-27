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
            h4{
                height: 54px;
            }
                        /* The Modal (background) */
            .modal {
              display: none; /* Hidden by default */
              position: fixed; /* Stay in place */
              z-index: 1; /* Sit on top */
              padding-top: 100px; /* Location of the box */
              left: 0;
              top: 0;
              width: 100%; /* Full width */
              height: 100%; /* Full height */
              overflow: auto; /* Enable scroll if needed */
              background-color: rgb(0,0,0); /* Fallback color */
              background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            }

            /* Modal Content */
            .modal-content {
              display: block;
              background-color: #fefefe;
              margin: auto;
              padding: 20px;
              border: 1px solid #888;
              width: 50%;
            }

            /* The Close Button */
            .close {
              color: #aaaaaa;
              float: right;
              font-size: 28px;
              font-weight: bold;
            }

            .close:hover,
            .close:focus {
              color: #000;
              text-decoration: none;
              cursor: pointer;
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
                        <td><span style="color:red"><%=(request.getAttribute("errMessage") == null) ? ""
                                        : request.getAttribute("errMessage")%></span></td>
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
                    <h2 class="col-12 text-center tm-section-title">Fishing Pond Booking</h2>
                </header>
                    <% String ID = request.getParameter("id"); %>
                <div class="tm-container-inner-2 tm-contact-section">
                    <form action="DaftarKolamServlet" method="post">
                        <sql:query var="result" dataSource="${myDatasource}">
                                SELECT * FROM KOLAM 
                                WHERE id = <%=ID %>
                            </sql:query>
                    <c:forEach var="row" items="${result.rows}">

                        <header class="row tm-welcome-section">
                    <h2 class="text-center">${row.pondname}</h2>
                    <input type="hidden" name="pondname" value="${row.pondname}"/>
                        </header>
                        <div class="form-group">
                            <input type="text" name="fullname" class="form-control" placeholder="Fullname" required="" />
                        </div>
                            
                        <div class="form-group">
                            <input type="text" name="email" class="form-control" placeholder="Email" required="" />
                        </div>
                            
                        <div class="form-group">
                            <input type="text" name="phoneNo" class="form-control" placeholder="Phone Number" required=""/>
                        </div>
                        
                        <div class="form-group">
                            <input type="date" name="bookingdate" class="form-control" required=""/>
                        </div>
                            <td><span style="color:red"><%=(request.getAttribute("errMessage") == null) ? ""
                                        : request.getAttribute("errMessage")%></span></td>
                        <div class="form-group tm-d-flex">
                            <button type="submit" class="tm-btn tm-btn-success tm-btn-center">
                                Booking
                            </button>
                        </div>
                    </c:forEach>
                    </form>
                </div>

            </main>
            
        <footer class="tm-footer text-center">
        </footer>
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
                // Get the modal
        var modal = document.getElementById("myModal");

        // Get the button that opens the modal
        var btn = document.getElementById("myBtn");

        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];

        // When the user clicks the button, open the modal 
        btn.onclick = function() {
          modal.style.display = "block";
        }

        // When the user clicks on <span> (x), close the modal
        span.onclick = function() {
          modal.style.display = "none";
        }

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
          if (event.target == modal) {
            modal.style.display = "none";
          }
        }
    </script>
</body>
</html>