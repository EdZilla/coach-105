

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show DevelIssue</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">DevelIssue List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New DevelIssue</g:link></span>
        </div>
        <div class="body">
            <h1>Show DevelIssue</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${develIssue.id}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Name:</td>
                            
                            <td valign="top" class="value">${develIssue.name}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Description:</td>
                            
                            <td valign="top" class="value"><g:render template="develissue" var="develissue" bean="${develIssue}" /></td>
                            							                            
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Severity:</td>
                            
                            <td valign="top" class="value">${develIssue.severity}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Status:</td>
                            
                            <td valign="top" class="value">${develIssue.status}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Domain:</td>
                            
                            <td valign="top" class="value">${develIssue.domain}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Issues:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="i" in="${develIssue.issues}">
                                    <li><g:link controller="develIssue" action="show" id="${i.id}">${i}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${develIssue?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
