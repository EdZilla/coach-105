

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Course List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Course</g:link></span>
        </div>
        <div class="body">
            <h1>Course List</h1>
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
                        
                   	        <g:sortableColumn property="location" title="Location" />
                        
                   	        <g:sortableColumn property="distance" title="Distance" />
                        
                   	        <g:sortableColumn property="baseElevation" title="Base Elevation" />
                   	        
                   	        <g:sortableColumn property="Map" title="Map" />
                   	        
                   	        <g:sortableColumn property="Profile" title="Profile" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${courseList}" status="i" var="course">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${course.id}">${course.id?.encodeAsHTML()}</g:link></td>
                        
                            <td><g:link action="show" id="${course.id}">${course.name?.encodeAsHTML()}</g:link></td>
                        
                            <td><g:render template="course" var="course" bean="${course}" /></td>
                        
                            <td>${course.location?.encodeAsHTML()}</td>
                        
                            <td>${course.distance?.encodeAsHTML()}</td>
                        
                            <td>${course.baseElevation?.encodeAsHTML()}</td>
                            
                            <g:if test="${course.map}">
                            	<td>yes</td>
                            </g:if>
                            <g:else>
								<td>no</td>                            		
                            </g:else>
                            
                            <g:if test="${course.profile}">
                            	<td>yes</td>
                            </g:if>
                            <g:else>
								<td>no</td>                            		
                            </g:else>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${Course.count()}" />
            </div>
        </div>
    </body>
</html>
