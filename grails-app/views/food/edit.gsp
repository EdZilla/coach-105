

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Food</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Food List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Food</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Food</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${food}">
            <div class="errors">
                <g:renderErrors bean="${food}" as="list" />
            </div>
            </g:hasErrors>
            <g:form controller="food" method="post" >
                <input type="hidden" name="id" value="${food?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:food,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:food,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:food,field:'description','errors')}">
									<input type="text" id="description" name="description" value="${fieldValue(bean:food,field:'description')}"/>
                                </td>
                            </tr> 
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cost">Cost:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:food,field:'cost','errors')}">
                                    <input type="text" id="cost" name="cost" value="${fieldValue(bean:food,field:'cost')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nutritionData">Nutrition Data:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:food,field:'nutritionData','errors')}">
                                    <g:select optionKey="id" from="${NutritionData.list()}" name="nutritionData.id" value="${food?.nutritionData?.id}" ></g:select>
                                </td>
                            </tr> 
                            
 							<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="animation">Animation:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:food,field:'animation','errors')}">
									<input type="text" id="animation" name="animation" value="${fieldValue(bean:food,field:'animation')}" />                                    
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
