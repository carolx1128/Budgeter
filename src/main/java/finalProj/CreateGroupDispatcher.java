package finalProj;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serial;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/CreateGroupDispatcher")
public class CreateGroupDispatcher extends HttpServlet  {
	 @Serial
	    private static final long serialVersionUID = 1L;

	    /**
	     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	     * response)
	     */
	    
	    public CreateGroupDispatcher() {
	        
	    }
	    
	    @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	    	// TODO Remove userID cookie
	    	// remove and invalidate session (use session here instead of cookie)
	    	String error = "<div id=\"err\"><p>";
	    	String groupName = request.getParameter("creategroupname");
	    	
	    	try (PrintWriter out = response.getWriter()){
			    response.setContentType("text/html");
			    HttpSession session = request.getSession(); // get session from data
		    	
		    	// add groupName attribute to cookie
		    	Cookie cCode = new Cookie("groupName", groupName);
		    	cCode.setMaxAge(12 * 60 * 60); // set age to half a day
		    	response.addCookie(cCode);
		    	
		    	String username = (String) request.getSession().getAttribute("username");
	    			    		
	    		// set groupId to the users table (search by GroupName and user-name)
		    	Helper helper = new Helper();
		    	// create group and add person to group in database
		    	if(helper.checkGroupName(groupName)) {
		    		helper.createGroup(groupName);
			    	Integer groupId = helper.getGroup(groupName); // get groupid by groupName 
			    	
			    	helper.setGroupId(groupId, username); // update in database
			    	session.setAttribute("groupName", groupName); // set attribute in session
					
			        request.getRequestDispatcher("/group.jsp").forward(request, response); 
			        return;
					// possible errors and throw possible exceptions
		    	}
		    	else {
		    		error += "Group name already been used" + "</p></div>";
		        	request.setAttribute("error", error);
		        	request.getRequestDispatcher("/group.jsp").include(request, response);
		        	return;
		    	}
	    	} catch (Exception e) {
				// TODO Auto-generated catch block
	    		error += e.getMessage() + "</p></div>";
	        	request.setAttribute("error", error);
	        	request.getRequestDispatcher("group.jsp").include(request, response);
	        	return;
			}
	    }
	    
	    public void destroy() {
	        // do nothing.
	    }
	    
	    /**
	     * @throws ServletException 
	     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	     * response)
	     */
	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws IOException, ServletException {
	        doGet(request, response);
	    }
}
