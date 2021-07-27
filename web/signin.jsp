<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : Login
    Created on : Jul 2, 2021, 12:39:49 AM
    Author     : Alif Danish
        
                FOR LAKETOWN
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    
    <head>
        <link rel="stylesheet" href="css/style.css">
        <title>Joran Bukit Merah Laketown</title>
        
        <a href="adminlogin.jsp" class="closebtnx" onclick="this.parentElement.style.display='none';">&times;</a>
        
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <script> 
            function validate()
            { 
                var email = document.form.email.value; 
                var password = document.form.password.value;
                
                if (email == null || email == "")
                { 
                    alert("Email cannot be blank"); 
                    return false; 
                }
                else if(password==null || password=="")
                { 
                    alert("Password cannot be blank"); 
                    return false; 
                } 
            }
        </script>
    </head>
    <div>
        <style>
            body {
                background-image: url('img/bgjoran.jpg');
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: 100% 100%;
            }
            .alert {
                padding: 20px;
                color: grey;
            }
            
            .closebtn {
                margin-left: 20px;
                color: red;
                font-weight: bold;
                
                font-size: 22px;
                line-height: 20px;
                cursor: pointer;
                transition: 0.3s;
            }
            .closebtnx {
                margin-left: 20px;
                color: rgb(105,105,105);opacity:0.6;;
                font-weight: bold;
                
                font-size: 22px;
                line-height: 20px;
                cursor: pointer;
                transition: 0.3s;
            }
            
            .closebtn:hover {
                color: #02B7ED;
            }
            .closebtnx:hover {
                color: red;
            }
        </style>
    </div>
    <div class="wrapper fadeInDown">
        <h1>JORAN BUKIT MERAH LAKETOWN</h1>
        <div id="formContent">
            <!-- Tabs Titles -->
            <h2> <a href="signin.jsp" class="active"> Log In </a></h2>
            <h2> <a href="registration.jsp" class="inactive underlineHover">Sign Up </a></h2>
            
            <!-- Icon -->
            <div class="fadeIn first">
                <img src="img/joran.jpg" id="icon" alt="User Icon"
                     width="50" 
                     height="250"/>
            </div>
            <tr> <!-- refer to the video to understand request.getAttribute() -->
                
                <div class="alert">
  <span class="closebtn" onclick="this.parentElement.style.display='none';"><strong><%=(request.getAttribute("errMessage") == null) ? ""
                                : request.getAttribute("errMessage")%></strong></span>
</div>
                
            </tr>
            <!-- Login Form -->
            <form name="form" action="LoginServlet" method="post" onsubmit="return validate()">
                
                <input type="text" id="login" class="fadeIn second" name="email" placeholder="email" >
                
                <input type="password" id="password" class="fadeIn third " name="password" placeholder="password">
                
                
                <input type="submit" class="fadeIn fourth" value="Login">
            </form>
            
            <!-- Remind Passwwrd -->
            <div id="formFooter">
                <a class="underlineHover" href="registration.jsp">Forgot Password?</a>
            </div>
            
        </div>
    </div>
</html>