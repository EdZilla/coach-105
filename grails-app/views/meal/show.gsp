

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Meal</title>
    </head>
    <body>
    
    	<resource:autoComplete skin="default" />
    
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Meal List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Meal</g:link></span>
            <span> | </span>
            <span class="button"><g:link controller = "foodRef" action = "create">Associate a food item with this meal</g:link></span>
			 <span> | </span>
            <span class="button"><g:remoteLink action="toXml" id="${meal?.id}" update="xmlDiv">Show Meal Xml</g:remoteLink>
			 <span> | </span>
            <g:link action="email" id="${meal?.id}">Email this Meal</g:link>                           
        </div>
        <div class="body">
            <h1>Show Meal</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            <td valign="top" class="value">${meal.id}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Name:</td>
                            
                            <td valign="top" class="value">${meal.name}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Description:</td>
                            
                            <td valign="top" class="value"><g:render template="meal" var="meal" bean="${meal}" /></td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name">Cost:</td>
                            
                            <td valign="top" class="value">$${meal.cost}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Athlete:</td>
                            
                            <td valign="top" class="value"><g:link controller="authUser" action="show" id="${meal?.athlete?.id}">${meal?.athlete}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Date:</td>
                            
                            <td valign="top" class="value">${meal.date}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Food:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">

								  <h4>Find a food to add:</h4>
								  <richui:autoComplete name="name" action="${createLinkTo('dir': 'food/searchAJAX')}" onItemSelect="document.location.href = '${createLinkTo(dir: 'food/show')}/' + id;" />

								  <br><g:link controller="food" params="["meal.id":meal?.id]" action="create">Or create a new food item</g:link><br>
                                
					          <g:if test="${meal.food}">                    	    				
								<br><h4>Foods in this Meal:</h4>
                              </g:if>	

                                <ul>
                                  <g:each var="f" in="${meal.food}">
                                    <li><g:link controller="foodRef" action="show" id="${f.id}">${f.food.name}: ${f.food.description}</g:link></li>
                                  </g:each>
                                </ul>								  
                            </td>
                            
                        </tr>
                    
                        <g:if test="${meal.animation}">                    	    
                        <tr class="prop">
                            <td valign="top" class="name">Animation:</td>
                            	<td valign="top" class="value"><g:video url="${meal.animation}" height="225" width="225" /></td>
                        </tr>
                        </g:if>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${meal?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
						<span> | </span>
            		<span class="button"><g:actionSubmit class="toXml" value="toXml" /></span>                    
                        <span> | </span>
            		<span class="button"><g:link controller = "meal" id="${meal?.id}" action = "prevMeal">previous Meal</g:link></span>
                        <span> | </span>
            		<span class="button"><g:link controller = "meal" id="${meal?.id}" action = "nextMeal">next Meal</g:link></span>
                </g:form>
            </div>
        </div>
        
        <h4><div id="xmlDiv" style="margin-left:20px;width:80%;">Meal XML</div></h4>
        
    </body>
</html>
