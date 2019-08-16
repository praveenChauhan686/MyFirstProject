<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%--for date --%>
<%@ page import="java.util.*"%>
<%@ page
	import="java.sql.Connection,java.sql.DriverManager,java.sql.SQLException,java.sql.PreparedStatement,java.sql.ResultSet,java.sql.Statement"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="com.canteen.dto.*"%>
 <%@ include file="no-cache-page.jsp" %>
<%!List<Item> userList = null;
	int n = 1;%>

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
                           </script>




<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
	<div class="card text-center "
		style="height: 100%; background-image: linear-gradient(160deg, orange, white, green); font-family: 'Times New Roman', Times, serif; font-size: 23px;">



		<form:form action="submitForm.htm" commandName="menu">

			<div class="card-header" style="height: 20%">
				<div class="row">
					<label class=" col-2 font-weight-bolder text-dark"
						for="exampleInputEmail1">Date :</label>
					<%
						SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
							Date date = new Date();
							//System.out.println(formatter.format(date)) ;
					%>
					<%--******date Print***** --%>
					<label class=" col-2 font-weight-bolder text-dark"
						for="exampleInputEmail1"><%=formatter.format(date)%></label>
				</div>

				<div class="row mt-3">
					<label class=" col-2 font-weight-bolder text-dark"
						for="exampleInputEmail1">Service :</label>
					<form:select path="service" name="name" class="form-control "
						style="box-shadow: 1px 2px 3px 4px #4cc912; width:250px">
						<form:option value="Choose One">Choose one</form:option>
						<form:option value="Breakfast"> Breakfast</form:option>
                        <form:option value="Tea">Tea</form:option>
						<form:option value="Snack">Snack</form:option>
						<form:option value="Dinner">Dinner</form:option>



					</form:select>
				</div>

			</div>




			<div class="card-body" style="height: 80%">

				<div class="row mt-3">
					<div class="col-3"></div>
					<div class="col-6">
						<input type="submit" class="btn btn-primary col-2" value="Retrive">
						<button type="button" class="btn btn-secondary col-2">Alter
							Menu</button>
						<button type="button" class="btn btn-secondary col-2" onclick="print123('print');">Print</button>
					<button type="button"  class="btn btn-secondary col-2" >Close</button>

					</div>
					<div class="col-3"></div>
				</div>
				<div class="row mt-3">
					<div class="col-3"></div>
					<div id="print" class="col-6">
						<table class="table">

							<tr>
								<th>Item Name</th>
								<th>Item Id</th>
								<th>Item Type</th>
								<th>Item Price</th>
								<th>Date</th>
							</tr>
							<%         userList = (List<Item>) session.getAttribute("ul");
							            if (userList!= null && !userList.isEmpty()) {
										
										
										for (Item u : userList) {
							%>
							<tr>
								<td><%=u.getItemName()%></td>
								<td><%=u.getItemId()%></td>
								<td><%=u.getItemType()%></td>
								<td><%=u.getItemPrice()%></td>
								<td><%=formatter.format(date)%></td>
							</tr>

							<%
								}
									} else {
										n++;
									}
							%>
						</table>
					</div>
                  <div class="col-3"></div>
				</div>
			</div>
		</form:form>
	</div>
</body>
</html>