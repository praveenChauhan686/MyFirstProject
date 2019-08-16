<%@page import="com.canteen.dto.UserRegistrationForm"%>
<%@page import="com.canteen.service.*"%>

<jsp:useBean id="user" class="com.canteen.dto.UserRegistrationForm" scope="session" ></jsp:useBean>
<jsp:setProperty property="*" name="user"/>

<%
	ItemService userService = new ItemServiceImple();
	UserRegistrationForm b = userService.checkUser(user);
	if(b!=null){
		response.sendRedirect("homePage.jsp");
	}else{
		response.sendRedirect("Link.jsp?errorMsg=wrong info");
	}
%>