

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Course</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Course List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Course</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Course</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${course}">
            <div class="errors">
                <g:renderErrors bean="${course}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${course?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:course,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:course,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:course,field:'description','errors')}">
                                     <input type="text" id="description" name="description" value="${fieldValue(bean:course,field:'description')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="location">Location:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:course,field:'location','errors')}">
                                    <input type="text" id="location" name="location" value="${fieldValue(bean:course,field:'location')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="distance">Distance:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:course,field:'distance','errors')}">
                                    <input type="text" id="distance" name="distance" value="${fieldValue(bean:course,field:'distance')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="baseElevation">Base Elevation:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:course,field:'baseElevation','errors')}">
                                    <input type="text" id="baseElevation" name="baseElevation" value="${fieldValue(bean:course,field:'baseElevation')}" />
                                </td>
                            </tr> 
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="maxElevation">Max Elevation:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:course,field:'maxElevation','errors')}">
                                    <input type="text" id="maxElevation" name="maxElevation" value="${fieldValue(bean:course,field:'maxElevation')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="map">Map:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:course,field:'map','errors')}">
                                    <input type="text" id="map" name="map" value="${fieldValue(bean:course,field:'map')}" />
                                </td>
                            </tr> 
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="profile">Profile:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:course,field:'profile','errors')}">
                                    <input type="text" id="profile" name="profile" value="${fieldValue(bean:course,field:'profile')}" />
                                </td>
                            </tr> 
                            
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
