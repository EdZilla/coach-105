

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>ClassPeriod List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New ClassPeriod</g:link></span>
        </div>
        <div class="body">
            <h1>ClassPeriod List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="name" title="Name" />
                        
                   	        <g:sortableColumn property="startDate" title="Start Date" />
                        
                   	        <g:sortableColumn property="endDate" title="End Date" />
                        
                   	        <g:sortableColumn property="startTime" title="Start Time" />
                        
                   	        <g:sortableColumn property="location" title="Location" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${classPeriodList}" status="i" var="classPeriod">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${classPeriod.id}">${classPeriod.id?.encodeAsHTML()}</g:link></td>
                        
                            <td>${classPeriod.name?.encodeAsHTML()}</td>
                        
                            <td>${classPeriod.startDate?.encodeAsHTML()}</td>
                        
                            <td>${classPeriod.endDate?.encodeAsHTML()}</td>
                        
                            <td>${classPeriod.startTime?.encodeAsHTML()}</td>
                        
                            <td>${classPeriod.location?.encodeAsHTML()}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${ClassPeriod.count()}" />
            </div>
        </div>
    </body>
</html>
