

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>DevelIssue List</title>
    </head>
    <body>
    
    <div class="searchbar">
		<div class="total">
			Search for Issues
		</div>
			<div class="search">
				<g:form action="search">
					<g:textField name="searchFieldCriteria" />
				</g:form>
			</div>
	</div>
    
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New DevelIssue</g:link></span>
            <span> | </span>
            <span class="button"><g:link action = "listXml">Export list as XML</g:link></span>
        </div>
        <div class="body">
            <h1>DevelIssue List</h1>
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
                        
                   	        <g:sortableColumn property="severity" title="Severity" />
                        
                   	        <g:sortableColumn property="status" title="Status" />
                        
                   	        <g:sortableColumn property="domain" title="Domain" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${develIssueList}" status="i" var="develIssue">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${develIssue.id}">${develIssue.id?.encodeAsHTML()}</g:link></td>
                        
                            <td>${develIssue.name?.encodeAsHTML()}</td>
                        
                            <td><g:render template="develissue" var="develissue" bean="${develIssue}" /></td>
                        
                            <td>${develIssue.severity?.encodeAsHTML()}</td>
                        
                            <td>${develIssue.status?.encodeAsHTML()}</td>
                        
                            <td>${develIssue.domain?.encodeAsHTML()}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${DevelIssue.count()}" />
            </div>
        </div>
    </body>
</html>
