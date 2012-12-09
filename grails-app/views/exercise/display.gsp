

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Exercise Item</title>
    </head>
    <body>
    
    <div class="searchbar">
		<div class="total">
			Search for Exercises
		</div>
			<div class="search">
				<g:form action="search">
					<g:textField name="searchFieldCriteria" />
				</g:form>
			</div>
	</div>
	
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Exercise</g:link></span>
        </div>
        <div class="body">
            <h1>Exercise XML</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            	
            	<h3>${flash.exercise.display()?.encodeAsXML()}</h3>
            
        </div>
    </body>
</html>
