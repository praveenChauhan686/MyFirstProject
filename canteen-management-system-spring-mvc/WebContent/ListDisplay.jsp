<%@page import="com.canteen.dto.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%
 	List<Item> userList = (List<Item>)request.getAttribute("ul");
 %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<table>
		<%
			for(Item u : userList){
		%>
			<tr>
				<td><%=u.getCourseId() %></td>
				<td><%=u.getItemId() %></td>
				<td><%=u.getItemName() %></td>
				<td><%=u.getItemType() %></td>
			<!-- <td><a href="delete_user.htm?userId=<%--u.getUserId()-- %>" >Delete</a></td>
				<td><a href="select_user.htm?userId=<%--u.getUserId() --%>" >Select</a></td> -->
			</tr>
		<% }  %>
	</table>
</body>
</html>