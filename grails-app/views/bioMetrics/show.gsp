

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show BioMetrics</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">BioMetrics List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New BioMetrics</g:link></span>
             <span> | </span>
             <g:link action="email" id="${bioMetrics?.id}">Email this Reading</g:link>
        </div>
        <div class="body">
            <h1>Show BioMetrics</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${bioMetrics.id}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Height:</td>
                            
                            <td valign="top" class="value">${bioMetrics.height}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Weight:</td>
                            
                            <td valign="top" class="value">${bioMetrics.weight}</td>
                            
                        </tr>

                         <tr class="prop">
                            <td valign="top" class="name">Body Fat Percentage:</td>

                            <td valign="top" class="value">${bioMetrics.bodyFatPercentage}</td>

                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Waist:</td>
                            
                            <td valign="top" class="value">${bioMetrics.waist}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Chest:</td>
                            
                            <td valign="top" class="value">${bioMetrics.chest}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Bicep:</td>
                            
                            <td valign="top" class="value">${bioMetrics.bicep}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Thigh:</td>
                            
                            <td valign="top" class="value">${bioMetrics.thigh}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Athlete:</td>
                            
                            <td valign="top" class="value"><g:link controller="authUser" action="show" id="${bioMetrics?.athlete?.id}">${bioMetrics?.athlete}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Date:</td>
                            
                            <td valign="top" class="value">${bioMetrics.date}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${bioMetrics?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
