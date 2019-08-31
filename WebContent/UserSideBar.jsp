
<%@page import="java.net.URLEncoder"%>
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
<div class="w3-col m3">
	<!-- Profile -->
	<div class="w3-card-2 w3-round w3-white">
		<div class="w3-container">

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
				System.out.println("Email is " + email);
			%>
			<h4 class="w3-center">My Profile</h4>
			<p class="w3-center">
				<a data-toggle="modal" href="#profilePicModal"><img
					src="/DevenDream7/PhotoServlet?userId=<%=URLEncoder.encode(String.valueOf(userId), "UTF-8")%>"
					class="w3-circle" style="height: 106px; width: 106px"
					altss="Avatar"></a>
			</p>
			<hr>
			<p>
				<i class="fa fa-user fa-fw w3-margin-right w3-text-theme"></i>
				<%=firstName%>&nbsp;<%=lastName%><a data-toggle="modal"
					href="#nameModal"><i
					class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i></a>
			</p>
			<p>
				<i class="fa fa-envelope fa-fw w3-margin-right w3-text-theme"></i>
				<%=email%>
			</p>
			<p>
				<i class="fa fa-mobile fa-fw w3-margin-right w3-text-theme"></i>
				<%=phone%><a data-toggle="modal" href="#phoneModal"><i
					class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i></a>
			</p>
			<p>
				<i class="fa fa-key fa-fw w3-margin-right w3-text-theme"></i> Change
				password <a data-toggle="modal" href="#passwordModal"><i
					class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i></a>
			</p>
		</div>
	</div>
	<br>

	<!-- Important Links -->
	<div class="w3-card-2 w3-round">
		<div class="w3-accordion w3-white">
			<a href="user.jsp"><button
					class="w3-btn-block w3-theme-l1 w3-left-align">
					<i class="fa fa-tasks fa-fw w3-margin-right"></i> My Tasks
				</button></a> <a href="Tree.jsp"><button
					class="w3-btn-block w3-theme-l1 w3-left-align">
					<i class="fa fa-tree fa-fw w3-margin-right"></i> My Tree
				</button></a> <a href="Account.jsp"><button
					class="w3-btn-block w3-theme-l1 w3-left-align">
					<i class="fa fa-inr fa-fw w3-margin-right"></i> My Account
				</button></a>
		</div>
	</div>
	<br>

	<!-- End Left Column -->
</div>
<div class="modal fade" id="nameModal" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Enter new Name</h4>
			</div>
			<form action="user.jsp" method="post">
				<div class="modal-body">

					<p>
						<label for="firstName">Enter First name</label><input type="text"
							class="form-control" id="firstName" name="firstName">
					</p>
					<p>
						<label for="lastName">Enter Last name</label><input type="text"
							class="form-control" id="lastName" name="lastName">
					</p>
				</div>
				<div class="modal-footer">
					<input type="submit" value="Save" class="btn btn-default">&nbsp;
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</form>
		</div>

	</div>
</div>


<div class="modal fade" id="profilePicModal" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Select new picture</h4>
			</div>
			<form action="/DevenDream7/Controller" method="post"
				enctype="multipart/form-data">
				<div class="modal-body">

					<p>
						<label class="control-label">Select File</label><input type="file"
							name="profile" accept="image/*" class="file">
					</p>
				</div>
				<div class="modal-footer">
					<input type="submit" value="Save" class="btn btn-default">&nbsp;
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</form>
		</div>
	</div>
</div>

<div class="modal fade" id="phoneModal" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Enter new phone no.</h4>
			</div>
			<form action="user.jsp" method="post">
				<div class="modal-body">

					<p>
						<label for="phone">Enter Phone no.</label><input type="text"
							class="form-control" id="phone" name="phone">
					</p>
				</div>
				<div class="modal-footer">
					<input type="submit" value="Save" class="btn btn-default">&nbsp;
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</form>
		</div>

	</div>
</div>

<div class="modal fade" id="passwordModal" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Change password.</h4>
			</div>
			<form action="user.jsp" method="ost">
				<div class="modal-body">

					<p>
						<label for="oldpassword">Enter old Password.</label><input
							type="password" class="form-control" id="oldpassword"
							name="oldpassword">
					</p>
					<p>
						<label for="newpassword">Enter new Password.</label><input
							type="password" class="form-control" id="newpassword"
							name="newpassword">
					</p>
					<p>
						<label for="newpassword">Confirm new Password.</label><input
							type="password" class="form-control" id="cnfpassword"
							name="cnfpassword">
					</p>
				</div>
				<div class="modal-footer">
					<input type="submit" value="Save" class="btn btn-default">&nbsp;
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</form>
		</div>

	</div>
</div>



