<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
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
			@import url('https://fonts.googleapis.com/css?family=Exo:400,700');

			*{
			    margin: 0px;
			    padding: 0px;
			}
			.context {
			    width: 100%;
			    position: absolute;
			    top: 30vh;
			}
			.area{
			    background: #4e54c8;  
			    background: -webkit-linear-gradient(to left, #8f94fb, #4e54c8);  
			    width: 100%;
			    height:100vh;
			}
			
			.circles li{
			    position: absolute;
			    display: block;
			    list-style: none;
			    width: 20px;
			    height: 20px;
			    background: rgba(255, 255, 255, 0.2);
			    animation: animate 25s linear infinite;
			    bottom: -150px;
			    
			}
			
			.circles li:nth-child(1){
			    left: 25%;
			    width: 80px;
			    height: 80px;
			    animation-delay: 0s;
			}
			
			
			.circles li:nth-child(2){
			    left: 10%;
			    width: 20px;
			    height: 20px;
			    animation-delay: 2s;
			    animation-duration: 12s;
			}
			
			.circles li:nth-child(3){
			    left: 70%;
			    width: 20px;
			    height: 20px;
			    animation-delay: 4s;
			}
			
			.circles li:nth-child(4){
			    left: 40%;
			    width: 60px;
			    height: 60px;
			    animation-delay: 0s;
			    animation-duration: 18s;
			}
			
			.circles li:nth-child(5){
			    left: 65%;
			    width: 20px;
			    height: 20px;
			    animation-delay: 0s;
			}
			
			.circles li:nth-child(6){
			    left: 75%;
			    width: 110px;
			    height: 110px;
			    animation-delay: 3s;
			}
			
			.circles li:nth-child(7){
			    left: 35%;
			    width: 150px;
			    height: 150px;
			    animation-delay: 7s;
			}
			
			.circles li:nth-child(8){
			    left: 50%;
			    width: 25px;
			    height: 25px;
			    animation-delay: 15s;
			    animation-duration: 45s;
			}
			
			.circles li:nth-child(9){
			    left: 20%;
			    width: 15px;
			    height: 15px;
			    animation-delay: 2s;
			    animation-duration: 35s;
			}
			
			.circles li:nth-child(10){
			    left: 85%;
			    width: 150px;
			    height: 150px;
			    animation-delay: 0s;
			    animation-duration: 11s;
			}
			
			@keyframes animate {
			
			    0%{
			        transform: translateY(0) rotate(0deg);
			        opacity: 1;
			        border-radius: 0;
			    }
			
			    100%{
			        transform: translateY(-1000px) rotate(720deg);
			        opacity: 0;
			        border-radius: 50%;
			    }
			
			}
			/* DEMO-SPECIFIC STYLES */
			.context h1 {
				color: #fff;
				font-family: monospace;
				overflow: hidden; /* Ensures the content is not revealed until the animation */
				border-right: .15em solid orange; /* The typwriter cursor */
				white-space: nowrap; /* Keeps the content on a single line */
				margin: 0 auto; /* Gives that scrolling effect as the typing happens */
				letter-spacing: .15em; /* Adjust as needed */
				animation: 
				  typing 2s steps(30, end),
				  blink-caret .5s step-end infinite;
			}
			
			/* The typing effect */
			@keyframes typing {
				from { width: 0 }
				to { width: 25% }
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
	<div id="main" style="background: #4e54c8; background: -webkit-linear-gradient(to left, #8f94fb, #4e54c8);">
	  <div class="top"><!-- Use any element to open the sidenav -->
		<span onclick="openNav()"><i class="fa fa-bars" aria-hidden="true"></i></span>
		<a href="index.jsp" class="Budgeter">Budgeter</a>
    		
   		<% 
       		if(ck != null){
       			for (Cookie cookie : ck){
       				if (cookie.getName().equals("name")){
       					out.print("<div class=\"greeting\"\" style=\"color: white;\"><p>Hi! " + cookie.getValue().replace("=", " ") + "</p></div>");
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
     			<a href="index.jsp" class="bar-item" style="color: white;">Home</a>
     			<% 
     				boolean LoginCookieExisting = false;
       			if(ck != null){
       				for (Cookie cookie : ck){
       					if (cookie.getName().equals("login")){
       						LoginCookieExisting = true;
       						if (cookie.getValue().equals("true")){
       							out.print("<a href=\"LogoutDispatcher\" class=\"bar-item\" style=\"color: white;\">Log out</a>");
       						}
       						else {
       							out.print("<a href=\"login.jsp\" class=\"bar-item\" style=\"color: white;\">Log in</a>");
       							out.print("<a href=\"register.jsp\" class=\"bar-item\" style=\"color: white;\">Register</a>");
       						}
       					}
       				}
       			}
       				
       			if (!LoginCookieExisting){
       				out.print("<a href=\"login.jsp\" class=\"bar-item\" style=\"color: white;\">Log in</a>");
					out.print("<a href=\"register.jsp\" class=\"bar-item\" style=\"color: white;\">Register</a>");
       			}
       		%> 
   		</div>
	</div>
		
	<hr>
	
       
	</div>
    	
        
	<div class="context"">
		<%	
		String groupname = (String) session.getAttribute("groupName");
		out.println("<h1 style=\"text-align: center; font-family: 'Raleway', cursive; color: white;\"> Group Name: " + groupname + "</h1><br>");
		ArrayList<String> groupmembername = (ArrayList<String>) request.getSession().getAttribute("groupmembername");
		
		out.println("<h1 style=\"text-align: center; font-family: 'Raleway', cursive; color: white;\">Group member(s):</h1><br>");
		for (String name : groupmembername){
			out.println("<h1 style=\"text-align: center; font-family: 'Raleway', cursive; color: white;\">&nbsp;&nbsp;&nbsp;&nbsp;" + name + "</h1>");
		}
		
		Double budget = (Double) request.getSession().getAttribute("groupbudget");
		out.println("<h1 style=\"text-align: center; font-family: 'Raleway', cursive; color: white;\"> Group Budget: " + budget + "</h1><br>");
		
		Double amount = (Double) request.getSession().getAttribute("groupexpenditure");
		out.println("<h1 style=\"text-align: center; font-family: 'Raleway', cursive; color: white;\"> Group Expenditure: " + amount + "</h1><br>");
	
		if (amount > budget){
			out.println("<h1 style=\"text-align: center; font-family: 'Raleway', cursive; color: white;\"> Your group has exceeded the budget! </h1>");
		}
	%>
	</div>
	
	<div class="area" style="">
		<ul class="circles">
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>
	</div>
	
    </body>

    </html>