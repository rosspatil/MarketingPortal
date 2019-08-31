<%@page import="com.DevenDream7.DAO.UserDAO"%>
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

<c:set var="action" value='<%=request.getParameter("action")%>' />
<c:set var="postUrl" value='<%=request.getParameter("postUrl")%>' />
<c:if test="${action!=null }">
	<c:if test="${postUrl!=null }">
		<c:set var="count"
			value='<%=new UserDAO().getCountForTable("quotes") + 1%>' />
		<sql:update dataSource="${ dataSource}">
				INSERT INTO quotes(postUrl,date) values(?,?)
				<sql:param value="${postUrl }" />
			<sql:param value="${count }" />
		</sql:update>
	</c:if>
</c:if>
<!-- Middle Column -->
<div class="w3-col m9">

	<div class="w3-row-padding">
		<div class="w3-col m12">
			<div class="w3-card-2 w3-round w3-white">
				<div class="w3-container w3-padding">
					<h4 class="w3-opacity">Add Facebook posts</h4>
					<hr>
					<form action="/DevenDream7/Admin.jsp" method="post">
						<p>
							<input class="w3-input w3-border" type="text" name="postUrl"
								placeholder="Enter post URL" required>
						</p>
						<p>
							<input type="hidden" name="action" value="addPost"> <input
								type="submit" class="btn btn-info btn-md" style="width: 100px;"
								value="Add">&nbsp;
					</form>
					<form action="/DevenDream7/Admin.jsp" method="post">
						<c:set var="count"
							value='<%=new UserDAO().getCountForTable("quotes")%>' />
						<input type="hidden" name="action" value="delete"> <input
							type="submit" class="btn btn-danger btn-md" style="width: 100px;"
							value="Delete All"><font color="Blue">You have
							"${count}" post in database.</font>

						</p>
						<br>
					</form>
				</div>
			</div>
		</div>
	</div>

	<c:set var="action" value='<%=request.getParameter("action")%>' />
	<c:set var="comment" value='<%=request.getParameter("comment")%>' />
	<c:if test="${action=='announce' && comment!=null }">
		<c:set var="count"
			value='<%=new UserDAO().getCountForTable("announcement") + 1%>' />
		<sql:update dataSource="${ dataSource}">
				INSERT INTO announcement(anid,announcement) values(?,?)
				<sql:param value="${ count}" />
			<sql:param value="${comment }" />
		</sql:update>
	</c:if>

	<div class="w3-container w3-card-2 w3-white w3-round w3-margin">

		<h4 class="w3-opacity">Announcements</h4>
		<hr class="w3-clear">
		<div class="w3-row">
			<div class="w3-col m12">
				<div class="w3-container w3-padding">
					<form action="/DevenDream7/Admin.jsp" method="post">
						<p>
							<textarea class="form-control" rows="5" id="comment"
								name="comment" placeholder="Enter some text here"></textarea>
						</p>
						<p>
							<input type="hidden" name="action" value="announce"> <input
								type="submit" class="w3-btn w3-btn-default w3-col w3-theme-l1"
								style="width: 250px; align: right;" value="Make Announcement!">
						</p>
					</form>
				</div>
			</div>
		</div>
		<br>
	</div>

</div>
<!-- End Middle Column -->