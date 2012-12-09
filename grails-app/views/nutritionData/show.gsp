

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show NutritionData</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">NutritionData List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New NutritionData</g:link></span>
        </div>
        <div class="body">
            <h1>Show NutritionData</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:nutritionData, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Description:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:nutritionData, field:'description')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Calories:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:nutritionData, field:'calories')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Grams Fat:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:nutritionData, field:'gramsFat')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Grams Protein:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:nutritionData, field:'gramsProtein')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Serving Size:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:nutritionData, field:'servingSize')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Units:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:nutritionData, field:'units')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Food:</td>
                            
                            <td valign="top" class="value"><g:link controller="food" action="show" id="${nutritionData?.food?.id}">${nutritionData?.food?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${nutritionData?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
