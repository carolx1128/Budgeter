package com.allen;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import login.bean.LoginBean;
import login.database.LoginDao;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serial;

/**
 * Servlet implementation class LoginDispatcher
 */
@WebServlet("/LoginDispatcher")
public class LoginDispatcher extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;
    private LoginDao loginDao;
    
    public void init() {
		loginDao = new LoginDao();
	}
    
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	response.setContentType("text/html");
    	HttpSession session = request.getSession();
    	
    	String email = "";
    	String pwd = "";
    	String error = "<div id=\"err\"><p>";
    	LoginBean loginBean = new LoginBean();
    	
    	
        try {
            email = request.getParameter("login_email");
            pwd = request.getParameter("login_pwd");
        } catch (NumberFormatException e) {
        	error += e.getMessage() + "<p></div>";
        	request.setAttribute("error", error);
        	request.getRequestDispatcher("login.jsp").include(request, response);
        }
		
        if (email.contentEquals(""))
        {
        	error += "Login email required!<p></div>";
        }
        else if (pwd.contentEquals("")) {
        	error += "Login password required!<p></div>";

        }
        
        if (!error.equals("<div id=\"err\"><p>")) {
        	request.setAttribute("error", error);
        	request.getRequestDispatcher("login.jsp").include(request, response);
        }
        else {
        	try {
        		loginBean.setEmail(email);
        		loginBean.setPassword(pwd);
        		 request.getSession().setAttribute("groupname", null);
    			if (loginDao.validate(loginBean)) {
    				Cookie ck = new Cookie("name", loginBean.getName().replace(" ", "=")); 
    				Cookie loginSuccess = new Cookie("login", "true");
    				session.setAttribute("username", loginBean.getName().replace(" ", "="));
    				session.setAttribute("Google", "False");
    				
            		response.addCookie(ck);
            		response.addCookie(loginSuccess);
    				request.getRequestDispatcher("index.jsp").include(request, response);
    			} else {
    				error += "Login failed!</p></div>";
    				request.setAttribute("error", error);
    	        	request.getRequestDispatcher("login.jsp").include(request, response);
    			}
    		} catch (ClassNotFoundException e) {
    			e.printStackTrace();
    		}
        }
    }
}
