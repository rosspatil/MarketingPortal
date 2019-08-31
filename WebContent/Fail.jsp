<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>Bootstrap Case</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css\bootstrap.min.css">
  <link rel="stylesheet" href="css\w3.css">
  <script src="css\jquery.min.js"></script>
  <script src="js\bootstrap.min.js"></script>
</head>
<body> 
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
<jsp:include page="FrontNavBar.jsp"/>
<div class="container" style="margin-top: 100px;">
<div class="well well-lg">
	<p class="w3-center">Sorry Transaction Failed !!!</p>
	<center><a href="Register.jsp"><button type="button" class="btn btn-info btn-md">Try again</button></a></center>
</div>
</div>
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
</body>
</html>