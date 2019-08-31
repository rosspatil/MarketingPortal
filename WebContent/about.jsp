

<!-- About Section -->
<div class="w3-container w3-padding-64" id="about">

	<h3 class="w3-center" style="font-family: 'Lato'; font-size: 32px">
		<b>Key Features OF DevenDream7</b>
	</h3>

	<div class="w3-row-padding w3-center" style="margin-top: 64px">
		<a href=".bs-businessplan-modal-lg" data-toggle="modal"
			style="color: black">
			<div class="w3-third">
				<i class="fa fa-file-text-o w3-margin-bottom w3-jumbo w3-center"></i>
				<p class="w3-large">Business Plans !</p>
				<p>Do You Know Your Work, Click Here !.</p>
			</div>
		</a> <a href=".bs-earning-modal-lg" data-toggle="modal"
			style="color: black">
			<div class="w3-third">
				<i class="fa fa-rupee w3-margin-bottom w3-jumbo"></i>
				<p class="w3-large">Earnings</p>
				<p>Checkout ! Your Earning Here.</p>
			</div>
		</a> <a href=".bs-benifits-modal-lg" data-toggle="modal"
			style="color: black">
			<div class="w3-third">
				<i class="fa fa-gift w3-margin-bottom w3-jumbo"></i>
				<p class="w3-large">Benifits</p>
				<p>7 Benefits after complete your work !</p>
			</div>
		</a>
	</div>

	<%
		boolean cookieStatus=false;
			                String cookieValue="";
			                Cookie[] cookies=request.getCookies();
			                if(cookies!=null){
			              	  for(Cookie cookie:cookies){
			              		  if(cookie.getName().equals("userName")){
			              			  cookieValue =cookie.getValue();
			              			  cookieStatus=true;
			              			  break;
			              		  }
			              	  }
			                }
	%>

	<div class="w3-center w3-padding-64">
		<%
			if(!cookieStatus){
		%>
		<a href="Register.jsp">
			<button class="btn btn-lg btn-info">Join now</button>
		</a>

		<%
			}
		%>
	</div>


	<div class="w3-container w3-row w3-red">
		<h3>Hello and welcome!</h3>
		<div style="display: block;">
			<p style="text-align: justify;">
				<strong>Hello everyone!</strong> Are you seriously seeking for
				online jobs . Use our program to achieve your goal. There is a
				surplus amount of part time jobs available on our site for people
				from all age groups. Sign up today to grab the benefit from us and
				get more. There are more than thousands of jobs available for the
				people who like to work at their own time and at their place. Just
				spend 2 to 3 hours per day and see how funds start coming your way.
				Our support team will start sending you a continuous job update as
				soon as you subscribe or wish to receive the home based job update.
			</p>


		</div>
	</div>
</div>


<div class="modal fade bs-businessplan-modal-lg" tabindex="-1"
	role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">

			<div id="carousel-businessplan-generic" class="carousel slide"
				data-ride="carousel" data-interval="false">
				<!-- Wrapper for slides -->
				<div class="carousel-inner">
					<div class="item active">
						<img class="img-responsive" src="images\businessplan\1.png"
							alt="...">
					</div>
					<div class="item">
						<img class="img-responsive" src="images\businessplan\2.png"
							alt="...">
					</div>
					<div class="item">
						<img class="img-responsive" src="images\businessplan\3.png"
							alt="...">
					</div>
					<div class="item">
						<img class="img-responsive" src="images\businessplan\4.png"
							alt="...">
					</div>
					<div class="item">
						<img class="img-responsive" src="images\businessplan\5.png"
							alt="...">
					</div>
				</div>

				<!-- Controls -->
				<a class="left carousel-control"
					href="#carousel-businessplan-generic" role="button"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left"></span>
				</a> <a class="right carousel-control"
					href="#carousel-businessplan-generic" role="button"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right"></span>
				</a>
			</div>
		</div>
	</div>
</div>



<div id="myModal" class="modal fade bs-earning-modal-lg" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<img src="images\earnings\6.png" class="img-responsive">
			</div>
		</div>
	</div>
</div>

<div class="modal fade bs-benifits-modal-lg" tabindex="-1" role="dialog"
	aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div id="carousel-benifits-generic" class="carousel slide"
				data-ride="carousel" data-interval="false">



				<!-- Wrapper for slides -->
				<div class="carousel-inner">
					<div class="item active">
						<img class="img-responsive" src="images\7benifits\1.jpg" alt="...">
						<div class="carousel-caption">One Image</div>
					</div>
					<div class="item">
						<img class="img-responsive" src="images\7benifits\2.jpg" alt="...">
						<div class="carousel-caption">Another Image</div>
					</div>
					<div class="item">
						<img class="img-responsive" src="images\7benifits\3.jpg" alt="...">
						<div class="carousel-caption">Another Image</div>
					</div>
					<div class="item">
						<img class="img-responsive" src="images\7benifits\4.jpg" alt="...">
						<div class="carousel-caption">Another Image</div>
					</div>
					<div class="item">
						<img class="img-responsive" src="images\7benifits\5.jpg" alt="...">
						<div class="carousel-caption">Another Image</div>
					</div>
					<div class="item">
						<img class="img-responsive" src="images\7benifits\6.jpg" alt="...">
						<div class="carousel-caption">Another Image</div>
					</div>
					<div class="item">
						<img class="img-responsive" src="images\7benifits\7.jpg" alt="...">
						<div class="carousel-caption">Another Image</div>
					</div>
				</div>

				<!-- Controls -->
				<a class="left carousel-control" href="#carousel-benifits-generic"
					role="button" data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left"></span>
				</a> <a class="right carousel-control" href="#carousel-benifits-generic"
					role="button" data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right"></span>
				</a>
			</div>
		</div>
	</div>
</div>



