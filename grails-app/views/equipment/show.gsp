

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Equipment</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Equipment List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Equipment</g:link></span>
            	<span> | </span>
            <span class="button"><g:link controller = "equipmentRef" action = "create">Associate this item with an exercise</g:link></span>            
        </div>
        <div class="body">
            <h1>Show Equipment</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${equipment.id}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Name:</td>
                            
                            <td valign="top" class="value">${equipment.name}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Description:</td>
                            
                            <td valign="top" class="value">${equipment.description}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Cost:</td>
                            
                            <td valign="top" class="value">${equipment.cost}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Photo:</td>
                            <g:if test="${equipment.photo}">
                            	<td valign="top" class="value"><g:image src="${equipment.photo}" alt="summitbid_logo.gif" title=${equipment.name} /></td>
                            </g:if>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Date Purchased:</td>
                            
                            <td valign="top" class="value">${equipment.datePurchased}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${equipment?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
