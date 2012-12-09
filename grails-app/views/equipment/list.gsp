

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Equipment List</title>
    </head>
    <body>
    
    <div class="searchbar">
		<div class="total">
			Search for Equipment
		</div>
			<div class="search">
				<g:form action="search">
					<g:textField name="searchFieldCriteria" />
				</g:form>
			</div>
	</div>
	
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Equipment</g:link></span>
        </div>
        <div class="body">
            <h1>Equipment List</h1>
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
                        
                   	        <g:sortableColumn property="photo" title="Photo" />
                        
                   	        <g:sortableColumn property="datePurchased" title="Date Purchased" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${equipmentList}" status="i" var="equipment">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${equipment.id}">${equipment.id?.encodeAsHTML()}</g:link></td>
                        
                            <td><g:link action="show" id="${equipment.id}">${equipment.name?.encodeAsHTML()}</g:link></td>
                        
                            <td>${equipment.description?.encodeAsHTML()}</td>
                        
                            <td>${equipment.cost?.encodeAsHTML()}</td>
                        
                            <td>${equipment.photo?.encodeAsHTML()}</td>
                        
                            <td>${equipment.datePurchased?.encodeAsHTML()}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${Equipment.count()}" />
            </div>
        </div>
    </body>
</html>
