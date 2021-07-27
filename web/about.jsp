<%-- 
    Document   : about
    Created on : Jul 19, 2021, 5:52:55 PM
    Author     : Alif Danish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>LakeTown - About Page</title>
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet" />
        <link href="css/all.min.css" rel="stylesheet" />
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
                        <div >
                            <h1 class="tm-site-title">JORAN BUKIT MERAH</h1>
                            <h1 class="tm-site-description">LAKETOWN</h1>	     
                        </div>
                        <div class="row tm-header-inner" >   
                        <div class="col-md-6 col-12 tm-nav">
                            <ul class="tm-nav-ul">
                                <li class="tm-nav-li"><a href="Home.jsp" class="tm-nav-link " style="font-size:20px" >Home</a></li>
                                <li class="tm-nav-li"><a href="about.jsp" class="tm-nav-link active" style="font-size:20px">About</a></li>
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
                    <h2 class="col-12 text-center tm-section-title">About Our Company</h2>
                    <p class="col-12 text-center">Kami menyediakan pengalaman memancing di kolam yang sangat menarik dan anda pasti berpuas hati !</p>
                </header>
                    
                <div class="tm-container-inner tm-persons">
                    <div class="row">
 
                    </div>
                </div>
                <div class="tm-container-inner tm-history">
                    <div class="row">
                        <div class="col-12">
                            <div class="tm-history-inner">
                                <img src="img/kolam.jpg" alt="Image" class="img-fluid tm-history-img" />
                                <div class="tm-history-text"> 
                                    <h4 class="tm-history-title">History of our company</h4>
                                    <p class="tm-mb-p">Kami bermula dengan hanya membuka sebuah kolam memancing kecil pada tahun 2016 di sebuah tanah di Bukit Merah, Perak .</p>
                                    <p>Setelah hampir 5 tahun kami beroperasi, kami mula mengadakan pertandingan memancing dan membuka lebih banyak kolam memancing yang lebih besar. Kini, kami mempunyai lebih dari 3 kolam memancing ai tawar dan 1 kolam memancing air masin </p>
                                </div>
                            </div>	
                        </div>
                    </div>
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
