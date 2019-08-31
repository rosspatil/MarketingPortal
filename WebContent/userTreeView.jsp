<!-- Middle Column -->
<%@page import="com.DevenDream7.DAO.UserDAO"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.List"%>
<%@page import="com.DevenDream7.DAO.Hiererchy"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.DevenDream7.bean.User"%>
<%
	String userId;
	String email;
	User user;

	user = (User) session.getAttribute("User");
	userId = user.getUserId();
	email = user.getEmail();
%>




<div class="w3-col m9">

	<div class="w3-row-padding">
		<div class="w3-col m12">
			<div class="w3-card-2 w3-round w3-white">
				<div class="w3-container w3-padding">
					<h4 class="w3-opacity">My Tree</h4>
					<hr>
					 
					<div class="wfm">
						<ul>
							<li>
								<%
									String treeParent = request.getParameter("user");
									if (treeParent == null) {
										treeParent = email;
									}
								%>
								<div>
									<img src="/DevenDream7/PhotoServlet?userId=<%=URLEncoder.encode(new UserDAO().getUserId(treeParent), "UTF-8")%>" class="img-circle"
										alt="Cinque Terre" width="50" height="50">&nbsp;<%=treeParent%></div>
								<ul>

									<%
										List<String> rs = Hiererchy.getRefer(treeParent);
										if (rs != null) {
											for(String string:rs) {
												String email1 =string;
												User user2=new UserDAO().getUser(email1);
												if (Hiererchy.getLevel(email1) != 0) {
									%>

									<li>
										<div>
											<a href="Tree.jsp?user=<%=email1%>"><img
												src="/DevenDream7/PhotoServlet?userId=<%=URLEncoder.encode(new UserDAO().getUserId(email1), "UTF-8")%>" 
												width="50" height="50">&nbsp;<%=user2.getFirstName()%> <%=user2.getLastName()%> &nbsp;(<%=email1%> &nbsp;+91-<%=user2.getPhone()%>)</a>
												<hr>
										</div>
										
									</li>
									<%
										} else {
									%>
									<li>
										<div>
											<img src="i/DevenDream7/PhotoServlet?userId=<%=URLEncoder.encode(new UserDAO().getUserId(email1), "UTF-8")%>" 
												 width="50" height="50">&nbsp;<%=user2.getFirstName()%> <%=user2.getLastName()%> &nbsp;(<%=email1%> &nbsp;+91-<%=user2.getPhone()%>)
												<hr>
										</div>
									</li>
									<%
										}
											}
										}
									%>
								</ul>
							</li>
						</ul>
					</div>

				</div>
			</div>
		</div>
	</div>


</div>
<!-- End Middle Column -->
<script type="text/javascript" language="javascript">
	$(".expand").click(function() {
		$(this).toggle();
		$(this).next().toggle();
		$(this).parent().parent().children().last().toggle();
	});
	$(".collapse").click(function() {
		$(this).toggle();
		$(this).prev().toggle();
		$(this).parent().parent().children().last().toggle();
	});
</script>