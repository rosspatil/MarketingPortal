<%@page import="com.DevenDream7.DAO.UserDAO"%>
<%@page import="java.util.Date"%>
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
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet"
	href="http://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Middle Column -->
<div class="w3-col m9">

	<div class="w3-col m9">

		<div class="w3-row-padding">
			<div class="w3-col m12">
				<div class="w3-card-2 w3-round w3-white">
					<div class="w3-container w3-padding">
						<h4 class="w3-opacity">Invite Friends on DevenDream7 send
							invitation</h4>
						<hr>
						<div class="fb-send"
							data-href="https://www.facebook.com/devendream7/"
							data-size="large"></div>
						<p>
							<font color="RED">Note: This task is Mandatory.</font>
						</p>
					</div>

				</div>
			</div>
		</div>


		<div class="w3-container w3-card-2 w3-white w3-round w3-margin">

			<h4 class="w3-opacity">Quote Sharing Task</h4>
			<hr class="w3-clear">
			<div class="w3-row">
				<div class="w3-col m4">
					<%
						String url = new UserDAO().getQuotes();

						if (url == null) {
					%>
					<div class="w3-container fb-post"
						data-href="https://www.facebook.com/devendream7/photos/a.196574540799325.1073741828.194343871022392/220145528442226/"
						data-width="100" data-show-text="false"></div>

					<%
						} else {
					%>
					<div class="w3-container fb-post" data-href="<%=url%>"
						data-width="100" data-show-text="false"></div>
					<%
						}
					%>
				</div>
			</div>
			<br>
		</div>
		<div class="w3-row-padding">
			<div class="w3-col m12">
				<div class="w3-card-2 w3-round w3-white">
					<div class="w3-container w3-padding">
						<h4 class="w3-opacity">Subscribe us on YouTube</h4>
						<hr>
						<script src="https://apis.google.com/js/platform.js"></script>

						<div class="g-ytsubscribe" data-channel="devenbhoi"
							data-layout="default" data-theme="dark" data-count="default"></div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script>
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.8&appId=1179291605441695";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>