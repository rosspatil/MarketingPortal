<%@page import="com.DevenDream7.DAO.UserDAO"%>
<%@page import="com.DevenDream7.bean.UserAccount"%>
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
<div class="w3-col m9">
<%
		String userId;
		String firstName;
		String lastName;
		String phone;
		String email;
		String refid;
		double balance;
		int level;
		User user;
		UserAccount account;
		user = (User) session.getAttribute("User");
		userId = user.getUserId();
		firstName = user.getFirstName();
		lastName = user.getLastName();
		phone = user.getPhone();
		email = user.getEmail();
		account = new UserDAO().getAccount(email);
		refid = user.getRefrenceid();
		balance = account.getBalance();
		level = account.getLevel();
	%>
				<div class="w3-row-padding">
					<div class="w3-col m12">
						<div class="w3-card-2 w3-round w3-white">
							<div class="w3-container w3-padding">
								<h4 class="w3-opacity">Account Information</h4>
								<hr>
								 
								<div class="table-responsive">
									<table class="table table-bordered">
										<thead>
											<tr>
												<th>UID</th>
												<th>Name</th>
												<th>Email</th>
												<th>Reference Id</th>
												<th>Balance</th>
												<th>Level</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><%=userId%></td>
												<td><%=firstName%>&nbsp;<%=lastName%></td>
												<td><%=email%></td>
												<td><%=refid%></td>
												<td><%=balance%></td>
												<td><%=level%></td>
											</tr>
										</tbody>
									</table>
									
								</div>
					<%if(level>=5){ %>
					<button class="btn btn-success w3-center">Claim your money</button>
					<% }%>
								
								<br>
							</div>
						</div>
					</div>
				</div>

				<div class="w3-container w3-card-2 w3-white w3-round w3-margin">

					<h4 class="w3-opacity">Transaction Details</h4>
					<hr class="w3-clear">
					<div class="table-responsive">
									<table class="table table-responsive">
											<thead>
												<tr>
													<th>Date</th>
													<th>Deposited by</th>
													<th>Creadited by</th>
													<th>Amount</th>
												</tr>
											</thead>
											<sql:query var="rs" dataSource="${dataSource}">
							SELECT * FROM transaction where userid=?;
							<sql:param value="<%=userId %>"/>
											</sql:query>
											<tbody>
												<c:if test="${rs!=null}">
													<c:forEach var="row" items="${rs.rows}">
														<tr>
															<td><c:out value="${row.date}" /></td>
															<td><c:out value="${row.deptby}" /></td>
															<td><c:out value="${row.creditby}" /></td>
															<td><c:out value="${row.amount}" /></td>
														</tr>
													</c:forEach>
												</c:if>
											</tbody>



										</table>
								</div>
					
				</div>

			</div>
			<!-- End Middle Column -->
