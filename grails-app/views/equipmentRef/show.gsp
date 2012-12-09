

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show EquipmentRef</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">EquipmentRef List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New EquipmentRef</g:link></span>
        </div>
        <div class="body">
            <h1>Show EquipmentRef</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${equipmentRef.id}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Equipment:</td>
                            
                            <td valign="top" class="value"><g:link controller="equipment" action="show" id="${equipmentRef?.equipment?.id}">${equipmentRef?.equipment}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Exercise:</td>
                            
                            <td valign="top" class="value"><g:link controller="exercise" action="show" id="${equipmentRef?.exercise?.id}">${equipmentRef?.exercise}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${equipmentRef?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
