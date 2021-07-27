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
    </head>
    <div>
        <style>
            body {
                background-image: url('img/bgjoran.jpg');
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: 100% 100%;
            }
        </style>
    </div>
    <div class="wrapper fadeInDown">
        <h1>JORAN BUKIT MERAH LAKETOWN</h1>
        <div id="formContent">
            <!-- Tabs Titles -->
            <h2> <a href="signin.jsp" class="inactive underlineHover"> Log In </a></h2>
            <h2><a href="/registration.jsp" class="active">Sign Up </a></h2>
            
            
            <!-- Login Form -->
            <form name="form" action="RegisterServlet" method="post" onsubmit="return validate()">
                
                <input type="text" class="fadeIn second" name="fullname" placeholder="fullname">
                
                <input type="text" class="fadeIn second" name="username" placeholder="username">
                
                <input type="text" class="fadeIn second"name="email" placeholder="email">
                
                <input type="password" class="fadeIn third" name="password" placeholder="password">
                
                <input type="password" class="fadeIn second" name="conpassword" placeholder="confirm password">
                
                <td><span style="color:red"><%=(request.getAttribute("errMessage") == null) ? ""
                                        : request.getAttribute("errMessage")%></span></td>
                <input type="submit" class="fadeIn fourth" value="SignUp">
            </form>
                
                
                
                
                
                
            
            <!-- Remind Passwwrd -->
            <div id="formFooter">
                <a class="underlineHover" href="#">Forgot Password?</a>
            </div>
            
        </div>
    </div>
</html>
