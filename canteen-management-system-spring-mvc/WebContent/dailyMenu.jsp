<%@page import="javax.xml.ws.Response"%>
<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page import="java.text.SimpleDateFormat" %>  <%--for date --%>
  <%@ page import="java.util.*" %>
  <%@ page import="java.sql.Connection,java.sql.DriverManager,java.sql.SQLException,java.sql.PreparedStatement,java.sql.ResultSet,java.sql.Statement" %>  
  <%@page import="com.canteen.dto.*"%>
  <%@page import="java.util.List"%>
  
  <%!
  	List <Item>userList=null;
    List <Menu>userList1= null;
    int n=1;
  %>
 
            


<!DOCTYPE html>
<html>
    <head>
    
     <script>
     function print123(value)
     {
        var rest1 = document.body.innerHTML;
        var print1 = document.getElementById(value).innerHTML;
        document.body.innerHTML = print1;
        window.print();
        document.body.innerHTML = rest1;
               
     }
      
    function myfun()
    {
        window.print();
    }
   </script>
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>





<body>
    <div class="card text-center " style="height: 100%; background-image: linear-gradient(160deg,orange,white,green);font-family: 'Times New Roman', Times, serif; font-size: 23px; position: sticky; top:0; z-index:9999;">
           
          
           
            <div class="card-header" style="height: 20%">
                <form action="dailyMenu.htm" method="post">
               
              <div class="row">
                   <label class=" col-2 font-weight-bolder text-dark"for="exampleInputEmail1">Date :</label>
                   <% SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
                		Date date = new Date();
                		//System.out.println(formatter.format(date)) ;
                		%>    <%--******date Print***** --%>
                   <label class=" col-2 font-weight-bolder text-dark"for="exampleInputEmail1"><%=formatter.format(date) %></label>
              </div>

              <div class="row mt-3">
                 
                   <label class=" col-2 font-weight-bolder text-dark" >Service:</label>
                             <select id="select" name="select1" onchange="this.form.submit(); "class="form-control " required style="box-shadow: 1px 2px 3px 4px #4cc912; width:250px">
                                     <option value="-1">Choose option</option>
                  <%System.out.println("in dailyMenu but before userList1"); 
                              if(n==-1){
                          userList1 = (List<Menu>)request.getAttribute("menu");
                		System.out.println("in dailyMenu but after userList1 and before for");
                		 for(Menu u : userList1)	
                		 {%> 
                                     <option value="<%=u.getService()%>" ><%=u.getService()%></option>
                         <%
                         } 
                                       }
                         %>
                             </select>                  
             </div>

          </div>
        
 
   <div class="card-body" style="height:80%; width:100%">

                    <div class="row mt-3">
                            <div class="col-3"></div>
                            <div class="col-6">
                                <button onclick="window.location.href = 'dailyMenu.htm';" type="button" class="btn btn-primary col-2" >Retrive</button>
                                <button  type="button" class="btn btn-secondary col-2">Alter Menu</button>
                                <button  type="button" class="btn btn-secondary col-2" onclick="print123('print');">Print</button>
                                <button  type="submit" class="btn btn-secondary col-2">Close</button>
        
                            </div>
                            <div class="col-3"></div>
                    </div>
                    </form>
                    
                    <div class="row mt-3">
                                
                         <div id="print" class=" col-12" style="height: 100%;  overflow: auto; background-color: white;">
                         <table  style="align-content :center;width: 100%">
                          <tr align="right">
                          <th> <label class="font-weight-bolder text-dark"for="exampleInputEmail1"><%=formatter.format(date) %></label></th>
                          </tr>
                       
                        
                                     
                         <tr>
                         <th>Item Name</th>
                         <th>Item Id</th>
                     
                         <th>Item Type</th>
                         <th>Item Price</th>
                         </tr>
                         	
                       
                       <%if(n==-1){
      				    userList = (List<Item>)request.getAttribute("ul");
      				  
      				  
                       for(Item u : userList){
                    	   
                    	 //  System.out.println(u.getItemName()+u.getItemId()+u.getCourseId()+u.getItemType()+u.getItemPrice());
                    	   
                    	   
		               %>
                          
            	 <tr>
            	 <td><%=u.getItemName()%></td>
                 <td><%=u.getItemId()%></td>
                 
                 <td><%=u.getItemType()%></td>
                 <td><%=u.getItemPrice()%></td>
                 </tr>
                              
                      <%} 
                      
                      }
                      
                      else{
                    	 n++;
                      }%>   
                         
                         </table>
                         
                         </div>   
  
                    </div>                      
            </div>
       
         
    </body>
</html>