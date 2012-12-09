

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Exercise Search Results</title>
    </head>
    <body>
    
    <div class="searchbar">
		<div class="total">
			Search for Exercises
		</div>
			<div class="search">
				<g:form action="search">
					<g:textField name="searchFieldCriteria"  />
				</g:form>
			</div>
	</div>
    
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Exercise Ref</g:link></span>
        </div>
        <div class="body">
            <h1>Exercise List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="name" title="Name" />
                        
                   	        <g:sortableColumn property="description" title="Description" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${exerciseList}" status="i" var="exercise">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
	                        <td><g:link controller="exercise" action="show" id="${exercise.id}">${exercise.id?.encodeAsHTML()}</g:link></td>
                        
                            <td><g:link controller="exercise" action="show" id="${exercise.id}">${exercise.name?.encodeAsHTML()}</g:link></td>
                        
                            <td>${exercise.description?.encodeAsHTML()}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${Exercise.count()}" />
            </div>
        </div>
    </body>
</html>
