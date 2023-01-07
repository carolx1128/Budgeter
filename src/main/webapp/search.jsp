<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Budgeter</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Lobster&family=Roboto:wght@300&display=swap"
            rel="stylesheet">
        <link rel="stylesheet" href="index.css">
        <script src="https://kit.fontawesome.com/3204349982.js" crossorigin="anonymous"></script>
        
        <script>
	        
	        /* Set the width of the side navigation to 250px and the left margin of the page content to 250px */
	        function openNav() {
	          document.getElementById("mySidenav").style.width = "250px";
	          document.getElementById("main").style.marginLeft = "250px";
	        }

	        /* Set the width of the side navigation to 0 and the left margin of the page content to 0 */
	        function closeNav() {
	          document.getElementById("mySidenav").style.width = "0";
	          document.getElementById("main").style.marginLeft = "0";
	        }
        </script>
        
        <style>
        	form{
        		width: 60%;
        		margin: auto;
        	}
        	
        	.result{
        		width: 90%;
        		margin-left: auto;
        		margin-right: auto;
        	}
        </style>
        
    </head>

    <body>
    
   <% 
    	Cookie[] ck = request.getCookies();
    	boolean login = false;
        if(ck != null){
        	for (Cookie cookie : ck){
        		if (cookie.getName().equals("name")){
        			login = true;
        			out.print("<div id=\"mySidenav\" class=\"sidenav\"><a href=\"javascript:void(0)\" class=\"closebtn\" onclick=\"closeNav()\">&times;</a><a href=\"AddExpenditure.jsp\">Add Personal Expenditure</a><a href=\"personalDispatcher\">Personal Profile</a><a href=\"group.jsp\">Group</a><a href=\"GroupDispatcher\">Group Profile</a></div>");
        		}
        	}
        }
        
        if (!login){
        	out.print("<div id=\"mySidenav\" class=\"sidenav\"><a href=\"javascript:void(0)\" class=\"closebtn\" onclick=\"closeNav()\">&times;</a><p>Please Log in!</p></div>");
        }
    %> 
	
	<!-- Add all page content inside this div if you want the side nav to push page content to the right (not used if you only want the sidenav to sit on top of the page -->
	<div id="main">
	  <div class="top">
	  
	  	<!-- Use any element to open the sidenav -->
		<span onclick="openNav()"><i class="fa fa-bars" aria-hidden="true"></i></span>

    		<a href="index.jsp" class="Budgeter">Budgeter</a>
    		
    		<% 
        		if(ck != null){
        			for (Cookie cookie : ck){
        				if (cookie.getName().equals("name")){
        					out.print("<div class=\"greeting\"\" style=\"color: black;\"><p>Hi! " + cookie.getValue().replace("=", " ") + "</p></div>");
        				}
        			}
        		}
        	%> 
        		
  			
    		<div class="hyperlinks">
      			<a href="index.jsp" class="bar-item" style="font-family: 'Raleway', cursive;">Home</a>
      			<% 
      				boolean LoginCookieExisting = false;
        			if(ck != null){
        				for (Cookie cookie : ck){
        					if (cookie.getName().equals("login")){
        						LoginCookieExisting = true;
        						if (cookie.getValue().equals("true")){
        							out.print("<a href=\"LogoutDispatcher\" class=\"bar-item\" style=\"font-family: 'Raleway', cursive;\">Log out</a>");
        						}
        						else {
        							out.print("<a href=\"login.jsp\" class=\"bar-item\" style=\"font-family: 'Raleway', cursive;\">Log in</a>");
        							out.print("<a href=\"register.jsp\" class=\"bar-item\" style=\"font-family: 'Raleway', cursive;\">Register</a>");
        						}
        					}
        				}
        			}
        				
        			if (!LoginCookieExisting){
        				out.print("<a href=\"login.jsp\" class=\"bar-item\" style=\"font-family: 'Raleway', cursive;\">Log in</a>");
						out.print("<a href=\"register.jsp\" class=\"bar-item\" style=\"font-family: 'Raleway', cursive;\">Register</a>");
        			}
        		%> 
    		</div>
		</div>
		
		<hr>
		
		<h2 style="font-family: 'Raleway', sans-serif; text-align: center; color: black; font-size: 5em;">Search</h2>
		<div id="wrapper">
			<div class="form" style="width: 100%">
		       	<form action="SearchDispatcher" method="GET">
			  		
			  		<input type="text" id="in" name="in" size="60" placeholder="Upon entering date, follow this format: YYYY-MM-DD">
			  		
			  		<select id="type" name="type" required>
				  		<option value="1">1 - Groceries</option>
				  		<option value="2">2 - Health</option>
				  		<option value="3">3 - Dining</option>
				  		<option value="4">4 - Travel</option>
				  		<option value="5">5 - Online Shopping</option>
			  		</select>
			  		
			  		<button type="submit"><i class="fa fa-search"></i></button>
			  			
			    </form>
		    </div>
        </div>  
        
	</div>
	<br>
	<br>
	<br>
	<br>
    	
   	<hr>
   	
   	<%	
		String result = (String) request.getSession().getAttribute("expenditures");
		if (result != null) out.println(result);
	%>
        
    </body>

    </html>