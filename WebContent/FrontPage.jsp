<%@page import="com.DevenDream7.DAO.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<title>DevenDream7</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/w3.css">
<link rel="stylesheet" href="css/Raleway.css">
<link rel="stylesheet" href="css/Lato.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="js/jquery.min.js"></script>
<script
	src="js/bootstrap.min.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
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
	background-image: url("images/mac.jpg");
	min-height: 100%;
	max-width: 100%;
}

.w3-navbar li a {
	padding: 16px;
	float: left;
}
</style>
</head>
<body>
	<c:set var="name" value='<%=request.getParameter("name")%>' />
	<c:set var="email" value='<%=request.getParameter("email")%>' />
	<c:set var="subject" value='<%=request.getParameter("subject")%>' />
	<c:set var="message" value='<%=request.getParameter("message")%>' />
	<c:if
		test="${name!=null && email!=null && subject!=null && message!=null }">
		<c:set var="count" value='<%=new UserDAO().getCountForTable("admin_announcement")+1 %>' />
		<sql:update dataSource="${ dataSource}">
				INSERT INTO admin_announcement(anid,announcement) values(?,?)
				<sql:param value="${count+1}" />
			<sql:param
				value="Name: ${name } Email: ${email } Subject: ${subject } Message: ${message }" />
		</sql:update>
	</c:if>
	<jsp:include page="FrontNavBar.jsp"></jsp:include>

	<jsp:include page="Header.jsp"></jsp:include>

	<jsp:include page="about.jsp"></jsp:include>

	<jsp:include page="Reviews.jsp"></jsp:include>

	<jsp:include page="Footer.jsp"></jsp:include>
	<!-- Scripts -->

	<script>
		// Modal Image Gallery
		function onClick(element) {
			document.getElementById("img01").src = element.src;
			document.getElementById("modal01").style.display = "block";
			var captionText = document.getElementById("caption");
			captionText.innerHTML = element.alt;
		}

		// Toggle between showing and hiding the sidenav when clicking the menu icon
		var mySidenav = document.getElementById("mySidenav");

		function w3_open() {
			if (mySidenav.style.display === 'block') {
				mySidenav.style.display = 'none';
			} else {
				mySidenav.style.display = 'block';
			}
		}

		// Close the sidenav with the close button
		function w3_close() {
			mySidenav.style.display = "none";
		}
	</script>
	<!-- End of Scripts -->
</body>
</html>