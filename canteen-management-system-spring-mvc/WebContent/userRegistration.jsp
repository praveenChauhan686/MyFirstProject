<%@page import="com.canteen.dto.UserRegistrationForm"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spr"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>  

   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New User</title>
<script>
	window.history.replaceState(null,null,window.location.href);
    </script>
    <script>
    

    function emailIdValidation(){
    	
    	console.log("here...");
        var email = document.getElementById('emailId');
        var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

        if(!isEmpty() && !filter.test(email.value)) {

        document.getElementById("emailSpan").innerHTML="\n Please provide a valid email address";
        document.getElementById("emailSpan").style.color="red";
        
        return false;
        }
        else{
            document.getElementById("emailSpan").innerHTML=" ";
           return true;
        }
    }

    function passwordFun(){
        var regName = /^[a-zA-Z]+$/;
        var passid = document.getElementById('pass').value;
        var passid_len = passid.length;
        if (passid_len == 0 || passid_len < 8 || passid_len > 12) {
            document.getElementById("SpanPass").innerHTML = "Password should not be empty and length of 8-12";
            document.getElementById("SpanPass").style.color = "red";

            return false;
        } else {
            document.getElementById("SpanPass").innerHTML = ""
                
            return true;
        }
    }

    </script>
    <link rel="stylesheet" href="css/4.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>


   
    <div class="wrapper fadeInDown">
        <div id="formContent">
            <!-- Tabs Titles -->

            <!-- Icon -->
            <div class="fadeIn first">
                    <img src="images/img345.jpg" id="icon" alt="User Icon" />
            </div>

            <!-- Login Form -->
            <form action="reg.htm" id="newuser" commandName="user" method="post">
            
            <input type="text" class="fadeIn second" name="UserId" required placeholder="User ID" title="Enter your User Id"  >
            <input type="text"     class="fadeIn second" name="UserName"  required placeholder="User Name" title="Enter your User Name" >
            <input type="email"    id="emailId" class="fadeIn second" name="EmailId"     required placeholder="Email-id"  title="Enter valid Email-id"  >
            <input type="password" id="pass" class="fadeIn second" name="Password"  required placeholder="Password"  title="Enter your Password"  >
            

			<div  class="d-flex justify-content-between align-items-center" >
					<div style="align-content: center">
				 		<input type="submit"  class="fadeIn fourth" value="Register" style="width:58px;" >  
					</div>
					
					<div style="align-items: center">
						<input type="button"  class="fadeIn fourth" value="Reset"    style="width:58px;" onclick="myFunction()" >
					</div>
			</div>
     
    <form>
            <!-- Remind Passowrd -->
            <!-- <div id="formFooter">
            <a class="underlineHover" href="#">Forgot Password?</a>
            </div> -->

        </div>
    </div>
    <script>
            function myFunction() {
              document.getElementById("newuser").reset();
            }
            </script>
    






</body>
</html>