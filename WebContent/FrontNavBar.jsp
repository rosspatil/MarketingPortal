
<%@page import="com.DevenDream7.DAO.UserDAO"%>
<%@page import="com.DevenDream7.bean.UserAccount"%>
<%@page import="com.DevenDream7.bean.User"%>
<div class="w3-top">
	<ul class="w3-navbar w3-black w3-card-2" id="myNavbar">
		<li>
			<p>
				<a href="FrontPage.jsp" class="w3-wide" style="color: white">DevenDream7</a>
			</p>
		</li>
		<!-- Right-sided navbar links -->
		<li class="w3-right w3-hide-small"><a href="FrontPage.jsp"
			style="color: white"><i class="fa fa-home"></i> HOME</a> <a
			href="FrontPage.jsp#about" style="color: white"><i
				class="fa fa-th-list"></i> FEATURES</a> <a href="FrontPage.jsp#reviews"
			style="color: white"><i class="fa fa-user"></i> TESTIMONIALS</a> <%
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
                
                if(cookieStatus){
 %> <a href="/DevenDream7/Controller" style="color: white"><i
				class="fa fa-sign-in"></i> <%
 	User user=new UserDAO().getUser(cookieValue);
 %><%=user.getFirstName()+" "+user.getLastName()%></a> <%
 	}else{
 %> <a href="Login.jsp" style="color: white"><i
				class="fa fa-sign-in"></i> LOGIN</a> <%
 	}
 %></li>
		<!-- Hide right-floated links on small screens and replace them with a menu icon -->
		<li><a href="javascript:void(0)"
			class="w3-right w3-hide-large w3-hide-medium" onclick="w3_open()">
				<i class="fa fa-bars w3-padding-right w3-padding-left"
				style="color: white"></i>
		</a></li>
	</ul>
</div>

<!-- Sidenav on small screens when clicking the menu icon -->
<nav
	class="w3-sidenav w3-black w3-card-2 w3-animate-left w3-hide-medium w3-hide-large"
	style="display: none" id="mySidenav">
	<a href="javascript:void(0)" onclick="w3_close()"
		class="w3-large w3-padding-16" style="color: white">Close ×</a> <a
		href="FrontPage.jsp" style="color: white"><i class="fa fa-home"></i>
		HOME</a> <a href="FrontPage.jsp#about" style="color: white"><i
		class="fa fa-th-list"></i> FEATURES</a> <a href="FrontPage.jsp#reviews"
		style="color: white"><i class="fa fa-user"></i> TESTIMONIALS</a>
	<%
		if(cookieStatus){
	%>
	<a href="/DevenDream7/Controller" style="color: white"><i
		class="fa fa-sign-in"></i> <%
 	User user=new UserDAO().getUser(cookieValue);
 %><%=user.getFirstName()+" "+user.getLastName()%></a>

	<%
		}else{
	%>
	<a href="Login.jsp" style="color: white"><i class="fa fa-sign-in"></i>
		LOGIN</a>
	<%
		}
	%>
</nav>

