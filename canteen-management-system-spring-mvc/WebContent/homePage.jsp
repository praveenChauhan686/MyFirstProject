<%@page import="com.canteen.dto.UserRegistrationForm"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
   

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Canteen Home</title>


    <link rel="stylesheet" href="css/2.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <script>
            function startTime() {
              var today = new Date();
              var h = today.getHours();
              var m = today.getMinutes();
              var s = today.getSeconds();
              m = checkTime(m);
              s = checkTime(s);
              document.getElementById('txt').innerHTML =
              h + ":" + m + ":" + s;
              var t = setTimeout(startTime, 500);
            }
            function checkTime(i) {
              if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
              return i;
            }
            </script>
</head>
 <body onload="startTime()">
                <div class="container">
                  <div class="row">
                    <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                      <div class="card card-signin my-5">
                        <div class="card-body">
                            
                                <img src="images/CDAC-Course-Details.jpg" alt="Smiley face" width="400" height="150">
                                <div class="row ">
                                    <div class="col-3"></div>
                                    <div class="col-3"><h5>TIME</h5></div>
                                    <div class="col-6"><h5></h><div id="txt"></div><h5></h5></div>
                                </div>
                                
                          <h5 class="card-title text-center">C-DAC Canteen</h5>
                          <form class="form-signin" action="login_form.htm">
                            <!-- <div class="form-label-group">
                              <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
                              <label for="inputEmail">Email address11</label>
                            </div> -->
              
                            <!-- <div class="form-label-group">
                              <input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
                              <label for="inputPassword">Password</label>
                            </div> -->
              
                            <!-- <div class="custom-control custom-checkbox mb-3">
                              <input type="checkbox" class="custom-control-input" id="customCheck1">
                              <label class="custom-control-label" for="customCheck1">Remember password</label>
                            </div> -->
                          <!--  <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Sign in</button><br><br>-->
                                  <a href="prep_login_form.htm">  <input type="button" class="btn btn-lg btn-primary btn-block text-uppercase" value="Sign IN"> </a> <br><br>
                   
                           <a href="prep_reg_form.htm">  <input type="button" class="btn btn-lg btn-primary btn-block text-uppercase" value="New User"> </a> 

                            <!-- <hr class="my-4"> -->
                            <!-- <button class="btn btn-lg btn-google btn-block text-uppercase" type="submit"><i class="fab fa-google mr-2"></i> Sign in with Google</button>
                            <button class="btn btn-lg btn-facebook btn-block text-uppercase" type="submit"><i class="fab fa-facebook-f mr-2"></i> Sign in with Facebook</button> -->
                          </form>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </body>
 

</html>