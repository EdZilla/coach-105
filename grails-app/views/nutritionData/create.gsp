

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create NutritionData</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">NutritionData List</g:link></span>
        </div>
        <div class="body">
            <h1>Create NutritionData</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${nutritionData}">
            <div class="errors">
                <g:renderErrors bean="${nutritionData}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:nutritionData,field:'description','errors')}">
                                    <input type="text" id="description" name="description" value="${fieldValue(bean:nutritionData,field:'description')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="calories">Calories:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:nutritionData,field:'calories','errors')}">
                                    <input type="text" id="calories" name="calories" value="${fieldValue(bean:nutritionData,field:'calories')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="gramsFat">Grams Fat:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:nutritionData,field:'gramsFat','errors')}">
                                    <input type="text" id="gramsFat" name="gramsFat" value="${fieldValue(bean:nutritionData,field:'gramsFat')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="gramsProtein">Grams Protein:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:nutritionData,field:'gramsProtein','errors')}">
                                    <input type="text" id="gramsProtein" name="gramsProtein" value="${fieldValue(bean:nutritionData,field:'gramsProtein')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="servingSize">Serving Size:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:nutritionData,field:'servingSize','errors')}">
                                    <input type="text" id="servingSize" name="servingSize" value="${fieldValue(bean:nutritionData,field:'servingSize')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="units">Units:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:nutritionData,field:'units','errors')}">
                                    
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="food">Food:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:nutritionData,field:'food','errors')}">
                                    <g:select optionKey="id" from="${Food.list()}" name="food.id" value="${nutritionData?.food?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
