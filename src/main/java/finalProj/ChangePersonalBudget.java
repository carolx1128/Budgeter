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


@WebServlet("/ChangePersonalBudget")
public class ChangePersonalBudget extends HttpServlet  {
	 @Serial
	    private static final long serialVersionUID = 1L;

	    /**
	     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	     * response)
	     */
	    
	    public ChangePersonalBudget() {
	        
	    }
	    
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	    	String budget=request.getParameter("newbudget").replace("=", "&");
	    	
	    	request.getSession().setAttribute("budget", budget);
	    	Helper helper = new Helper();

	    	String username = (String) request.getSession().getAttribute("username");
	    	try {
	    		Double d = Double.parseDouble(budget);
				helper.changeBudget(username, d);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	
	    	request.getRequestDispatcher("personalprofile.jsp").forward(request, response);
	    }
	    
	    public void destroy() {
	        // do nothing.
	    }
	    
	    /**
	     * @throws ServletException 
	     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	     * response)
	     */
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws IOException, ServletException {
	        doGet(request, response);
	    }
}
