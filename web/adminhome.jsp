<%-- 
    Document   : adminhome
    Created on : Jul 17, 2021, 12:00:12 AM
    Author     : Alif Danish
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
            .button {
              padding: 15px 25px;
              font-size: 20px;
              text-align: center;
              cursor: pointer;
              outline: none;
              color: #fff;
              background-color: #04AA6D;
              border: none;
              border-radius: 15px;
              box-shadow: 0 9px #999;
            }

            .button:hover {background-color: #3e8e41}

            .button:active {
                background-color: #3e8e41;
                box-shadow: 0 5px #666;
                transform: translateY(4px);
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
                        <div >
                            <h1 class="tm-site-title">JORAN BUKIT MERAH</h1>
                            <h1 class="tm-site-description">LAKETOWN</h1>
                            <h2 class="tm-site-title" style="color: red" >ADMINISTRATION PAGE </h2>
                            Welcome <%=request.getAttribute("userName") %>
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
                    <h1 class="col-12 text-center tm-section-title">ADMINISTRATION PAGE</h1>
                </header>
                
                <h2 class=" col-12 text-center" style="margin-bottom: 40px"> ADMIN SITE : TOURNAMENT </h2>
                
                <div class="tm-paging-links">
                    <button onclick="location.href = 'vieweventBooking.jsp';" class="button">View Tournament</button>
                     <button onclick="location.href = 'viewEvent.jsp';" class="button">Edit Tournament</button>
                </div>
                
                <h2 class=" col-12 text-center" style="margin-bottom: 40px"> ADMIN SITE : BOOKING POND </h2>
                
                <div class="tm-paging-links">
                    <button onclick="location.href = 'viewpondBooking.jsp';" class="button">View Booking</button>
                    <button onclick="location.href = 'viewPond.jsp';" class="button">Edit FishingPond</button>
                </div>
                
            </main>
                
            <footer class="tm-footer text-center">
            </footer>
        </div>
        <script src="js/jquery.min.js"></script>
        <script src="js/parallax.min.js"></script>

    </body>
</html>
