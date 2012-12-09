

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>NutritionData List</title>
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
            <span class="menuButton"><g:link class="create" action="create">New NutritionData</g:link></span>
        </div>
        <div class="body">
            <h1>NutritionData List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="description" title="Description" />
                        
                   	        <g:sortableColumn property="calories" title="Calories" />
                        
                   	        <g:sortableColumn property="gramsFat" title="Grams Fat" />
                        
                   	        <g:sortableColumn property="gramsProtein" title="Grams Protein" />
                        
                   	        <g:sortableColumn property="servingSize" title="Serving Size" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${nutritionDataList}" status="i" var="nutritionData">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${nutritionData.id}">${fieldValue(bean:nutritionData, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:nutritionData, field:'description')}</td>
                        
                            <td>${fieldValue(bean:nutritionData, field:'calories')}</td>
                        
                            <td>${fieldValue(bean:nutritionData, field:'gramsFat')}</td>
                        
                            <td>${fieldValue(bean:nutritionData, field:'gramsProtein')}</td>
                        
                            <td>${fieldValue(bean:nutritionData, field:'servingSize')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${NutritionData.count()}" />
            </div>
        </div>
    </body>
</html>
