package finalProj;

import java.io.IOException;
import java.io.Serial;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/individualExpenditure")
public class individualExpenditure extends HttpServlet {
	 @Serial
	    private static final long serialVersionUID = 1L;

	    /**
	     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	     * response)
	     */
	    
	    public individualExpenditure() {
	        
	    }
	    
	    @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	// TODO Remove userID cookie
	    	// remove and invalidate session (use session here instead of cookie)
	   
	        // dispatch back to the group page, should have a button to dispatcher
			 response.setContentType("text/html");
			 HttpSession session = request.getSession();
			  // get user entered email/password from request
			  Double amount = Double.parseDouble(request.getParameter("amount"));
			  Integer typeOfTransaction = Integer.parseInt(request.getParameter("type"));
			  String date = request.getParameter("date");
			  String description = request.getParameter("description");
			  Helper helper = new Helper();
			  
			  String username = null;
			  Cookie[] ck = request.getCookies();
			  if(ck != null){
		        	for (Cookie cookie : ck){
		        		if (cookie.getName().equals("name")){
							username = cookie.getValue();
		        		}
		        	}
		        }
			  request.getSession().setAttribute("username", username);
			  request.getSession().setAttribute("amount", helper.getPersonalExpenditure(username));
			  Integer userId = 0;
			try {
				userId = helper.searchIdbyName(username);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			  
			  // add new expenditure to the database;
			  try {
				  ExecutorService executor = Executors.newFixedThreadPool(1);
				  AddExpenditureThread individualThread = new AddExpenditureThread(amount, typeOfTransaction, date, description, username, userId);
				  executor.execute(individualThread);
				  Thread.sleep(1000);
				  executor.shutdown();
				  
				  while (!executor.isTerminated()) {
					  Thread.yield(); // pausing the main thread
				  }
				  
				  request.getRequestDispatcher("/AddExpenditure.jsp").forward(request, response);
				// helper.addExpenditure(amount, typeOfTransaction, date, userId, description);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			  
			  // String targetBudget = request.getParameter("budget");

			  String errorMessage = "";
	    }
	    
	    public void destroy() {
	        // do nothing.
	    }
	    
	    /**
	     * @throws IOException 
	     * @throws ServletException 
	     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	     * response)
	     */
	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        doGet(request, response);
	    }
}

