<html>
    <head>
        <title>Welcome to SummitBid</title>
		<meta name="layout" content="main" />
    </head>
    <body>
    	<div class="dialog" style="margin-left:20px;width:60%;">
			Built with Grails <g:meta name="app.grails.version"/>
        </div>
        <h1 style="margin-left:20px;">Welcome to The SummitBid Technologies Coach Application</h1>
        
       <p style="margin-left:20px;width:80%">
        <b>This application is currently a prototype</b> and aims to implement functionality, not necessarily UI workflow.<br>
        The application may occasionaly exhibit unexpected behavior or may fail with errors. If you experience any 
        unexpected behavior <br><a href="mailto:ejy@summitbid.com?subject=Comments from MailTo Syntax Page"> 
        please email the development team with as much information as possible. </a>
        <br><br>
        <b>The features of this app include or are planned:</b>
        <!--  <a href="mailto:ejy@summitbid.com?subject=User Comments from Coach Application"> -->
        </p>
        <ul style="margin-left:20px;width:80%">
        <li>secure login</li>
        <li>workout logging
             <ul>
                <li>workout duration, planning, reporting, video display for technique coaching</li>
               	<li>exercise creation, list, video example display,xml import,xml export, comparison, reporting. </li>
             </ul>
        </li>
        <li>workout planning</li>
        <li>diet tracking
        		<ul>
        			<li>meal creation
        				<ul>
        					<li>food creation and customization with nutrition info</li>
        					<li>nutrition reporting</li>
        				</ul>
        			</li>
        		</ul>
        </li>
        <li>diet planning and logging </li>
        <li>course (Geospacial data) administration utilities</li>
        <li>Exercise equipment tracking, photo</li>
        <li>application administration utilities (backup,restore, etc)</li>  		
        </ul>
        
        <p style="margin-left:20px;width:80%">
        <h1 style="margin-left:20px;width:80%"><b>Below is a list of domain object controllers that are currently deployed in this application,
        click on each to execute its default action:<b></h1>
        
        <div class="dialog" style="margin-left:20px;width:60%;">
        <ul>
        <h2>Workout Logging</h2>
        <li><g:link controller="workout" action="list" >Workouts</g:link></li>
        <li><g:link controller="exercise" action="list" >Exercises</g:link></li>
		<li><g:link controller="equipment" action="list" >Equipment</g:link></li>
        <li><g:link controller="course" action="list" >Exercise Routes and Courses</g:link></li>
        <li><g:link controller="bioMetrics" action="list" >Biometrics (body measurements)</g:link></li>
        <li><g:link controller="workoutTelemetryData" action="list" >Workout GPS/Heart Rate Data</g:link></li>
        
		<h2>Diet Logging</h2>
		<li><g:link controller="meal" action="list" >Meals</g:link></li>
		<li><g:link controller="food" action="list" >Foods</g:link></li>
		<li><g:link controller="nutritionData" action="list" >Nutrition Data</g:link></li>
		
        <h2>User Administration</h2>
        <li><g:link controller="user" action="list" >Users</g:link></li>
        <li><g:link controller="role" action="list" >User Role Configuration</g:link></li>
        <li><g:link controller="requestmap" action="list" >Request Map (URL restriction)</g:link></li>
        <li><g:link controller="classPeriod" action="list" >Class Period</g:link></li><br>
        </ul>
		</div>
        
<!--        <div class="dialog" style="margin-left:20px;width:60%;">-->
<!--            <ul>-->
<!--              <g:each var="c" in="${grailsApplication.controllerClasses}">-->
<!--                    <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>-->
<!--              </g:each>-->
<!--            </ul>-->
<!--        </div>-->
        
        <br>

        <div>Roadmap/Milestones
        <ul>
        	<li>0.2</li>
        	<ul><b>fixes</b>
	        	<li>log4j fixed</li>
        		<li>delete fixed</li>
        		<li>BioMetrics null values non-rejection</li>
        	</ul>
        	<ul><b>Features</b>
        		<li>DevelIssue status enums</li>
	        	<li>contact us email link</li>
        		<li>user superclass, coach subclass, athlete subclass, etc</li>
        	</ul>

        	<br>

        	<li>0.3</li>	
        	<ul>Features
        		<li>login controller</li>
        		<li>unit tests</li>	
        		<li>user roles (coach,administrator,athlete,etc)</li>
        		<li>course (Geospacial date) logging, display</li>
        	</ul>
        	
        	<li>0.4</li>
        		<ul>Segregation of admin views from user views
	        	    <li>Acegi (now springsecurity) security Plugin upgrade</li>	
        			<li>RichUI Plugin integration</li>
        	</ul>
        	
        	<li>0.5</li>
        		<ul>File handling	
        			<li>File upload</li>
        			<li>File removal</li>
        	</ul>
        	
        	<li>0.6</li>	
	        	<ul>General User Experience improvement
        	</ul>
        	
        	<li>0.7</li>	
        	  	<ul>1.0 Feature set stabilization
			</ul>
			
			
			<li>2.x</li>	
        		<ul>Geospacial data import/administration
        	</ul>
			        	        	
        </ul>	
        </div>
    </body>
</html>