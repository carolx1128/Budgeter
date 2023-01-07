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
			html {
			  height:100%;
			}
			
			body {
			  margin:0;
			}
			
			.bg {
			  animation:slide 3s ease-in-out infinite alternate;
			  background-image: linear-gradient(-60deg, #6c3 50%, #09f 50%);
			  bottom:0;
			  left:-50%;
			  opacity:.5;
			  position:fixed;
			  right:-50%;
			  top:0;
			  z-index:-1;
			}
			
			.bg2 {
			  animation-direction:alternate-reverse;
			  animation-duration:4s;
			}
			
			.bg3 {
			  animation-duration:5s;
			}
			
			@keyframes slide {
			  0% {
			    transform:translateX(-25%);
			  }
			  100% {
			    transform:translateX(25%);
			  }
			}
        </style>
        
    </head>

    <body style="background: rgb(238,174,202); background: radial-gradient(circle, rgba(238,174,202,1) 0%, rgba(148,187,233,1) 100%);">
    
    <% 
    	Cookie[] ck = request.getCookies();
    	boolean login = false;
        if(ck != null){
        	for (Cookie cookie : ck){
        		if (cookie.getName().equals("name")){
        			login = true;
        			out.print("<div id=\"mySidenav\" class=\"sidenav\"><a href=\"javascript:void(0)\" class=\"closebtn\" onclick=\"closeNav()\">&times;</a><a href=\"AddExpenditure.jsp\">Add Personal Expenditure</a><a href=\"personalDispatcher\">Personal Profile</a><a href=\"group.jsp\">Group</a><a href=\"groupprofile.jsp\">Group Profile</a></div>");
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
        					out.print("<div class=\"greeting\" style=\"display: inline-block; color: black; \"\"><p>Hi! " + cookie.getValue().replace("=", " ") + "</p></div>");
        				}
        			}
        		}
        	%> 
        		
        	<div class="form">
		       	<form action="SearchDispatcher" method="GET">
		        	
			  		<input type="text" id="in" name="in" size="60" placeholder="Please enter date...(YYYY-MM-DD)">
			  		
			  		<button type="submit"><i class="fa fa-search"></i></button>
			  		
			  		<select id="type" name="type" required>
				  		<option value="1">1 - Groceries</option>
				  		<option value="2">2 - Health</option>
				  		<option value="3">3 - Dining</option>
				  		<option value="4">4 - Travel</option>
				  		<option value="5">5 - Online Shopping</option>
			  		</select>
			  			
			    </form>
		    </div>
    			
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
		
		<div>
			<h2 style="font-family: 'Raleway', cursive; text-align: center; color: black; font-size: 4em; padding:0;">Add a personal expenditure</h2>
			<div id="wrapper" style="width: 1000px; margin-left: 35%; margin-right: auto;">
				<form action="individualExpenditure" method="GET">
					<span style="font-family: 'Raleway', cursive; color: black; font-size: 1.5em;">Enter expenditure amount:</span>
					<input type="text" id="amount" name="amount" style="margin-top: 10px; margin-bottom: 10px;" required><br>
					
					<span style="font-family: 'Raleway', cursive; color: black; font-size: 1.5em;">Choose expenditure category:</span>
					<select id="type" name="type" required>
				  		<option value="1">1 - Groceries</option>
				  		<option value="2">2 - Health</option>
				  		<option value="3">3 - Dining</option>
				  		<option value="4">4 - Travel</option>
				  		<option value="5">5 - Online Shopping</option>
				  	</select>
					<br><br><br>
					<span style="font-family: 'Raleway', cursive; color: black; font-size: 1.5em;">Enter the transaction date:</span>
					<input type="date" id="date" name="date" required>
					<br><br><br>
					<p style="font-family: 'Raleway', cursive; color: black; font-size: 1.5em;">Enter transaction description:</p>
					<textarea id="description" name="description" rows="4" cols="50" placeholder="Please enter the transaction's description..."></textarea>
					<br><br>
					<button type="submit" style="font-family: 'Raleway', cursive; background-color: blue; border: none; border-radius: 5px; color: white; width: 20%; height: 30px; margin-top: 10px; margin-left: 11%"> Add expenditure!</button>
				</form>
	        </div> 
        </div> 
        
	</div>
    	
	<div class="bg"></div>
	<div class="bg bg2"></div>
	<div class="bg bg3"></div>
	<div class="content"></div>				
        
    </body>

    </html>