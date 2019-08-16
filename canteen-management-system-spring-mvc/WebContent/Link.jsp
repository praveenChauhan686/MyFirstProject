<%@page import="com.canteen.dto.UserRegistrationForm"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   <%
UserRegistrationForm user = (UserRegistrationForm) session.getAttribute("user");
    
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate"); //HTTP 1.1

response.setHeader("Pragma", "no-cache"); //HTTP 1.0

response.setHeader("Expires", "0");//proxies

if(session.getAttribute("user")==null)  //this is because if anyone try to get into login by puting in url as /home.jsp its will not work
response.sendRedirect("homePage.jsp"); 

%> 
    
<!DOCTYPE html>
<html>
    <head>
        <script>
	window.history.replaceState(null,null,window.location.href);
    </script>
     
<style>
*{
    margin: 0px;
    padding: 0px;
}


body{
    background-color: azure;
    margin-left: 250px;
    margin-top: 20px;
}

#container ul{
    list-style: none;
}

#container ul li{
    background-color: rgb(226, 192, 43);
    width: 150px;
    border: 1px solid white;
    height: 50px;
    line-height: 50px;
    text-align: center;
    float: left;
    color: white;
    font-size: 19px;
    position: relative;
    border-radius: 26px;
    cursor: pointer;
}

#container ul li:hover{
    background-color: aqua;
}

#container ul ul{
    display: none;
}

#container ul li:hover > ul{
    display: block;
}

#container ul ul ul{
    margin-left: 150px;
    top: 0px;
    position: absolute;
}

</style>

<script>
 
    window.addEventListener("keypress", checkKeyPress, false);
    // The parameters of the event listener are event, function to run, useCapture (optional).
    // This event listener runs checkKeyPress function when a key is pressed down
    // You can use keydown or keyup to check what key has been pressed or released
     
     
    // this function checks to see if the letter 'a' key has been pressed
    function checkKeyPress(key) {
     if (key.keyCode == "65") {
     alert("The 'a' letter key has been pressed.");
     // 65 is the keycode that is returned when the 'a' letter key is pressed
     // if you use keypress event instead of keydown/up then you must use ASCII code instead of keycode
     }
    }
     
    </script>



	
    </head>

    <body>
        <div id="container">
           <ul>
              <li class="btn btn-">Data Entry
                <ul>
                    <li><a href="C:\project\project27-6\project3\Admin-User1\data_entry\dataEntryPerson.html">Person</a></li>
                    <li><a href="C:\project\project27-6\project3\Admin-User1\data_entry\DataEntry.html">Items</a></li>
                    <li><a href="C:\project\project27-6\project3\Admin-User1\data_entry\dataEntryCourse.html">Course</a></li>
                    
                    <li>Section</li>
                    <li>Cash Entry
                        <ul>
                            <li>Deposit Entry</li>
                            <li>Deposit Modify</li>
                            <li>Monthly Run</li>              
                         </ul>
                    </li>
      
                 </ul>

              </li>
              <li>Modify

                <ul>
                    <li><a href="C:\project\project27-6\project3\Admin-User1\modify\modifyItem.html">Update Item</a></li>
                    <li><a href="C:\project\project27-6\project3\Admin-User1\modify\modifyPerson.html">Update Person</a></li>
                    <li><a href="C:\project\project27-6\project3\Admin-User1\modify\updateCourse.html">Update Course</a></li>
                    <li><a href="C:\project\project27-6\project3\Admin-User1\modify\updateItem.html">Upadate Item1</a></li>
         
                    <li><a href="C:\project\project27-6\project3\Admin-User1\modify\updateName.html">Update Name</a></li>
                    <li><a href="C:\project\project27-6\project3\Admin-User1\modify\updateSection.html">Update Section</a></li>     
                 </ul>
              </li>
              <li>Reports
                <ul>
                    <li><a href="menucheck1.htm">Menu<%--String uname = request.getParameter("username"); 
                                           	session.setAttribute("ss",uname);--%></a></li>
                    <li>Item</li>
                    <li>Person</li>
                    <li>Performance</li>
                    <li>Official Guest</li>
                    <li>Backups 
                        <ul>
                            <li>Item Price</li>
                            <li>Person</li>              
                         </ul>
                    </li>
                    <li><a href="monthlyItemReport.jsp">Monthly Report</a></li>
                    <li>Cash Deposit</li>
                    <li>Cash Deposit Return</li>              
                 </ul>


              </li>
              <a href="menucheck1.htm"><li>AddMenu</li></a>
              <a href="transac.htm"><li>Transaction</li></a>
             <a href="logout.htm"><li>Exit</li></a> 

           </ul>

        </div>
    </body>
</html>