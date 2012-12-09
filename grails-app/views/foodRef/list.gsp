

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>FoodRef List</title>
    </head>
    <body>
    
     <div class="searchbar">
		<div class="total">
			Search for foods
		</div>
			<div class="search">
				<g:form action="search">
					<g:textField name="searchFieldCriteria"  />
				</g:form>
			</div>
	</div>
    
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New FoodRef</g:link></span>
        </div>
        <div class="body">
            <h1>FoodRef List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <th>Meal</th>
                   	    
                   	        <th>Food</th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${foodRefList}" status="i" var="foodRef">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${foodRef.id}">${foodRef.id?.encodeAsHTML()}</g:link></td>
                        
                            <td>${foodRef.meal?.encodeAsHTML()}</td>
                        
                            <td>${foodRef.food?.encodeAsHTML()}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${FoodRef.count()}" />
            </div>
        </div>
    </body>
</html>
