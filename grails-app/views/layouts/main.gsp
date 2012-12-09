<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${createLinkTo(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${createLinkTo(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="scriptaculous"/>    
        <g:javascript library="application" />
        <style type="text/css">
			.searchbar { 
				margin-top:10px;
				background-color: lightgrey;
				border:1px solid darkgrey;
				width:25%;
				height:30px;
				padding:5px;
			}
			.total { 
				padding-top:5px;
				float:left;
				color:white;
			}
			.search {
				float:right;
				color:black;
			}
			.userDetails {
<!--				position:absolute;-->
<!--				right:30px;-->
<!--				top: 30px;-->
<!--				border:1px solid darkgrey;-->
<!--				background-color:lightgrey;-->
<!--				padding:10px;-->
<!--				width:450px;-->
			}
			.lastActivityDetails {
				position:absolute;
				right:30px;
<!--				top: 130px;-->
<!--				border:1px solid darkgrey;-->
<!--				background-color:lightgrey;-->
<!--				padding:10px;-->
<!--				width:450px;-->
			}
			.pageContent {
				width:80%;
			}
			.logo h1 {
				position: absolute;
				left:10px;
				top: 30px;
				padding:10px;
			}
			.spinner {
				position: absolute;
				right:0px;
				padding:5px;
			}
		</style>		
		<div class = "buttons">           
		    		Application Name: <g:meta name="app.name"/>,      	
					Application Version: <g:meta name="app.version"/> | 

                	
                	<g:isLoggedIn>
                		Hello <g:loggedInUserInfo field="username"/>
                		<g:link controller="logout"> Not <g:loggedInUserInfo field="username"/>?</g:link>
            		</g:isLoggedIn>
            		<g:isNotLoggedIn>
                		Welcome!  <g:link controller="login">Log In</g:link> or <g:link controller="register">Register</g:link>
            		</g:isNotLoggedIn>
                	
                	<g:link controller = "login">login</g:link> |
                	<g:link controller = "logout">logout</g:link> | 
					<g:link controller = "register">register</g:link> |
<!--                	<g:link controller = "develIssue" action="create">bug report</g:link> |-->
					<a href ="http://71.229.145.83/trac/SummitBid-Coach/newticket">report bug</a> |
               		<a href="mailto:maximus@groovulo.us?subject=Comments from Coach App Admin Mail Link">contact us</a>
<!--               		<div class="lastActivityDetails"> Today is ${new Date()} </div> -->
						<%
							def d = new Date()
	                        d.hours = d.hours - 7
						%>
                 		<div class="lastActivityDetails"> Today is ${d} </div>
               	<br>
               		<h3><g:link controller = "register"><h2>Welcome <g:loggedInUserInfo field="username"/> </g:link> </h3>
        </div>
    </head>
    <body>
    							
		<g:isLoggedIn>
		 <div class="userDetails">
		    	
				
		 </div>
		</g:isLoggedIn>
		
		
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${createLinkTo(dir:'images',file:'spinner.gif')}" alt="Spinner" />
        </div>	

        <div class="logo">
        	<img src="${createLinkTo(dir:'images',file:'summitbid_logo.gif')}" alt="Grails" />
        </div>	

        <div class="buttons" style="margin-left:20px;width:95%;">
        	<g:link controller="meal" action="list" >Meals</g:link>
        	<span> | </span>
        	<g:link controller="workout" action="list" >Workouts</g:link>
        	<span> | </span>
        	<g:link controller="course" action="list" >Courses</g:link>
        	<span> | </span>
        	<g:link controller="equipment" action="list" >Equipment</g:link>
        </div>	

        <g:layoutBody />		
    </body>	
</html>