

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Food List</title>
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
            <span class="menuButton"><g:link class="create" action="create">New Food</g:link></span>
             <span> | </span>
            <span class="button"><g:link action = "listXml">Export list as XML</g:link></span>
        </div>
        <div class="body">
            <h1>Food List</h1>
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
                   	        	                   	        
							<g:sortableColumn property="cost" title="Cost" />
                        
                   	        <th>Nutrition Data</th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${foodList}" status="i" var="food">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${food.id}">${food.id?.encodeAsHTML()}</g:link></td>
                        
                            <td><g:link action="show" id="${food.id}">${food.name?.encodeAsHTML()}</g:link></td>
                        
                            <td><g:render template="food" var="food" bean="${food}" /></td>
                            
                            <td>$${food.cost?.encodeAsHTML()}</td>
                        
                            <td><g:link controller="nutritionData" action="show" id="${food.nutritionData?.id}">${food.nutritionData?.encodeAsHTML()}</g:link></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${Food.count()}" />
            </div>
        </div>
    </body>
</html>
