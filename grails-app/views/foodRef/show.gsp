

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show FoodRef</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">FoodRef List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New FoodRef</g:link></span>
        </div>
        <div class="body">
            <h1>Show FoodRef</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${foodRef.id}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Meal:</td>
                            
                            <td valign="top" class="value"><g:link controller="meal" action="show" id="${foodRef?.meal?.id}">${foodRef?.meal}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Food:</td>
                            
                            <td valign="top" class="value"><g:link controller="food" action="show" id="${foodRef?.food?.id}">${foodRef?.food}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form controller="foodRef">
                    <input type="hidden" name="id" value="${foodRef?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
