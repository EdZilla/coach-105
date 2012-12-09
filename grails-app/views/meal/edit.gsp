

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Meal</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Meal List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Meal</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Meal</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${meal}">
            <div class="errors">
                <g:renderErrors bean="${meal}" as="list" />
            </div>
            </g:hasErrors>
            <g:form controller="meal" method="post" >
                <input type="hidden" name="id" value="${meal?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:meal,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:meal,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:meal,field:'description','errors')}">
                                    <input type="text" id="description" name="description" value="${fieldValue(bean:meal,field:'description')}" />
                                </td>
                            </tr> 
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cost">Cost:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:meal,field:'cost','errors')}">
                                    <input type="text" id="cost" name="cost" value="${fieldValue(bean:meal,field:'cost')}"/>
                                </td>
                            </tr>
                        
                        <!--    <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="athlete">Athlete:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:meal,field:'athlete','errors')}">
                                    <g:select optionKey="id" from="${AuthUser.list()}" name="athlete.id" value="${meal?.athlete?.id}" ></g:select>
                                </td>
                            </tr> -->
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="date">Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:meal,field:'date','errors')}">
                                    <g:datePicker name="date" value="${meal?.date}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="food">Food:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:meal,field:'food','errors')}">
                                    
								<ul>
									<g:each var="f" in="${meal?.food?}">
    									<li><g:link controller="foodRef" action="show" id="${f.id}">${f}</g:link></li>
									</g:each>
								</ul>
										<g:link controller="foodRef" params="["meal.id":meal?.id]" action="create">Add FoodRef</g:link>
                                </td>
                            </tr> 
                            
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="animation">Animation:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:meal,field:'animation','errors')}">
									<input type="text" id="animation" name="animation" value="${fieldValue(bean:meal,field:'animation')}" />                                    
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
