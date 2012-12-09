

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Food</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Food List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Food</g:link></span>
            <span> | </span>
			<span class="button"><g:link controller = "foodRef" action = "create">Associate this food item with a meal</g:link></span>

  			<span> | </span>
			<span class="button"><g:link controller = "nutritionData" action = "create">Create a new food data item.</g:link></span>
			<span> | </span>
            	<span class="button"><g:remoteLink action="toXml" id="${food?.id}" update="xmlDiv">Show Food Xml</g:remoteLink>
        </div>
        <div class="body">
            <h1>Show Food</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${food.id}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Name:</td>
                            
                            <td valign="top" class="value">${food.name}</td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name">Cost:</td>
                            
                            <td valign="top" class="value">$${food.cost}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Description:</td>
                            
                            <td valign="top" class="value"><g:render template="food" var="food" bean="${food}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Nutrition Data:</td>
                            
                            <td valign="top" class="value"><g:link controller="nutritionData" action="show" id="${food?.nutritionData?.id}">${food?.nutritionData}</g:link></td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name">Animation:</td>
                            <g:if test="${food.animation}">
                            	<td valign="top" class="value"><g:video url="${food.animation}" height="225" width="225" /></td>
                            </g:if>
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${food?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                    
                    <span> | </span>
        				<g:link controller="meal" params="["food.id":food?.id]" action="addFoodTo" >Add this food item to current meal</g:link>

                </g:form>
            </div>
        </div>
        <h4><div id="xmlDiv" style="margin-left:20px;width:80%;">Food XML</div></h4>
    </body>
</html>
