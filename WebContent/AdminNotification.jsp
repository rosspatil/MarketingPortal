<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<head>
<title>DevnDream7</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css\w3.css">
<link rel="stylesheet" href="css\Raleway.css">
<link rel="stylesheet" href="css\Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css\bootstrap.min.css">
<script src="js\jquery.min.js"></script>
<script src="js\bootstrap.min.js"></script>
<link rel="stylesheet" href="css\w3-theme-blue-grey.css">
<link rel='stylesheet' href='css\Open+Sans.css'>
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}

a href{
    color : balck;
}

body, html {
    height: 100%;
    line-height: 1.8;
}

.mySlides {display: none}


/* Full height image header */
#home {
    background-position: center;
    background-size: cover;
    background-image: url("E:/Akshay Jadhav/mac.jpg");
    min-height: 100%;
    max-width:100%;
}
.w3-navbar li a {
    padding: 16px;
   
}
</style>
</head>
<body class="w3-light-grey">
	<jsp:include page="Nav.jsp"/>
	<div class="w3-container w3-content" style="max-width: 1400px; margin-top: 80px">
		<div class="w3-row">
		<jsp:include page="AdminSideBar.jsp"/>
		<jsp:include page="AdminNotificationView.jsp"/>
		</div>
	</div>

<jsp:include page="UserFooter.jsp"/>


</body>
</html>