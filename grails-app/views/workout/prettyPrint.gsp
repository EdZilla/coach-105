

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Workout Item</title>
    </head>
    <body>
    
    
	
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Workout List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Workout</g:link></span>
        </div>
        <div class="body">
            <h1>Workout</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            	
            	<h3>${flash.workout.prettyPrint()}</h3>
            
        </div>
    </body>
</html>
