

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit EquipmentRef</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">EquipmentRef List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New EquipmentRef</g:link></span>
        </div>
        <div class="body">
            <h1>Edit EquipmentRef</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${equipmentRef}">
            <div class="errors">
                <g:renderErrors bean="${equipmentRef}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${equipmentRef?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="equipment">Equipment:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:equipmentRef,field:'equipment','errors')}">
                                    <g:select optionKey="id" from="${Equipment.list()}" name="equipment.id" value="${equipmentRef?.equipment?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="exercise">Exercise:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:equipmentRef,field:'exercise','errors')}">
                                    <g:select optionKey="id" from="${Exercise.list()}" name="exercise.id" value="${equipmentRef?.exercise?.id}" ></g:select>
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
