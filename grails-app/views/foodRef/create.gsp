

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create FoodRef</title>         
    </head>
    <body>
    
    <resource:autoComplete skin="default" />
    
    <div class="searchbar">
		<div class="total">
			Search for foods
		</div>
			<div class="search">
				<g:form action="search">
					<g:textField name="searchFieldCriteria"  />
				</g:form>
			</div>
	</div>
	
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">FoodRef List</g:link></span>
            <span> | </span>
            <span class="button"><g:link controller = "food" action = "create">Create new food item</g:link></span>
        </div>
        <div class="body">
            <h1>Create FoodRef</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${foodRef}">
            <div class="errors">
                <g:renderErrors bean="${foodRef}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="meal">Meal:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:foodRef,field:'meal','errors')}">
                                    <g:select optionKey="id" from="${Meal.list()}" name="meal.id" value="${foodRef?.meal?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="food">Food:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:foodRef,field:'food','errors')}">
                                    <g:select optionKey="id" from="${Food.list()}" name="food.id" value="${foodRef?.food?.id}" ></g:select>
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
