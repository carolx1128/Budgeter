<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <meta name="google-signin-client_id" content="375657636281-ovf5orisbld46qoeu3npg53gbm68a11a.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js"></script>
    <link href="https://fonts.googleapis.com" rel="preconnect">
    <script src="https://apis.google.com/js/api:client.js"></script>
    <link crossorigin href="https://fonts.gstatic.com" rel="preconnect">
    <link
            href="https://fonts.googleapis.com/css2?family=Lobster&family=Roboto:wght@300&display=swap"
            rel="stylesheet">
    <script crossorigin="anonymous"
            src="https://kit.fontawesome.com/3204349982.js"></script>
    <script async defer src="https://apis.google.com/js/platform.js"></script>
    <link rel="stylesheet" href="index.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto"
          rel="stylesheet" type="text/css">
	
	<script>
		window.onload = function() {
		    if(!window.location.hash) {
		        window.location = window.location + '#loaded';
		        window.location.reload();
		    }
		}
	</script>
	
	<script>
  	var googleUser = {};
  	var startApp = function() {
    	gapi.load('auth2', function(){
    		// Retrieve the singleton for the GoogleAuth library and set up the client.
    	 	auth2 = gapi.auth2.init({
    	    	client_id: '375657636281-ovf5orisbld46qoeu3npg53gbm68a11a.apps.googleusercontent.com',
    	    	cookiepolicy: 'single_host_origin',
    	    	// Request scopes in addition to 'profile' and 'email'
    	    	//scope: 'additional_scope'
    	  	});
    	  	attachSignin(document.getElementById('customBtn'));
    	});
  	};

  	function attachSignin(element) {
   		console.log(element.id);
    	console.log(googleUser);
    	auth2.attachClickHandler(element, {},
    	    function(googleUser) {
    	      console.log(googleUser.getBasicProfile().getName());
    	      window.location.href = "GoogleLogin?name=" + googleUser.getBasicProfile().getName() + "&email=" + googleUser.getBasicProfile().getEmail();
    	    }, function(error) {
    	      alert(JSON.stringify(error, undefined, 2));
    	    });
  	}
  	</script>
	
	<style>
		/* Movement effect reference from https://codepen.io/davinci/pen/YxwwWd */
		.login {
		  overflow: hidden;
		  background-color: white;
		  padding: 40px 30px 30px 30px;
		  border-radius: 10px;
		  position: absolute;
		  top: 50%;
		  left: 50%;
		  width: 400px;
		  -webkit-transform: translate(-50%, -50%);
		  -moz-transform: translate(-50%, -50%);
		  -ms-transform: translate(-50%, -50%);
		  -o-transform: translate(-50%, -50%);
		  transform: translate(-50%, -50%);
		  -webkit-transition: -webkit-transform 300ms, box-shadow 300ms;
		  -moz-transition: -moz-transform 300ms, box-shadow 300ms;
		  transition: transform 300ms, box-shadow 300ms;
		  box-shadow: 5px 10px 10px rgba(2, 128, 144, 0.2);
		}
		.login::before, .login::after {
		  content: "";
		  position: absolute;
		  width: 600px;
		  height: 1000px;
		  border-top-left-radius: 40%;
		  border-top-right-radius: 45%;
		  border-bottom-left-radius: 35%;
		  border-bottom-right-radius: 40%;
		  z-index: -1;
		}
		.login::before {
		  left: 40%;
		  bottom: -130%;
		  background-color: rgba(69, 105, 144, 0.15);
		  -webkit-animation: wawes 6s infinite linear;
		  -moz-animation: wawes 6s infinite linear;
		  animation: wawes 6s infinite linear;
		}
		.login::after {
		  left: 35%;
		  bottom: -125%;
		  background-color: rgba(2, 128, 144, 0.2);
		  -webkit-animation: wawes 7s infinite;
		  -moz-animation: wawes 7s infinite;
		  animation: wawes 7s infinite;
		}
		.login  input {
		  font-family: "Asap", sans-serif;
		  display: block;
		  border-radius: 5px;
		  font-size: 16px;
		  background: white;
		  width: 100%;
		  border: 0;
		  padding: 10px 10px;
		  margin: 15px -10px;
		}
		.login  button {
		  font-family: "Asap", sans-serif;
		  cursor: pointer;
		  color: #fff;
		  font-size: 16px;
		  text-transform: uppercase;
		  width: 80px;
		  border: 0;
		  padding: 10px 0;
		  margin-top: 10px;
		  margin-left: -5px;
		  border-radius: 5px;
		  background-color: #f45b69;
		  -webkit-transition: background-color 300ms;
		  -moz-transition: background-color 300ms;
		  transition: background-color 300ms;
		}
		.login  button:hover {
		  background-color: #f24353;
		}
		
		@-webkit-keyframes wawes {
		  from {
		    -webkit-transform: rotate(0);
		  }
		  to {
		    -webkit-transform: rotate(360deg);
		  }
		}
		@-moz-keyframes wawes {
		  from {
		    -moz-transform: rotate(0);
		  }
		  to {
		    -moz-transform: rotate(360deg);
		  }
		}
		@keyframes wawes {
		  from {
		    -webkit-transform: rotate(0);
		    -moz-transform: rotate(0);
		    -ms-transform: rotate(0);
		    -o-transform: rotate(0);
		    transform: rotate(0);
		  }
		  to {
		    -webkit-transform: rotate(360deg);
		    -moz-transform: rotate(360deg);
		    -ms-transform: rotate(360deg);
		    -o-transform: rotate(360deg);
		    transform: rotate(360deg);
		  }
		}
			
		h1 {
			font-family: 'Raleway', sans-serif;
			font-size: 5em;
			width:100%; 
			text-align: center;
			color: black;
		}
		body {
			background-color: rgb(255, 224, 230);
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
<body style="background: rgb(2,0,36); background: linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(9,9,121,1) 35%, rgba(0,212,255,1) 100%);">

	<%
		String error = (String) request.getAttribute("error");
			if (error != null) out.println(error);
	%>

	<div>
    	<div class="top">
    		<a href="index.jsp" class="Budgeter">Budgeter</a>
    		
    		<% 
    			Cookie[] ck = request.getCookies();
        		if(ck != null){
        			for (Cookie cookie : ck){
        				if (cookie.getName().equals("name")){
        					out.print("<div class=\"greeting\" style=\"display: inline-block;\"\"><p>Hi! " + cookie.getValue().replace("=", " ") + "</p></div>");
        				}
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
    </div>
        
	<hr>

	<div id="auth">
		<div class="login">
			<form action="LoginDispatcher" method="POST">
				<h1>Log in</h1>
				<input type="email" id="email" name="login_email" placeholder="Email">
				<input type="password" id="password" name="login_pwd" placeholder="Password">
				<button style="width:104%;">Login</button>			
			</form>
			
			<button id="customBtn" formaction="GoogleLogin" style="background-color: rgb(65,156,254); border: none; border-radius: 5px; color: white; width: 104%; height: 40px;"><i class="fa fa-google" aria-hidden="true"></i>     Sign in with Google</button>
			<script type="text/javascript">startApp();</script>	
		</div>
	</div>
	
	
</body>


</html>