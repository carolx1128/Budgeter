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
	        CSSResult Skip Results Iframe
			EDIT ON
			/* Cool infinite background scrolling animation.
			 * Twitter: @kootoopas
			 */
			/* Exo thin font from Google. */
			@import url(https://fonts.googleapis.com/css?family=Exo:100);
			/* Background data (Original source: https://subtlepatterns.com/grid-me/) */
			/* Animations */
			@-webkit-keyframes bg-scrolling-reverse {
			  100% {
			    background-position: 50px 50px;
			  }
			}
			@-moz-keyframes bg-scrolling-reverse {
			  100% {
			    background-position: 50px 50px;
			  }
			}
			@-o-keyframes bg-scrolling-reverse {
			  100% {
			    background-position: 50px 50px;
			  }
			}
			@keyframes bg-scrolling-reverse {
			  100% {
			    background-position: 50px 50px;
			  }
			}
			@-webkit-keyframes bg-scrolling {
			  0% {
			    background-position: 50px 50px;
			  }
			}
			@-moz-keyframes bg-scrolling {
			  0% {
			    background-position: 50px 50px;
			  }
			}
			@-o-keyframes bg-scrolling {
			  0% {
			    background-position: 50px 50px;
			  }
			}
			@keyframes bg-scrolling {
			  0% {
			    background-position: 50px 50px;
			  }
			}
			/* Main styles */
			body {
			  color: #999;
			  /* img size is 50x50 */
			  background: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAIAAACRXR/mAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAIGNIUk0AAHolAACAgwAA+f8AAIDpAAB1MAAA6mAAADqYAAAXb5JfxUYAAABnSURBVHja7M5RDYAwDEXRDgmvEocnlrQS2SwUFST9uEfBGWs9c97nbGtDcquqiKhOImLs/UpuzVzWEi1atGjRokWLFi1atGjRokWLFi1atGjRokWLFi1af7Ukz8xWp8z8AAAA//8DAJ4LoEAAlL1nAAAAAElFTkSuQmCC") repeat 0 0;
			  -webkit-animation: bg-scrolling-reverse 0.92s infinite;
			  /* Safari 4+ */
			  -moz-animation: bg-scrolling-reverse 0.92s infinite;
			  /* Fx 5+ */
			  -o-animation: bg-scrolling-reverse 0.92s infinite;
			  /* Opera 12+ */
			  animation: bg-scrolling-reverse 0.92s infinite;
			  /* IE 10+ */
			  -webkit-animation-timing-function: linear;
			  -moz-animation-timing-function: linear;
			  -o-animation-timing-function: linear;
			  animation-timing-function: linear;
			}
			
			#err {
				width: 100%;
				height: 40px;
				text-align: center;
				padding: 10px;
				font-size: 12px;
				background-color: rgb(255, 214, 214);
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
	
	<%
		String error = (String) request.getAttribute("error");
			if (error != null) out.println(error);
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
		
		
		<div style="height: 150px; vertical-align: center;">
			<form action="JoinGroupDispatcher" method="GET">
				<h2 style="font-family: 'Raleway', cursive; text-align: center; color: black; font-size: 2em;">Join an existing group</h2>
				<div style="margin-left: auto; margin-right: auto; width: 27%">
					<span style="font-family: 'Raleway', cursive; color: black;">Enter your group name:</span>
					<input type="text" id="joingroupname" name="joingroupname" style="margin-top: 10px; margin-bottom: 10px;" required><br>
					<button type="submit" style="font-family: 'Raleway', cursive; background-color: blue; border: none; border-radius: 5px; color: white; width: 100%; height: 30px; margin-left: auto; margin-right: auto; margin-top: 10px;"><i class=" fa fa-sign-in"></i> Join the group!</button>
				</div>
			</form>
		</div>
		<br><br><br>
		<hr>
		<div style="vertical-align: center;">	
			<form action="CreateGroupDispatcher" method="GET">
				<h2 style="font-family: 'Raleway', cursive; text-align: center; color: black; font-size: 2em;">Create a group</h2>
				<div style="margin-left: auto; margin-right: auto; width: 27%">
					<span style="font-family: 'Raleway', cursive; color: black;">Enter your group name:</span>
					<input type="text" id="creategroupname" name="creategroupname" style="margin-top: 10px; margin-bottom: 10px;" required><br>
					<button type="submit" style="font-family: 'Raleway', cursive; background-color: blue; border: none; border-radius: 5px; color: white; width: 100%; height: 30px; margin-top: 10px;"><i class=" fa fa-user-plus"></i> Create a group!</button>
				</div>		
			</form>
        </div>  
        
	</div>
    	
    				
        
    </body>

    </html>