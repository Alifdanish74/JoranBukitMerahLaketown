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
                                <li class="tm-nav-li"><a href="Home.jsp" class="tm-nav-link  " style="font-size:20px" >Home</a></li>
                                <li class="tm-nav-li"><a href="about.jsp" class="tm-nav-link" style="font-size:20px">About</a></li>
                                <li class="tm-nav-li"><a href="contact.jsp" class="tm-nav-link active" style="font-size:20px">Contact</a></li>
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
				<h2 class="col-12 text-center tm-section-title">Contact Page</h2>
				<p class="col-12 text-center">You can register to join one of our Fishing Competition thru this website.</p>
                                <div class="tm-address-box">
                                    <br><br>
							<h4 class="text-center tm-info-title tm-text-success">Our Address</h4>
							<address>
								Kolam Pancing Joran Bukit Merah LakeTown, 34400 Simpang Empat Semanggol, Perak, Malaysia
							</address>
							<a href="tel:0134558268" class="tm-contact-link">
								Phone No: 0134558268
							</a>
							<a href="JoranBukitMerah@gmail.com" class="tm-contact-link">
								Email: <i class="fas fa-envelope tm-contact-icon"></i>JoranBukitMerah@gmail.com
							</a>
						</div>
			</header>

	
<!-- How to change your own map point
	1. Go to Google Maps
	2. Click on your location point
	3. Click "Share" and choose "Embed map" tab
	4. Copy only URL and paste it within the src="" field below
-->
			<div class="tm-container-inner-2 tm-map-section">
				<div class="row">
					<div class="col-12">
                                            <h2 class="col-12 text-center tm-section-title">Our Location</h2>
						<div class="tm-map">
							<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7949.468049546503!2d100.66458710812927!3d4.983798900000058!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x303557a6d70c61e9%3A0x319a8b82b8bb7e6b!2sKolam%20Pancing%20Bukit%20Merah!5e0!3m2!1sen!2smy!4v1626691134306!5m2!1sen!2smy" width="1000" height="700" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
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
