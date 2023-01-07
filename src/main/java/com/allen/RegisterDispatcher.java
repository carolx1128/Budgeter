package com.allen;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import register.dao.UserDao;
import register.model.User;

import java.io.IOException;
import java.io.Serial;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;

/**
 * Servlet implementation class RegisterDispatcher
 */
@WebServlet("/RegisterDispatcher")
public class RegisterDispatcher extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    private UserDao userDao = new UserDao();
    
    /**
     * Default constructor.
     */
    public RegisterDispatcher() {
    }


    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //TODO
    	response.getWriter().append("Server at: ").append(request.getContextPath());
    	
    	RequestDispatcher dispatcher = request.getRequestDispatcher("/register.jsp");
    	dispatcher.forward(request, response);
    	
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
    	String email = "";
    	String username = "";
		String pwd = "";
		String cpwd = "";
    	String error = "<div id=\"err\"><p>";
    	
    	try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
    	
    	try {
    		
    		email = request.getParameter("reg_email");
    		username = request.getParameter("reg_name");
    		pwd = request.getParameter("reg_pwd");
    		cpwd = request.getParameter("reg_cpwd");
    		
    		
        }
        catch (Exception e) {
        	error += e.getMessage() + "</p></div>";
        	request.setAttribute("error", error);
        	request.getRequestDispatcher("register.jsp").include(request, response);
        }
    	
        if (email.contentEquals(""))
        {
        	error += "Registration email required!<p></div>";
        }
        else if (username.contentEquals("")) {
        	error += "Registration name required!<p></div>";
        }
        else if (pwd.contentEquals("")) {
        	error += "Registration password required!<p></div>";

        }
        else if (cpwd.contentEquals("")) {
        	error += "Please confirm your password!<p></div>";
        }
        else if (pwd.compareTo(cpwd) != 0) {
        	error += "Confirmation password does not match!<p></div>";
        }

        try (Connection connection = DriverManager
				.getConnection("jdbc:mysql://us-cdbr-east-05.cleardb.net/heroku_98fbc899c66fe0b?useSSL=false", "b764fe1630b005", "c1062c1a");

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection
						.prepareStatement("select * from user where userEmail = ?")) {
			preparedStatement.setString(1, email);
			
			ResultSet rs = preparedStatement.executeQuery();
			boolean status = rs.next();
			
			if (status) {
				error += "Repeated email!</p></div>";
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
			
        
        // Judge errors
        if (!error.equals("<div id=\"err\"><p>")) {
        	request.setAttribute("error", error);
        	request.getRequestDispatcher("register.jsp").include(request, response);
        }
        
        else {
        	User user = new User();
            user.setEmail(email);
            user.setName(username);
            user.setPassword(pwd);
            
            try {
    			userDao.registerUser(user);
    		} catch (ClassNotFoundException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
            
            response.sendRedirect("index.jsp");
        }
        
    }

}
