<%@page import="com.DevenDream7.bean.User"%>
<%@page import="com.DevenDream7.DAO.UserDAO"%>
<%@page import="com.DevenDream7.payu.PaymentProcess"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment Page</title>


</head>
<%
	HttpSession httpSession = request.getSession(true);
	httpSession.setMaxInactiveInterval(60 * 60);
	String MERCHANT_KEY = "6Gy8AsTB";
	String SALT = "BfOXyFEUJe";
	String firstname = request.getParameter("firstname");
	String lasttname = request.getParameter("lastname");
	String lastname = request.getParameter("lastname");
	String email = request.getParameter("email");
	String phone = request.getParameter("mobile");
	String productinfo = "DevenDream7_Signup";
	String amount = "150";
	String sucess = "http://www.devendream7.com/DevenDream7/Controller?action=success";
	String fail = "http://www.devendream7.com/DevenDream7/Controller?action=fail";
	String txnid = "DD" + new Date().getTime();
	MessageDigest md = MessageDigest.getInstance("SHA-512");

	String hashreq = MERCHANT_KEY + "|" + txnid + "|" + amount + "|"
			+ productinfo + "|" + firstname + "|" + email
			+ "|||||||||||" + SALT;

	String hash = PaymentProcess.getSHA(hashreq.trim());

	String password = request.getParameter("password");
	String refrenceid = request.getParameter("refrenceid");
	User user = new User(firstname, lastname, phone, email, password,
			refrenceid);
	session.setAttribute("User", user);
%>
<body onload="submitForm()">
	<jsp:include page="FrontNavBar.jsp"></jsp:include>
	<center>
		<div>
			<h2>Payment Gateway</h2>
			<table>
				<tr>
					<td>Transaction Id</td>
					<td><strong> <%=txnid%>
					</strong></td>
					<td>Amount:</td>
					<td><strong>Rs. 150</strong></td>
			</table>
			<div>

				<p>
					<font color="RED" ;size="20">Please be patient. this process
						might take some time,<br />please do not hit refresh or browser
						back button or close this window.
					</font>
				</p>
			</div>
		</div>

		<div>
			<form name="postForm" action="https://secure.payu.in/_payment"
				method="POST">
				<input type="hidden" name="key" value="<%=MERCHANT_KEY%>" /> <input
					type="hidden" name="hash" value="<%=hash%>" /> <input
					type="hidden" name="txnid" value="<%=txnid%>" /> <input
					type="hidden" name="amount" value="150" /> <input type="hidden"
					name="firstname" value="<%=firstname%>" /> <input type="hidden"
					name="email" value="<%=email%>" /> <input type="hidden"
					name="phone" value="<%=phone%>" /> <input type="hidden"
					name="productinfo" value="<%=productinfo%>" /> <input
					type="hidden" name="service_provider" value="payu_paisa" size="64" />
				<input type="hidden" name="surl" value="<%=sucess%>" /> <input
					type="hidden" name="furl" value="<%=fail%>" />
				<!-- <input type="hidden" name="action" value="success"> -->

			</form>
		</div>

		<script>
			function submitForm() {
				var postForm = document.forms.postForm;
				postForm.submit();
			}
		</script>
	</center>
</body>
</html>