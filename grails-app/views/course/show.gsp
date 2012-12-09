

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Course</title>
    </head>
    <body>
    
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Course List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Course</g:link></span>
        </div>
        <div class="body">
            <h1>Show Course</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${course.id}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Name:</td>
                            
                            <td valign="top" class="value">${course.name}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Description:</td>
                            
                            <td valign="top" class="value"><g:render template="course" var="course" bean="${course}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Location:</td>
                            
                            <td valign="top" class="value">${course.location}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Distance:</td>
                            
                            <td valign="top" class="value">${course.distance}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Base Elevation:</td>
                            <td valign="top" class="value">${course.baseElevation}</td>
                        </tr>
                        
                         <tr class="prop">
                            <td valign="top" class="name">Max Elevation:</td>
                            <td valign="top" class="value">${course.maxElevation}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Map:</td>
                            <g:if test="${course.map}">
                            	<td valign="top" class="value"><g:image src="${course.map}" alt="summitbid_logo.gif" title="route map" /></td>
                            </g:if>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name">Profile:</td>
                            <g:if test="${course.profile}">
                            	<td valign="top" class="value"><g:image src="${course.profile}" alt="summitbid_logo.gif" title="route profile" /></td>
                            </g:if>
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${course?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
