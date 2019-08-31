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
<div class="w3-top">
 <ul class="w3-navbar w3-theme-d2 w3-left-align w3-large">
  <li class="w3-hide-medium w3-hide-large w3-opennav w3-right">
    <a class="w3-padding-large w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
  </li>
  <li><a href="FrontPage.jsp" class="w3-padding-large w3-theme-d4"><i class="fa fa-home w3-margin-right"></i>DevenDream7</a></li>
  <li class="w3-hide-small w3-dropdown-hover">
  <c:set var="count" value='<%=new UserDAO().getCountForTable("admin_announcement")%>' />
    <a href="#" class="w3-padding-large w3-hover-white" title="Notifications" style="color : white;"><i class="fa fa-bell" style=""></i><span class="w3-badge w3-right w3-small w3-green">${count}</span></a>
    
		<sql:query var="rs" dataSource="${dataSource}">
							SELECT announcement FROM admin_announcement ORDER BY anid DESC LIMIT 2
		</sql:query>

    <div class="w3-dropdown-content w3-white w3-card-4">
    <c:if test="${rs!=null}">
			<c:forEach var="row" items="${rs.rows}">
					<td><a href="AdminNotification.jsp">"${row.announcement}"</a></td>
			</c:forEach>
		</c:if>
      <hr>
      <a href="AdminNotification.jsp" class="w3-center">See All</a>
    </div>
  </li>
  <li class="w3-hide-small w3-right"><a href="/DevenDream7/Controller?action=logout" class="w3-padding-large w3-hover-white" title="My Account" style="color:white">Logout <i class="fa fa-sign-out" style=""></i></a></li>
 </ul>
</div>

<!-- Navbar on small screens -->
<div id="navDemo" class="w3-hide w3-hide-large w3-hide-medium w3-top" style="margin-top:51px">
  <ul class="w3-navbar w3-left-align w3-large w3-theme">

    <li><a class="w3-padding-large" href="#" style="color:white;">Notification</a></li>
    <li><a class="w3-padding-large" href="#" style="color:white;">My Profile</a></li>
  </ul>
</div>

<script type="text/javascript">
function openNav() {
    var x = document.getElementById("navDemo");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else { 
        x.className = x.className.replace(" w3-show", "");
    }
}
</script>