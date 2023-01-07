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
	        window.onload = function() {
	    	    if(!window.location.hash) {
	    	        window.location = window.location + '#loaded';
	    	        window.location.reload();
	    	    }
	    	}
	        
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
			#first-row {
				display: flex;
				flex-direction: row;
			}
			
			img {
				width: 100%;
				height: auto;
			}
			
			#img1 {
				padding: 5px;
				padding-left: 0px;
			}
			
			#flexitems {
				width: 323px;
				padding: 5px;
			    display: flex;
			    flex-wrap: wrap;
			    padding-right: 0px;
			    padding-left: 10px;
			}
			
			#img4 {
				width: 1018px;
				height: auto;
			}
			
			#wrapper {
				width: 1024px;
				margin-left:auto;
				margin-right:auto;
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
        		}
        	}
        }
    	
    	if (!login || request.getSession().getAttribute("Google").equals("True")){
        	out.print("<div id=\"mySidenav\" class=\"sidenav\"><a href=\"javascript:void(0)\" class=\"closebtn\" onclick=\"closeNav()\">&times;</a><p>Please Log in using the web app's credentials!</p></div>");
        }
    	
    	else if(ck != null){
        	for (Cookie cookie : ck){
        		if (cookie.getName().equals("name")){
        			login = true;
        			out.print("<div id=\"mySidenav\" class=\"sidenav\"><a href=\"javascript:void(0)\" class=\"closebtn\" onclick=\"closeNav()\">&times;</a><a href=\"AddExpenditure.jsp\">Add Personal Expenditure</a><a href=\"personalDispatcher\">Personal Profile</a><a href=\"group.jsp\">Group</a><a href=\"GroupDispatcher\">Group Profile</a></div>");
        		}
        	}
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
        	
        	<% 
        		if (request.getSession() != null){
        			if (request.getSession().getAttribute("Google") != null && request.getSession().getAttribute("Google").equals("False"))
        			{
        				out.print("<div class=\"form\">" + 
        			       		"<form action=\"SearchDispatcher\" method=\"GET\">" +
		        	
        				  		"<input type=\"text\" id=\"in\" name=\"in\" size=\"60\" placeholder=\"Please enter date...(YYYY-MM-DD)\">" +
        				  		
        				  		"<button type=\"submit\" style=\"margin-left: 3px; margin-right: 3px;\"><i class=\"fa fa-search\"></i></button>" +
        				  		
        				  		"<select id=\"type\" name=\"type\" required>" +
        					  		"<option value=\"1\">1 - Groceries</option>" +
        					  		"<option value=\"2\">2 - Health</option>" +
        					  		"<option value=\"3\">3 - Dining</option>" +
        					  		"<option value=\"4\">4 - Travel</option>" +
        					  		"<option value=\"5\">5 - Online Shopping</option>" +
        				  		"</select>" +
        				  			
        				    "</form>" +
        			    "</div>");
        			}
        		}
        	%>
		    
    		<div class="hyperlinks">
      			<a href="index.jsp" class="bar-item">Home</a>
      			<% 
      				boolean LoginCookieExisting = false;
        			if(ck != null){
        				for (Cookie cookie : ck){
        					if (cookie.getName().equals("login")){
        						LoginCookieExisting = true;
        						if (cookie.getValue().equals("true")){
        							out.print("<a href=\"LogoutDispatcher\" class=\"bar-item\">Log out</a>");
        						}
        						else {
        							out.print("<a href=\"login.jsp\" class=\"bar-item\">Log in</a>");
        							out.print("<a href=\"register.jsp\" class=\"bar-item\">Register</a>");
        						}
        					}
        				}
        			}
        				
        			if (!LoginCookieExisting){
        				out.print("<a href=\"login.jsp\" class=\"bar-item\">Log in</a>");
						out.print("<a href=\"register.jsp\" class=\"bar-item\">Register</a>");
        			}
        		%> 
    		</div>
		</div>
		
		<hr>
		
		
		<div id="wrapper">
			<div id="first-row">
				<div class="img-container" id="img1">
	                <img src="img/pigbudget.webp" alt="Piggy Bank">
	            </div>
	            
	            <div id="flexitems">
	                <div class="img-container" id="img2">
	                    <img src="img/manager.png" alt="Manager">
	                </div>
	                <div class="img-container" id="img3">
	                    <img src="img/budget3.webp" alt="Budget">
	                </div>
	            </div>
	        </div> 
	        
	        <div id="second-row">
				<div class="img-container" id="img4">
	                <img src="img/budget.jpeg" alt="Piggy Writer">
	            </div>
	        </div>
        </div>  
        
	</div>
        
    </body>

    </html>