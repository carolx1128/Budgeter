package finalProj;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serial;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/SearchDispatcher")
public class SearchDispatcher extends HttpServlet {
	 @Serial
	    private static final long serialVersionUID = 1L;

	    /**
	     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	     * response)
	     */
	    
	    public SearchDispatcher() {
	        
	    }
	    
	    @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
	    	// TODO Remove userID cookie
	    	// remove and invalidate session (use session here instead of cookie)
	    	try (PrintWriter out = response.getWriter()){
	    		ArrayList<Expenditure> expenditures = new ArrayList<Expenditure> ();
	    		
			    response.setContentType("text/html");
			    
			    Helper helper = new Helper();
			    
			    // get from info entered at html/jsp page
			    String category = request.getParameter("type");
			    String date = request.getParameter("in");
			    
			    if(category.equals("1")) {
			    	category = "Groceries";
			    }
			    else if(category.equals("2")) {
			    	category = "Health";
			    }
			    else if(category.equals("3")) {
			    	category = "Dining";
			    }
			    else if(category.equals("4")) {
			    	category = "Travel";
			    }
			    else if(category.equals("5")) {
			    	category = "Online Shopping";
			    }
		  		
			    // result search by date from database
			    String username = (String) request.getSession().getAttribute("username");
			    
			    if(!date.equals("Please enter date...(YYYY-MM-DD)") || date != null) {
			    	expenditures = helper.searchByDate(date, username);			    
			    }
			    // result display by category
			    
			    if(category != null) {
			    	expenditures = helper.searchByCategory(category, username);
			    }
			    
			    // *** NOTE ***
			    HttpSession session = request.getSession(); // get session from data
			    // searched result are stored in session, so that it can be displayed later
			    String result = "";
			    
			    for(Expenditure exp : expenditures) {
			    	result += "<div class=\"result\">";
			    	   result += "<div class=\"text\">"
			    	   		+ "<a style=\"font-size: 15px;\"></a >"
			    	   		+ "<p>Amount: " + exp.getAmount() + "</p >"
			    	   		+ "<p>Date: " + exp.getDate() + "</p >"
			    	   		+ "<p>Transaction Type: ";
			    	   
			    	   if (exp.getGenre_id() == 1) {
			    		   result += "Groceries";
			    	   }
			    	   else if(exp.getGenre_id() == 2) {
			    		   result += "Health";
					   }
					   else if(exp.getGenre_id() == 3) {
						   result += "Dining";
					   }
					   else if(exp.getGenre_id() == 4) {
						   result += "Travel";
					   }
					   else if(exp.getGenre_id() == 5) {
						   result +="Online Shopping";
					   }
			    		   
			    	   result += "</p >";
			    	   result += "</div>";
			    	   result += "</div>"
			    	   		+ "<hr style=\"width:90%;\"><br>";
			    }
			    session.setAttribute("expenditures", result); // store a html string
			    
			    // write later, possible errors and throw possible exceptions
				String errorMessage = "";
				
		    	// search result page
		        request.getRequestDispatcher("/search.jsp").include(request, response); 
	    	} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }
	    
	    public void destroy() {
	        // do nothing.
	    }
	    
	    /**
	     * @throws ServletException 
	     * @throws IOException 
	     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	     * response)
	     */
	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
	        doGet(request, response);
	    }
}

