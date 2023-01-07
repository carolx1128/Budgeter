package finalProj;

import java.io.IOException;
import java.io.Serial;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/JoinGroupDispatcher")
public class JoinGroupDispatcher extends HttpServlet  {
	 @Serial
	    private static final long serialVersionUID = 1L;

	    /**
	     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	     * response)
	     */
	    
	    public JoinGroupDispatcher() {
	        
	    }
	    
	    @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	    	//
	    	// remove and invalidate session (use session here instead of cookie)
	    	Helper helper = new Helper();
	    	// to join a group, enter the name of the group
	    	String groupName = request.getParameter("joingroupname");
	    	Integer groupId = null;
	    	String error = "<div id=\"err\"><p>";
	    	
	    	try {	    		
	    		groupId = helper.getGroup(groupName);
				// get id of the group by group name
		    	
		    	if(groupId == null) {
		    		// print out error message
		    	}
		    	String username = (String) request.getSession().getAttribute("username");
		    	
	    		// set groupId to the users table (search by name)
				helper.setGroupId(groupId, username);
				
				request.getSession().setAttribute("groupName", groupName); 
				
				// update in database
	    		request.getRequestDispatcher("/group.jsp").forward(request, response); 
		        return;
	    	}
			catch (Exception e){
				error += e.getMessage() + "</p></div>";
	        	request.setAttribute("error", error);
	        	request.getRequestDispatcher("group.jsp").include(request, response);
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
