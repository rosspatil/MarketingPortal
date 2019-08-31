<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.DevenDream7.bean.User"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.io.InputStream" %>
<%@page import="java.util.Properties" %>

<%
    InputStream stream = application.getResourceAsStream("jdbc.properties");
    Properties props = new Properties();
    props.load(stream);
%>
<sql:setDataSource var="dataSource" driver='<%=props.getProperty("jdbc.driver") %>'
	url='<%=props.getProperty("jdbc.url") %>' user='<%=props.getProperty("jdbc.user") %>'
	password='<%=props.getProperty("jdbc.password") %>' />
<!DOCTYPE html>
<head>
<title>DevnDream7</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css\w3.css">
<link rel="stylesheet" href="css\Raleway.css">
<link rel="stylesheet" href="css\Lato">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css\bootstrap.min.css">
<script src="js\jquery.min.js"></script>
<script src="js\bootstrap.min.js"></script>
<link rel="stylesheet" href="css\w3-theme-blue-grey.css">
<link rel='stylesheet' href='css\Open+Sans.css'>
<style>
body,h1,h2,h3,h4,h5,h6 {
	font-family: "Raleway", sans-serif
}

a href {
	color: balck;
}

body,html {
	height: 100%;
	line-height: 1.8;
}

.mySlides {
	display: none
}

/* Full height image header */
#home {
	background-position: center;
	background-size: cover;
	background-image: url("E:/Akshay Jadhav/mac.jpg");
	min-height: 100%;
	max-width: 100%;
}

.w3-navbar li a {
	padding: 16px;
}
</style>
</head>
<%
	String userId;
	String firstName;
	String lastName;
	String phone;
	String email;
	User user;
	user = (User) session.getAttribute("User");
	userId = user.getUserId();
	firstName = user.getFirstName();
	lastName = user.getLastName();
	phone = user.getPhone();
	email = user.getEmail();
	System.out.println("name" + firstName + " " + lastName);
	System.out.println("Email is " + email + " id " + userId);
%>
<c:set var="userId" value="<%=userId%>" />
<c:set var="phone" value='<%=request.getParameter("phone")%>' />
<c:if test="${phone!=null }">
	<%
		user.setPhone(request.getParameter("phone"));

			session.setAttribute("User", user);
	%>
	<sql:update dataSource="${ dataSource}">
						UPDATE user SET phone='${phone}'  where userid='${userId}'
		</sql:update>
	<%
		response.sendRedirect("/DevenDream7/Controller");
	%>
</c:if>

<c:set var="action" value='<%=request.getParameter("action")%>' />
<c:if test="${action!=null && action=='delete' }">
	
	<sql:update dataSource="${ dataSource}">
						DELETE FROM quotes
		</sql:update>
	<%
		response.sendRedirect("/DevenDream7/Controller");
	%>
</c:if>

<c:set var="firstName" value='<%=request.getParameter("firstName")%>' />
<c:set var="lastName" value='<%=request.getParameter("lastName")%>' />
<c:if test="${firstName!=null && filrstName!=' ' }">
	<c:if test="${lastName!=null }">
		<%
			user.setFirstName(request.getParameter("firstName"));
					user.setLastName(request.getParameter("lastName"));
					session.setAttribute("User", user);
		%>
		<sql:update dataSource="${ dataSource}">
						UPDATE user SET firstname='${firstName}' , lastname='${lastName}' where userid='${userId}'
						
			</sql:update>
		<%
			response.sendRedirect("/DevenDream7/Controller");
		%>
	</c:if>
</c:if>

<c:set var="oldpassword" value='<%=request.getParameter("oldpassword")%>' />
<c:set var="newpassword" value='<%=request.getParameter("newpassword")%>' />
<c:set var="cnfpassword" value='<%=request.getParameter("cnfpassword")%>' />
<c:set var="current" value='<%=user.getPassword()%>' />
<c:if test="${oldpassword!=null && newpassword!=null }">
	<c:if test="${cnfpassword==newpassword && oldpassword==current}">
		<%
			user.setPassword(request.getParameter("newpassword"));
					session.setAttribute("User", user);
		%>
		<sql:update dataSource="${ dataSource}">
						UPDATE user SET password='${newpassword}' where userid='${userId}'
						
			</sql:update>
		<%
			response.sendRedirect("/DevenDream7/Controller?action=updatePassword");
		%>
	</c:if>
</c:if>


<body class="w3-light-grey">
	<jsp:include page="Nav.jsp" />
	<div class="w3-container w3-content"
		style="max-width: 1400px; margin-top: 80px">
		<div class="w3-row">
			<jsp:include page="AdminSideBar.jsp" />
			<jsp:include page="AdminTasks.jsp" />
		</div>
	</div>

	<jsp:include page="UserFooter.jsp" />


</body>
</html>