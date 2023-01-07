package finalProj;

import java.io.IOException;
import java.io.Serial;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/personalDispatcher")
public class personalDispatcher extends HttpServlet {
	 @Serial
	    private static final long serialVersionUID = 1L;

	    /**
	     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	     * response)
	     */
	    
	    public personalDispatcher() {
	        
	    }
	    
	    @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	    	// TODO Remove userID cookie
	    	// remove and invalidate session (use session here instead of cookie)
	    	HttpSession session = request.getSession();
	    	String username = (String) session.getAttribute("username"); // should be already set when joining a group
	    	Helper helper = new Helper();
	    	session.setAttribute("amount", helper.getPersonalExpenditure(username));
	    	
	        // dispatch back to the group page, should have a button to dispatcher
	        request.getRequestDispatcher("/personalprofile.jsp").forward(request, response);
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
