

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Meal List</title>
    </head>
    <body>
    
    <resource:autoComplete skin="default" />
    
    <div class="searchbar">
		<div class="total">
			Search your meals
		</div>
			<div class="search">
			<g:form action="search">
					<g:textField name="searchFieldCriteria"  />
				</g:form>
			</div>
	</div>
	
	<div class="searchbar">
		<div class="total">
			Search for a particular meal
		</div>
			<div class="search">
                <richui:autoComplete name="name" action="${createLinkTo('dir': 'meal/searchAJAX')}" onItemSelect="document.location.href = '${createLinkTo(dir: 'meal/show')}/' + id;" />
			</div>
	</div>
	
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Meal</g:link></span>
            <span> | </span>
	         <span class="button"><g:link action = "listXml">Export list as XML</g:link></span>
            <span> | </span>
	         <span class="button"><g:link action = "emailRecent">Email Recent Meals</g:link></span>
        </div>
        <div class="body">
            <h1>Meal List for  <g:loggedInUserInfo field="username"/></h1>
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
                        
                   	        <th>Athlete</th>
                   	    
                   	        <g:sortableColumn property="date" title="Date" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${mealList}" status="i" var="meal">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${meal.id}">${meal.id?.encodeAsHTML()}</g:link></td>
                        
                            <td><g:link action="show" id="${meal.id}">${meal.name?.encodeAsHTML()}</g:link></td>
                        
                            <td><g:render template="meal" var="meal" bean="${meal}" /></td>
                            
                            <td>$${meal.cost?.encodeAsHTML()}</td>
                        
                            <td>${meal.athlete?.encodeAsHTML()}</td>
                        
                            <td>${meal.date?.encodeAsHTML()}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${Meal.count()}" />
            </div>
        </div>
    </body>
</html>
