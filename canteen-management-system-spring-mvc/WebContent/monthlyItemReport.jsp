<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@page import="com.canteen.dto.*"%>
 <%@page import="java.util.List"%>
<%@page import="java.time.LocalDate"%>    
<%@ page import="java.text.SimpleDateFormat" %>  <%--for date --%>    
<%--@ taglib uri="http://www.springframework.org/tags/form" prefix="spr" --%>    
    
<%!
  	List <Daily>userList=null;
    int n=1;
  %> 
 
 
                                                                                                                                           
<!DOCTYPE html>
<html>
    <head>
    
    <script>
	window.history.replaceState(null,null,window.location.href);
    </script>
        <script>
     function print123(value)
     {
        var rest1 = document.body.innerHTML;
        var print1 = document.getElementById(value).innerHTML;
        document.body.innerHTML = print1;
        window.print();
        document.body.innerHTML = rest1;
               
     }
      </script> 
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>
    
   
        <div class="card text-center " style="height: 100%; background-image: linear-gradient(160deg,orange,white,green);font-family: 'Times New Roman', Times, serif;font-size: 23px">
            <div class="card-header" style="height:20%">
            
             <div class="row">
                <label class=" col-2 font-weight-bolder text-dark"for="exampleInputEmail1">Date :</label>
                <% SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
                		Date date = new Date();
                		//System.out.println(formatter.format(date)) ;
                		%>    <%--******date Print***** --%>
               
                <label class=" col-2 font-weight-bolder text-dark"for="exampleInputEmail1"><%=formatter.format(date) %></label> 
                </div>
                
                
		 <form >
		 
                <div class="row mt-3">
                        <label class=" col-2 font-weight-bolder text-dark"for="exampleInputEmail1">Month :</label>
                         <input type="text" name="month" class="form-control col-3 " required style="box-shadow: 1px 2px 3px 4px #4cc912;" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Item Id" required autocomplete="on" autofocus>
                              
                        <label class=" col-2 font-weight-bolder text-dark"for="exampleInputEmail1">Year (YYYY) :</label>
                         <input type="text" name="year" class="form-control col-3 " required style="box-shadow: 1px 2px 3px 4px #4cc912;" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Item Id" required autocomplete="on" autofocus>      
                </div>

                        
              
            </div>
        
            <div class="card-body" style="height:80%">

                    <div class="row mt-3">
                            <div class="col-3"></div>
                            <div class="col-6">
                              
                                <button  type="submit" formaction="dateretrieve.htm" class="btn btn-primary col-2">Retrive</button>
                                <button  type="button" onclick="print123('print')" class="btn btn-secondary col-2">Print</button>                            
                                <a href="Link.jsp"><button  type="button"  class="btn btn-secondary col-2" >Close</button></a>
        
                            </div>
                            <div class="col-3"></div>
                      </div>
                    <div class="row mt-3">
                        
                                
                         <div id="print" class=" col-12" style="height: 100%;  overflow: auto; background-color: white;">
                         <table  style="align-content :center;width: 100%">
                          <tr align="right">
                          <th> <label class="font-weight-bolder text-dark"for="exampleInputEmail1"><%=formatter.format(date)%></label></th>
                          </tr>
                       
                         <tr>
                         <th align="center">Monthly Details</th>
                         </tr>
                                     
                         <tr>
                         <th>Item Name</th>
                         <th>Course Name</th>
                         
                         </tr>
                         	
                       
                       <% userList = (List<Daily>)request.getAttribute("ul");
                       if(userList != null && !userList.isEmpty()){
                       for(Daily u : userList){
                    	   
                    	 //  System.out.println(u.getItemName()+u.getItemId()+u.getCourseId()+u.getItemType()+u.getItemPrice());
                    	   
                    	   
		               %>
                          
            	 <tr>
            	 <td><%=u.getItemname()%></td>
                 <td><%=u.getCoursename()%></td>
                
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
        </form>
        </div>
    </body>
</html>