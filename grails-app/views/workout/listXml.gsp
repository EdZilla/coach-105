

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Workout List Exported as XML</title>
    </head>
    <body>

		<g:if test="${session.user}">
			<div class="userDetails">
			<h3>Profile Stuff</h3>
			
			</div>
		</g:if>
		
		<div class="searchbar">
		<div class="total">
			Search your Workouts
		</div>
			<div class="search">
				<g:form action="search">
					<g:textField name="searchFieldCriteria" />
				</g:form>
			</div>
	</div>
				
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Workout List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Workout</g:link></span>
        </div>
        <div class="body">
            <h1>Workout XML</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                   	        <g:sortableColumn property="name" title="XML" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${workoutList}" status="i" var="workout">
                    	<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td>${workout.toXml()?.encodeAsHTML()}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
