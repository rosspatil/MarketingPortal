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
<!-- Reviews Section -->
<div class="w3-container w3-padding-64" id="reviews">
  <h3 class="w3-center">TESTIMONIALS</h3>
  <p class="w3-center w3-large">The ones who loves DevenDream7</p>
  <div class="w3-row-padding w3-grayscale" style="margin-top:64px">
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-card-2">
       <img src="images/reviews/r1.jpg" alt="John" width="100%" height="250px">
        <div class="w3-container">
          <h3>Tejas gayakwad</h3>
          <p class="w3-opacity">Website user</p>
          <p style="max-height:250px;">By just spending a 30 minutes per day in the home based jobs, it helped me to get decent income.
           I am surprised that there is no work pressure, target or anything.
            It allowed me to work freely at my own time..</p>
        </div>
      </div>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-card-2">
      <img src="images/reviews/r2.jpg" alt="John" width="100%" height="250px">
        <div class="w3-container">
          <h3>Yugal Mali</h3>
          <p class="w3-opacity">Website user</p>
          <p>When I lost my job last Month, I was speechless and faced bad financial situation. I am happy that I came to know about your site through my friend. 
          I was quite happy with your service that you helped me to survive and tackle my bad situations. 
          Now, I am the boss</p>
        </div>
      </div>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-card-2" >
      <img src="images/reviews/r3.jpg" alt="John" width="100%" height="250px">
        <div class="w3-container">
          <h3>Yogesh mali</h3>
          <p class="w3-opacity">Website user</p>
          <p>It is really a fantastic source for a housewife like me. At first, I started my journey with less work and within a few days the daily project was increased that increases my wage also.
           Nowadays, I acquired more than I gained in my regular office work with this website. 
           Highly recommended for the all who are interested to join this site and generate wage online.</p>
        </div>
      </div>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-card-2" style="max-height:500px;">
        <img src="images/reviews/r4.jpg" alt="John" width="100%" height="250px">
        <div class="w3-container">
          <h3>Atesh Bagul</h3>
          <p class="w3-opacity">Website user</p>
          <p>I am using this program for about  three months it is very interesting and happy to work with you guys.
           The mode of payment was good and I get paid regularly. Thanks for everything and keep up the good work.</p>
        </div>
      </div>
    </div>
  </div>
  
  <div class="w3-row-padding w3-grayscale" style="margin-top:64px">
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-card-2">
      <img src="images/reviews/r5.jpg" alt="John" width="100%" height="250px">
        <div class="w3-container">
          <h3>narendra salumkhe</h3>
          <p class="w3-opacity">Website user</p>
          <p>Do you like to know the secret behind my potential income that I am using everyday in my life to acquire real wage through online jobs? 
          Generate wage online your program is the one that I used and succeed in my life. 
          Of course! You can also take this opportunity by sign up with them.</p>
        </div>
      </div>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-card-2" >
      <img src="images/reviews/r6.jpg" alt="John" width="100%" height="250px">
        <div class="w3-container">
          <h3>girish patil</h3>
          <p class="w3-opacity">Website user</p>
          <p>I just visited your site through my friend reference. I was surprised with your ideas and customer service. 
          It tackles all my worries by earning through it. I sign up two months ago for the home based jobs and found it very helpful and interesting to work with it</p>
        </div>
      </div>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-card-2" >
      <img src="images/reviews/r7.jpg" alt="John" width="100%" height="250px">
        <div class="w3-container">
          <h3>nilesh more</h3>
          <p class="w3-opacity">Website user</p>
          <p>I got the opportunity to acquire a comfortable amount of wage through sign up with you. 
          Lots of my projects get rejected when I worked for the other competitive vendor. But, generate wage online program guides me to correct my errors and made me acquire more.
           Just imagine! Why not you.</p>
        </div>
      </div>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-card-2" >
      <img src="images/reviews/r8.jpg" alt="John" width="100%" height="250px">
        <div class="w3-container">
          <h3>vishal main</h3>
          <p class="w3-opacity">About user</p>
          <p>This unique site fulfills our requirements perfectly. I have found this effective for my organization and happy to
           say that it helps to extend my business within a short span of time.
           It’s very simple to follow and understand</p>
        </div>
      </div>
    </div>
  </div>
</div>


<!-- Promo Section "Statistics" -->
<div class="w3-container w3-row w3-center w3-padding-64" style="background-image: url('images/black_smiley_tile.jpg');background-repeat: repeat-x;">

  <div class="w3-third">
    <span class="w3-xxlarge " style="color:white">5+</span>
    <br><h4 style="color:white">Marketing Partners</h4>
  </div>
  <c:set var="count" value='<%=new UserDAO().getCountForTable("user")%>' />
  <div class="w3-third">
    <span class="w3-xxlarge" style="color:white">${count}+</span>
    <br><h4 style="color:white">Happy Clients</h4>
  </div>
  <div class="w3-third">
    <span class="w3-xxlarge" style="color:white">5+</span>
    <br><h4 style="color:white">Brand Partners</h4>
  </div>
</div>	



