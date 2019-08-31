package com.DevenDream7.index;

import java.io.FileInputStream;
import java.io.IOException;






import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.DevenDream7.DAO.UserDAO;
import com.DevenDream7.bean.User;
import com.DevenDream7.photo.FileUpload;

/**
 * Servlet implementation class Controller
 */
@MultipartConfig
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Controller() {

	}

	@Override
	public void init(ServletConfig config) throws ServletException {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "FrontPage.jsp";
		String action = request.getParameter("action");
		String userName = null;
		String password = null;
		String refrenceid = null;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("userName")) {
					userName = cookie.getValue();
				}
				if (cookie.getName().equals("password")) {
					password = cookie.getValue();
				}
			}
			if (new UserDAO().checkLogin(userName, password)) {
				setCookie(userName, password, response);
				HttpSession session = request.getSession(true);
				session.setMaxInactiveInterval(60*60);
				session.setAttribute("email", userName.trim());
				session.setAttribute("User", new UserDAO().getUser(userName));
				System.out.println("session username is"+userName);
				if(userName.equals("deven@gmail.com")){

					url="Admin.jsp";
				}else{
					url = "user.jsp";	
				}

			}
		}

		if (action != null) {

			if (action.equals("login")) {
				userName = request.getParameter("userName");
				password = request.getParameter("password");
				if (new UserDAO().checkLogin(userName, password)) {
					setCookie(userName, password, response);
					HttpSession session = request.getSession(true);
					session.setMaxInactiveInterval(60*60);
					session.setAttribute("User", new UserDAO().getUser(userName));
					if(userName.equals("deven@gmail.com")){
						url="Admin.jsp";
					}else{
						url = "user.jsp";	
					}
				} else {
					response.setHeader("refresh", "2;URL= Login.jsp");

				}
			}else if(action.equals("signup")){
				boolean checkEmail=new UserDAO().checkEmailExistance(request.getParameter("email"));
				boolean chechRefer=new UserDAO().checkRefer(request.getParameter("refrenceid"));
				System.out.println("Email:"+ checkEmail+"\t Refer: "+chechRefer);
				if(chechRefer && checkEmail  &&request.getParameter("confirmpassword").equals(request.getParameter("password"))){
					url="Payment.jsp";
				}else{		
					response.setHeader("refresh", "2;URL= Register.jsp");
				}

			}else if (action.equals("success")) {
				int UserId = new UserDAO().getCount();
				HttpSession session = request.getSession();
				User user=(User)session.getAttribute("User");
				userName = user.getEmail();
				password = user.getPassword();
				refrenceid = user.getRefrenceid();

				if(new UserDAO().register(new User(("DD7"+(++UserId)), user.getFirstName(),user.getLastName(),
						user.getPhone(), userName, password, refrenceid),new FileInputStream(request.getServletContext().getRealPath("images/Guest.JPG")))){
					setCookie(userName, password, response);
					session.setAttribute("User", new UserDAO().getUser(userName));
					url = "user.jsp";
				}else{
					response.setHeader("refresh", "2;URL= Register.jsp");
				}

			} else if (action.equals("updatePassword")) {
				HttpSession session = request.getSession();
				User user=(User)session.getAttribute("User");
				setCookie(user.getEmail(), user.getPassword(), response);
				url = "FrontPage.jsp";
			} else if (action.equals("logout")) {
				HttpSession session = request.getSession();
				session.invalidate();
				deleCookie(response);
				url="FrontPage.jsp";
			}else if (action.equals("fail")) {
				url = "Fail.jsp";
			}
		}

		RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
		requestDispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)){
			Part filepart=request.getPart("profile");
			InputStream fin=filepart.getInputStream();
			HttpSession session=request.getSession(false);
			User user=(User)session.getAttribute("User");
			new FileUpload(fin,String.valueOf(user.getUserId()));
			String URL="";
			if(user.getEmail().equals("deven@gmail.com")){
			  URL="Admin.jsp";
			}else{
				URL="user.jsp";
			}
			RequestDispatcher requestDispatcher = request.getRequestDispatcher(URL);
			requestDispatcher.forward(request, response);
		}
		else{
			doGet(request, response);
		}
	}

	private void setCookie(String userName, String password, HttpServletResponse response) {
		Cookie cookie1 = new Cookie("userName", userName);
		cookie1.setMaxAge(60*60);
		Cookie cookie2 = new Cookie("password", password);
		cookie2.setMaxAge(60*60);
		response.addCookie(cookie1);
		response.addCookie(cookie2);
	}

	private void deleCookie(HttpServletResponse response) {
		Cookie cookie1 = new Cookie("userName", "default");
		cookie1.setMaxAge(0);
		Cookie cookie2 = new Cookie("password", "default");
		cookie2.setMaxAge(0);
		response.addCookie(cookie1);
		response.addCookie(cookie2);
	}

}
