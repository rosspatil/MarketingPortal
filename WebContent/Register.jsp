<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<head>
<title>DevenDream7</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/w3.css">
<link rel="stylesheet" href="css/Raleway.css">
<link rel="stylesheet" href="css/Lato.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
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
    background-image: url("images/mac.jpg");
    min-height: 100%;
    max-width:100%;
}
.w3-navbar li a {
    padding: 16px;
    float: left;
}
</style>
</head>
<body>



<jsp:include page="FrontNavBar.jsp"></jsp:include>


<!-- Page content -->

<div class="w3-card-2 w3-container " style="max-width:32.25em;margin:auto;margin-top:75px">
  <h3 class="w3-center">REGISTER</h3>
  <b><hr></b>
  <div class=" w3-row-padding">
      <form action="/DevenDream7/Controller" method="post">
	<p><input class="w3-input w3-border" type="text" placeholder="First name" required name="firstname"></p>
        <p><input class="w3-input w3-border" type="text" placeholder="Last name" required name="lastname"></p>
	<p><input class="w3-input w3-border" type="text" placeholder="Phone no" required name="mobile"></p>
	<p><input class="w3-input w3-border" type="email" placeholder="Email" required name="email"></p>
        <p><input class="w3-input w3-border" type="password" placeholder="Password" required name="password"></p>
       	<p><input class="w3-input w3-border" type="password" placeholder="Confirm password" required name="confirmpassword"></p>	
		<p><input class="w3-input w3-border" id="refrenceCode" name="refrenceid" type="email" required placeholder="Refrence code"></p>
		<p>
    	   <input type="hidden" name="action" value="signup">      
          <input type="submit" class="btn btn-info w3-col w3-border" value="Sign-Up">
		
        </p>
	<br>
      </form> 
  </div>
  <hr>
  <p class="w3-center"><b>Welcome to DevenDream7 !</b></p>
</div>



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
