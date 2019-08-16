<%@page import="com.canteen.dto.UserRegistrationForm"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spr"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>


    <link rel="stylesheet" href="css/3.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body >

    <div class="wrapper fadeInDown">
                <div id="formContent">
                  <!-- Tabs Titles -->
              
                  <!-- Icon -->
                  <div class="fadeIn first">
                    <img src="images/img345.jpg" id="icon" alt="User Icon" />
                  </div>
              
                  <!-- Login Form -->
                  <form action="login1.htm" modelAttribute="user" method="post">
                    <input type="text" id="login" class="fadeIn second" name="UserName" placeholder="login" title="Enter your User Name" path="UserName" />
                    <input type="password" id="password" class="fadeIn third" name="Password" placeholder="password" title="Enter your Passowrd" path="Password" /><br>
                    <div >
                    <div ><input type="submit" class="fadeIn fourth" value="Log In"></div>
                   <div > <a href="userRegistration.jsp"><input type="button"  value="New User" ></a></div>
                   </div>
                  </form>
              
                  <!-- Remind Passowrd -->
                  <!-- <div id="formFooter">
                    <a class="underlineHover" href="#">Forgot Password?</a>
                  </div> -->
              
                </div>
        </div>
    
   
</body>
</html>