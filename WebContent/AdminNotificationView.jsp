<%@page import="com.DevenDream7.bean.UserAccount"%>
<%@page import="com.DevenDream7.bean.User"%>
<div class="w3-col m9">
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
	System.out.println("name" + firstName + " " + lastName);
	System.out.println("Email is " + email + " id " + userId);
%>
				<div class="w3-row-padding">
					<div class="w3-col m12">
						<div class="w3-card-2 w3-round w3-white">
							<div class="w3-container w3-padding">
								<h4 class="w3-opacity">Notifications</h4>
								<hr>
								 
								<div class="table-responsive">
									<table class="table">
										<sql:query var="rs" dataSource="${dataSource}">
							SELECT * FROM admin_announcement ORDER BY anid DESC
											</sql:query>
											<tbody>
												<c:if test="${rs!=null}">
													<c:forEach var="row" items="${rs.rows}">
														<tr>
															<td><c:out value="${row.announcement}" /></td>
														</tr>
													</c:forEach>
												</c:if>
											</tbody>
									</table>
								</div>
							
								
								<br>
							</div>
						</div>
					</div>
				</div>
</div>