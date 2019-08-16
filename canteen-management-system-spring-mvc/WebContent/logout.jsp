<%
	session.removeAttribute("user");
	session.invalidate();
	response.sendRedirect("homePage.jsp");
	
%>