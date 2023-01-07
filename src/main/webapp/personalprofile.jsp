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
			.at-item {
				color: black;
				animation-name: text-focus-in;
				animation-duration: 1s;
				animation-timing-function: ease;
				animation-delay: 0s;
				animation-iteration-count: 1;
				animation-direction: normal;
				animation-fill-mode: none;
				/* shorthand 
				animation: text-focus-in 0.6s ease 0s 1 normal none;
				*/ 
			}
			@keyframes text-focus-in {
				0%{
				  filter: blur(12px);
				  opacity: 0;
				}
				100%{
				  filter: blur(0);
				  opacity: 1;
				}
			}
			
			#Clouds {
			  position: absolute;
			  top: 0;
			  right: 0;
			  bottom: 0;
			  left: 0;
			  margin: auto;
			  height: 30%;
			  overflow: hidden;
			  -webkit-animation: FadeIn 3.1s ease-out;
			          animation: FadeIn 3.1s ease-out;
			  -webkit-user-select: none;
			     -moz-user-select: none;
			      -ms-user-select: none;
			          user-select: none;
			}
			@-webkit-keyframes FadeIn {
			  from {
			    opacity: 0;
			  }
			  to {
			    opacity: 1;
			  }
			}
			@keyframes FadeIn {
			  from {
			    opacity: 0;
			  }
			  to {
			    opacity: 1;
			  }
			}
			.Cloud {
			  position: absolute;
			  width: 100%;
			  background-repeat: no-repeat;
			  background-size: auto 100%;
			  height: 70px;
			  -webkit-animation-duration: 120s;
			          animation-duration: 120s;
			  -webkit-animation-iteration-count: infinite;
			          animation-iteration-count: infinite;
			  -webkit-animation-fill-mode: forwards;
			          animation-fill-mode: forwards;
			  -webkit-animation-timing-function: linear;
			          animation-timing-function: linear;
			  -webkit-animation-name: Float, FadeFloat;
			          animation-name: Float, FadeFloat;
			  z-index: 1;
			}
			.Cloud.Foreground {
			  height: 10%;
			  min-height: 20px;
			  z-index: 3;
			}
			.Cloud.Background {
			  height: 9.09090909%;
			  min-height: 8px;
			  -webkit-animation-duration: 210s;
			          animation-duration: 210s;
			}
			@-webkit-keyframes Float {
			  from {
			    transform: translateX(100%) translateZ(0);
			  }
			  to {
			    transform: translateX(-15%) translateZ(0);
			  }
			}
			@keyframes Float {
			  from {
			    transform: translateX(100%) translateZ(0);
			  }
			  to {
			    transform: translateX(-15%) translateZ(0);
			  }
			}
			@-webkit-keyframes FadeFloat {
			  0%,
			  100% {
			    opacity: 0;
			  }
			  5%,
			  90% {
			    opacity: 1;
			  }
			}
			@keyframes FadeFloat {
			  0%,
			  100% {
			    opacity: 0;
			  }
			  5%,
			  90% {
			    opacity: 1;
			  }
			}
			.Cloud:nth-child(10) {
			  -webkit-animation-delay: -184.61538462s;
			          animation-delay: -184.61538462s;
			  top: 60%;
			}
			.Cloud.Foreground:nth-child(10) {
			  -webkit-animation-duration: 80s;
			          animation-duration: 80s;
			  height: 35%;
			}
			.Cloud.Background:nth-child(10) {
			  -webkit-animation-duration: 110s;
			          animation-duration: 110s;
			  height: -3.40909091%;
			}
			.Cloud:nth-child(9) {
			  -webkit-animation-delay: -166.15384615s;
			          animation-delay: -166.15384615s;
			  top: 54%;
			}
			.Cloud.Foreground:nth-child(9) {
			  -webkit-animation-duration: 84s;
			          animation-duration: 84s;
			  height: 32.5%;
			}
			.Cloud.Background:nth-child(9) {
			  -webkit-animation-duration: 114s;
			          animation-duration: 114s;
			  height: -2.15909091%;
			}
			.Cloud:nth-child(8) {
			  -webkit-animation-delay: -147.69230769s;
			          animation-delay: -147.69230769s;
			  top: 48%;
			}
			.Cloud.Foreground:nth-child(8) {
			  -webkit-animation-duration: 88s;
			          animation-duration: 88s;
			  height: 30%;
			}
			.Cloud.Background:nth-child(8) {
			  -webkit-animation-duration: 118s;
			          animation-duration: 118s;
			  height: -0.90909091%;
			}
			.Cloud:nth-child(7) {
			  -webkit-animation-delay: -129.23076923s;
			          animation-delay: -129.23076923s;
			  top: 42%;
			}
			.Cloud.Foreground:nth-child(7) {
			  -webkit-animation-duration: 92s;
			          animation-duration: 92s;
			  height: 27.5%;
			}
			.Cloud.Background:nth-child(7) {
			  -webkit-animation-duration: 122s;
			          animation-duration: 122s;
			  height: 0.34090909%;
			}
			.Cloud:nth-child(6) {
			  -webkit-animation-delay: -110.76923077s;
			          animation-delay: -110.76923077s;
			  top: 36%;
			}
			.Cloud.Foreground:nth-child(6) {
			  -webkit-animation-duration: 96s;
			          animation-duration: 96s;
			  height: 25%;
			}
			.Cloud.Background:nth-child(6) {
			  -webkit-animation-duration: 126s;
			          animation-duration: 126s;
			  height: 1.59090909%;
			}
			.Cloud:nth-child(5) {
			  -webkit-animation-delay: -92.30769231s;
			          animation-delay: -92.30769231s;
			  top: 30%;
			}
			.Cloud.Foreground:nth-child(5) {
			  -webkit-animation-duration: 100s;
			          animation-duration: 100s;
			  height: 22.5%;
			}
			.Cloud.Background:nth-child(5) {
			  -webkit-animation-duration: 130s;
			          animation-duration: 130s;
			  height: 2.84090909%;
			}
			.Cloud:nth-child(4) {
			  -webkit-animation-delay: -73.84615385s;
			          animation-delay: -73.84615385s;
			  top: 24%;
			}
			.Cloud.Foreground:nth-child(4) {
			  -webkit-animation-duration: 104s;
			          animation-duration: 104s;
			  height: 20%;
			}
			.Cloud.Background:nth-child(4) {
			  -webkit-animation-duration: 134s;
			          animation-duration: 134s;
			  height: 4.09090909%;
			}
			.Cloud:nth-child(3) {
			  -webkit-animation-delay: -55.38461538s;
			          animation-delay: -55.38461538s;
			  top: 18%;
			}
			.Cloud.Foreground:nth-child(3) {
			  -webkit-animation-duration: 108s;
			          animation-duration: 108s;
			  height: 17.5%;
			}
			.Cloud.Background:nth-child(3) {
			  -webkit-animation-duration: 138s;
			          animation-duration: 138s;
			  height: 5.34090909%;
			}
			.Cloud:nth-child(2) {
			  -webkit-animation-delay: -36.92307692s;
			          animation-delay: -36.92307692s;
			  top: 12%;
			}
			.Cloud.Foreground:nth-child(2) {
			  -webkit-animation-duration: 112s;
			          animation-duration: 112s;
			  height: 15%;
			}
			.Cloud.Background:nth-child(2) {
			  -webkit-animation-duration: 142s;
			          animation-duration: 142s;
			  height: 6.59090909%;
			}
			.Cloud:nth-child(1) {
			  -webkit-animation-delay: -18.46153846s;
			          animation-delay: -18.46153846s;
			  top: 6%;
			}
			.Cloud.Foreground:nth-child(1) {
			  -webkit-animation-duration: 116s;
			          animation-duration: 116s;
			  height: 12.5%;
			}
			.Cloud.Background:nth-child(1) {
			  -webkit-animation-duration: 146s;
			          animation-duration: 146s;
			  height: 7.84090909%;
			}
			.Cloud {
			  background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAKQAAABgCAYAAACTzNnjAAAFCklEQVR42u3d34uVRRjA8YMsEi0iSwhdRBGhSJgZiNRFIkWhQVEXBipKUVBBLCF6k0h4UxFkBLq4QT/Qiyi80EgxCjXMWqOMtqy0bBNja92yXatN3c3pGc9sHU/v+X3emWfe93vx+QN23u+e95x5Z94pmNWFQo5NEytErzgoBsSIOCf+FqbEBTEhzophcVTsFxvFEjE152PZHGMukbcB6BAPij0uqgtl0bXCBvyjeFPcS2wEWc0y0ec++Ywnf7rwbyc8grQ6RY8Y9RhhJT+Jde4TmghzFuR08bo4ryDEpE/N58QUYsx+kFPcD4yzCkMsZz+1uwkyu0HeKYYiCLHcN2I2QWYnSPudbHubfy37NuFu4wQZeZD2k2Uw4hDLHRZdBBnnH3K/5ykcX86IeQQZl6civ0XXYv/RlhJkHLZkOMTypz7dBKnbyzmJsfTZeTdB6vRszmIsjXI5QeryWMa/M9ZinzjdTJA63CLGcxzjpD/ElQQZfq3iKDFe8lSHIAPqI8L/6SHIMB4nvorTQQsI0v+teoz4KjpBkH7tIrqaNhCkH9cnbK5C8q/uywiSHzKabCLIdM3K+QR4o8YysfVWcZDvElnD1hNkOi5XuilLu5MlOyzni3vESnGfWCRuIMjm1zgSWPM7GWvNXdonXkdM8Q0dCwmytu8Iy/vK9B3iRoJMnghnqifc8jb7yXkXQf5nLWGo2WR2HUGuLrxPDKq25D6d9yBPE4I6/e6rVO6CnMpkuFq/eLmFKwtyMRde/dOg2XkKkvlH/X5P9ZNSWZBvcMGjMJza6iJlQe7nYkfjozwE+TkXOiprsx7kES5yVOzLYK/IcpA/cJGj806Wg/yaCxzlzsersxpkPxc4SruzGuQBLm603yU7DPOQUOSJWIK0E6j2lcvPm+JJVp+674oDbiFuv5t/fEXs5cJG65DmIO3KY3vG3yCLbXO1N1xVkB3uWfQQFye3rtUS5DN1bC5C9j0cOki7XOwUFwJOb6gg7TmCW1lMizI7QwQ5nW2qqGCv7yDtwsxfGXhU0OczyKvECIOOKvb5CnKa2+TDoKOat3wFyaIH1ONFH0H2MNCo00NpBzmXR39owIy0gzzOIKNOv6X9LHsZg4wGp3xsM/ZMoUfF3aaZ4++qBDnIIKMNzrsHKb11Lb6oEORtDCRSYB81f+vWxzYUJBv2kTYb5vx6gzzHgMHTjsUXagV5BwMFzz78d5NYQpDbGCAEcOzissaEIL9kcBDIx0lBsrwMIW0uD3KcQUHgqaEFpUGyLQGhnSgNkgGBBg8QJDQ5Phkky82g5bvkNQXDscDQY6MNcpiBgBL9NsjDDAS0LPq1Qb7EQECJicLFSUkGAkpMLgMaYzCgKci3GQxomPqZDPImBgMa9uOULifnDWcI7VRpkIsYEAR2sHwX2GcMCgJak/QKPh4lIsgcpOhM2iv7JIODAPqqvY7vPQYInlf6zKsWpN2iOMBAwZMD9bzSudPwvh+kr3gofJ0vve/ikxIp36pXNHosiD2j5gMGD2ksyG3lJK917qc5A4l2eNW04Wi5OaZ41DADilZu0xtMmw/fXCV+ZnDRoFFTfBdpaudlLxVfsXMRNYy7W3SH8XSAu/01bo8s/kL8xQWAM+JC7DIeDnCvZqZ4RGxxi3/3iUPOJ+5TtRXfG/v6jeadNMVjlqsZquG0uwU164ybg2vFuPuh2ax23tkm3N91VLwmbjVNvPT+H7Ro4730ITNPAAAAAElFTkSuQmCC);
			}
			.Cloud.Background {
			  background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEoAAAAqCAYAAAAUJM0rAAACFUlEQVRo3u3aPSwDYRzH8UZEbAYiYrDYjLZGpIPBJLGwSKwi0k1iYBKDdFJsEiMxSZgsFZJGiGjqJWEhSKuaNKRUG8r5PfI8SXOud72+PH2eu2f47Ndv7+V5/nee/G6bh5MWmIV9iEMWvkGjfiADD7AHk9BU6+PSNK0kPAINwwXkC6KU6gvC4HVyKB/clhHHCDnbTqHbSaEaYIv+OK3KyBk274RQrXBXg0B6B/QPkTIUiZTiEIm5gkbZQjXTJ5nG2ZFsocJ1iMQEZQk1VcdIGl2L9Yoeitwj3uocirgRPVRAgEjMoMihkgKFStIzK063QVHYhKF6h/IKFMlKGpaNlhM8Qq1JFIp5gQHeoSIShmJPST/PUElJQ7FN9hivUGmJQxE56OQRKiN5qL/NNY9QKQeEIpdgR7VC9cEqHeGeUyEHXHrMUiWhyKx6BV4dEsNMtNxQI4Ls33h5LidUoEYjXKEXoXZDLbgsEBOzE8qne8fmJhE7oWIujUQcwhyMmy0VSKRRF0cyWlclYMYo1LEKZOgRugpDpVWUot5ZLI8LlwN23bNQKoY1vwpVmmsS6kOFsPRJQl2qENZIqGkVwnp9xb5nUksEcxm2hZlQMcy3OYXTgx0VpOi2pl8/jwqpMP9sF5twBl08ctE7I/dws5l5D5y4OBj51HvdzluYdlik0RL06cjkKpSlB1Span5x/AQb5Hfrxyy/oU5ISeVw53AAAAAASUVORK5CYII=);
			}
			html,
			body {
			  margin: 0;
			  padding: 0;
			}
			html {
			  height: 100%;
			}
			body {
			  min-height: 100%;
			}
			body {
			  color: #FFF;
			  background-color: #FD940A;
			  background-image: radial-gradient(circle, #F9A72B 0%, #FA9026 70%, #FB6C1F 100%);
			}
        </style>
        
    </head>

    <body style="background-image: linear-gradient(to right, yellow , salmon);">
    
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
		
		
		<div id="wrapper">
		<%	
		    String Budget = (String) request.getSession().getAttribute("budget");
			if(Budget == null){
				Budget="1000";
			}
			out.println("<h2 class=\"at-item\" style=\"font-family:'Raleway', cursive; text-align: center;\"> Personal Budget: "+Budget+" </h2>");
			
			Double amount = (Double) request.getSession().getAttribute("amount");
			out.println("<h2 class=\"at-item\" style=\"font-family:'Raleway', cursive; text-align: center;\"> Personal Expenditure: " + amount + "</h2>");
			
			if (amount > Double.parseDouble(Budget)){
				out.println("<h2 class=\"at-item\" style=\"font-family:'Raleway', cursive; text-align: center;\"> You have exceeded your budget! </h2>");
			}
		%>
        </div>  
        
        <div id="change" class="at-item">
        <form action="ChangePersonalBudget" method="GET">
        	<br><br>
         	<h2 class="at-item" style="font-family:'Raleway', cursive; text-align: center;">If you want to change the budget, enter the new budget:</h2>
         	<center><input type="number" id="newbudget" name="newbudget" style="margin-top: 10px; margin-bottom: 10px;" required></center>
         	<center><button type="submit" style="font-family: 'Raleway', cursive; background-color: blue; border: none; border-radius: 5px; color: white; height: 30px; margin-left: auto; margin-right: auto; margin-top: 10px;">Submit</button></center>
        </form>
        </div>
        
	</div>
        
    <!-- adapted from https://csshint.com/css-animated-backgrounds/    --> 
   	<div id="Clouds" style="z-index: -1;">
		<div class="Cloud Foreground"></div>
		<div class="Cloud Background"></div>
		<div class="Cloud Foreground"></div>
		<div class="Cloud Background"></div>
		<div class="Cloud Foreground"></div>
		<div class="Cloud Background"></div>
		<div class="Cloud Background"></div>
		<div class="Cloud Foreground"></div>
		<div class="Cloud Background"></div>
		<div class="Cloud Background"></div>
		<!--  <svg viewBox="0 0 40 24" class="Cloud"><use xlink:href="#Cloud"></use></svg>-->
	</div>
	
	<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	   width="40px" height="24px" viewBox="0 0 40 24" enable- xml:space="preserve">
		<defs>
		  <path id="Cloud" d="M33.85,14.388c-0.176,0-0.343,0.034-0.513,0.054c0.184-0.587,0.279-1.208,0.279-1.853c0-3.463-2.809-6.271-6.272-6.271
		c-0.38,0-0.752,0.039-1.113,0.104C24.874,2.677,21.293,0,17.083,0c-5.379,0-9.739,4.361-9.739,9.738
		c0,0.418,0.035,0.826,0.084,1.229c-0.375-0.069-0.761-0.11-1.155-0.11C2.811,10.856,0,13.665,0,17.126
		c0,3.467,2.811,6.275,6.272,6.275c0.214,0,27.156,0.109,27.577,0.109c2.519,0,4.56-2.043,4.56-4.562
		C38.409,16.43,36.368,14.388,33.85,14.388z"/>
		</defs>
	</svg>
    </body>

    </html>