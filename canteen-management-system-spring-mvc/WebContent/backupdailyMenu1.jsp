<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page import="java.text.SimpleDateFormat" %>  <%--for date --%>
  <%@ page import="java.util.*" %>
  <%@ page import="java.sql.Connection,java.sql.DriverManager,java.sql.SQLException,java.sql.PreparedStatement,java.sql.ResultSet,java.sql.Statement" %>  
<!DOCTYPE html>
<html>
    <head>
     <script>
                           function retrive(){
                           var s = document.getElementById("select").value 
                           console.log(s);
                           }
                           </script>
    
    
        
    
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>
        <div class="card text-center " style="height: 100%; background-image: linear-gradient(160deg,orange,white,green);font-family: 'Times New Roman', Times, serif; font-size: 23px;">
           
           <form action="dailyMenu.jsp" method="post">
           
            <div class="card-header" style="height: 20%">
                <div class="row">
                <label class=" col-2 font-weight-bolder text-dark"for="exampleInputEmail1">Date :</label>
                <% SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
                		Date date = new Date();
                		//System.out.println(formatter.format(date)) ;
                		%>    <%--******date Print***** --%>
                <label class=" col-2 font-weight-bolder text-dark"for="exampleInputEmail1"><%=formatter.format(date) %></label>
                </div>

                <div class="row mt-3">
                        <label class=" col-2 font-weight-bolder text-dark"for="exampleInputEmail1">Service :</label>
                        <select id="select" name="select1" onchange="this.form.submit()"class="form-control " required style="box-shadow: 1px 2px 3px 4px #4cc912; width:250px">
                                <option value="-1">Choose option</option>
<%
	
	    try {		
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/menu","root","cdac");	
            PreparedStatement s = con.prepareStatement("select service,id from service");
            ResultSet rs = s.executeQuery();
            while(rs.next()) 
               {
 %>
          <option value="<%=rs.getString("service")%>"><%=rs.getString("service")%></option>
<%
                }
            rs.close();
            con.close();

            }
      catch(SQLException | ClassNotFoundException ex){
	            System.out.println(ex);
            }

%>                          
                     </select>                  
                </div>

            </div>
        
           
           
           
            <div class="card-body" style="height:80%">

                    <div class="row mt-3">
                            <div class="col-3"></div>
                            <div class="col-6">
                                <button  type="button" class="btn btn-primary col-2" onclick="retrive()">Retrive</button>
                                <button  type="button" class="btn btn-secondary col-2">Alter Menu</button>
                                <button  type="button" class="btn btn-secondary col-2">Print</button>
                                <button  type="button" class="btn btn-secondary col-2">Close</button>
        
                            </div>
                            <div class="col-3"></div>
                      </div>
                    <div class="row mt-3">
                        <div class="col-2"></div>
                            <textarea rows="15" cols="15" class="form-control col-8 " required style="box-shadow: 1px 2px 3px 4px #4cc912;" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Item Id" required autocomplete="on" autofocus>
                                        
                              
               <%                
                               try {		
            StringBuffer bill = new StringBuffer(); 
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/menu","root","cdac");	
			PreparedStatement s = con.prepareStatement("select item,price from breakfast where item="+request.getParameter("select1"));
			System.out.println(request.getParameter("select1"));
            ResultSet rs = s.executeQuery();
            while(rs.next()) 
               {
                     String item = rs.getString("item");
                     Float price = rs.getFloat("price");
                  
                    bill.append(String.format("|%-39.39s|", item));
             		bill.append(String.format("%-38.38s|", price));
             		bill.append("\n");
                     
                     
                     
                }
            System.out.println(bill);
            rs.close();
            con.close();
            }
      catch(SQLException | ClassNotFoundException ex){
	            System.out.println(ex);
            }

%>                          
                              
                                                                                     
                            </textarea> 
                    </div>                      
            </div>
        </form>
          </div>
    </body>
</html>