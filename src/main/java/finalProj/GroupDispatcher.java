package finalProj;

import java.io.IOException;
import java.io.Serial;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class LogoutDispatcher
 */
@WebServlet("/GroupDispatcher")
public class GroupDispatcher extends HttpServlet {
	 @Serial
	    private static final long serialVersionUID = 1L;

	    /**
	     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	     * response)
	     */
	    
	    public GroupDispatcher() {
	        
	    }
	    
	    @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	    	// TODO Remove userID cookie
	    	// remove and invalidate session (use session here instead of cookie)
	    	HttpSession session = request.getSession();
	    	Helper helper = new Helper();
	    	String username =  (String) session.getAttribute("username");
	    	
	    	String groupName = (String) session.getAttribute("groupName"); // should be already set when joining a group
	    	if((groupName = helper.getGroupName(username)) != null) {
	    		session.setAttribute("groupName", groupName);
	    	}
	    	groupName = (String) session.getAttribute("groupName");
	    	ArrayList<String> groupMembers = helper.getGroupMembers(groupName);
	    	session.setAttribute("groupmembername", groupMembers);
	    	session.setAttribute("groupbudget", helper.getGroupBudget(groupName));
	    	session.setAttribute("groupexpenditure", helper.getGroupExpenditure(groupName));
	    	
	        // dispatch back to the group page, should have a button to dispatcher
	        request.getRequestDispatcher("/groupprofile.jsp").forward(request, response);
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
