

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
                   	        <g:sortableColumn property="name" title="XML" />
                        </tr>
                    </thead>
                    <tbody>

                    <g:each in="${foodList}" status="i" var="food">
                    	<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td>${food.toXml()?.encodeAsXML()}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
