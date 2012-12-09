

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Exercise</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Exercise List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Exercise</g:link></span>
            <span> | </span>
            <span class="button"><g:link controller = "exerciseRef" action = "create">Add this exercise to a workout</g:link></span>
            <span> | </span>
            	<span class="button"><g:remoteLink action="toXml" id="${exercise?.id}" update="xmlDiv">Show Exercise Xml</g:remoteLink>
        </div>
        <div class="body">
            <h1>Show Exercise</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>                            
                            <td valign="top" class="value">${exercise.id}</td>                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Name:</td>                            
                            <td valign="top" class="value">${exercise.name}</td>                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Description:</td>                            
                            <td valign="top" class="value"><g:render template="exercise" var="exercise" bean="${exercise}" /></td>                            
                        </tr>
                    
                    	<g:if test="${exercise.avgSpeed}">
                        <tr class="prop">
                            <td valign="top" class="name">Avg Speed:</td>                            
                            <td valign="top" class="value">${exercise.avgSpeed}</td>
                        </tr>
                        </g:if>
                    
                        <g:if test="${exercise.maxSpeed}">
                        <tr class="prop">
                            <td valign="top" class="name">Max Speed:</td>                            
                            <td valign="top" class="value">${exercise.maxSpeed}</td>
                        </tr>
                        </g:if>
                        
                        <g:if test="${exercise.avgHeartRate}">
                         <tr class="prop">
                            <td valign="top" class="name">Avg HeartRate:</td>
                            
                            <td valign="top" class="value">${exercise.avgHeartRate}</td>                            
                        </tr>
                        </g:if>
                    
                    	<g:if test="${exercise.maxHeartRate}">
                        <tr class="prop">
                            <td valign="top" class="name">Max Heart Rate:</td>
                            
                            <td valign="top" class="value">${exercise.maxHeartRate}</td>
                        </tr>
                        </g:if>
                    
                       <g:if test="${exercise.distance}">
                        <tr class="prop">
                            <td valign="top" class="name">Distance:</td>
                            
                            <td valign="top" class="value">
                            		<g:formatNumber number="${exercise.distance}"
                            								format="##0.00 mi"/>
                            </td>
                        </tr>
                        </g:if>
                    
                        <g:if test="${exercise.reps}">
                        <tr class="prop">
                            <td valign="top" class="name">Reps:</td>
                            
                            <td valign="top" class="value">${exercise.reps}</td>                            
                        </tr>
                        </g:if>
                        
                        <g:if test="${exercise.sets}">
                        <tr class="prop">
                            <td valign="top" class="name">Sets:</td>
                            
                            <td valign="top" class="value">${exercise.sets}</td>                            
                        </tr>
                        </g:if>
                        
                        <g:if test="${exercise.calories}">
                        <tr class="prop">
                            <td valign="top" class="name">Calories:</td>
                            
                            <td valign="top" class="value">${exercise.calories}</td>                            
                        </tr>
                        </g:if>
                    
                       <g:if test="${exercise.seconds}">                    
                        <tr class="prop">
                            <td valign="top" class="name">Seconds:</td>
                            
                            <td valign="top" class="value">${exercise.seconds}</td>                            
                        </tr>
                        </g:if>
                    
                       <g:if test="${exercise.equipment}">                    
                        <tr class="prop">
                            <td valign="top" class="name">Equipment:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="e" in="${exercise.equipment}">
                                    <li><g:link controller="equipmentRef" action="show" id="${e.id}">${e}:${e.equipment.name}</g:link></li>
                                </g:each>
                                </ul>
                            </td>                            
                        </tr>
                        </g:if>
                    
                         <g:if test="${exercise.animation}">
                         <tr class="prop">
                            <td valign="top" class="name">Animation:</td>
                            <g:if test="${exercise.animation}">
                            	<td valign="top" class="value"><g:video url="${exercise.animation}" height="225" width="225" /></td>
                            </g:if>                            
                        </tr>
                        </g:if>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${exercise?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
						<span> | </span>
        					<g:link controller="workout" params="["exercise.id":exercise?.id]" action="addExerciseTo" >Add this exercise item to current workout</g:link>
                       <span> | </span>
            		<span class="button"><g:actionSubmit class="toXml" value="toXml" /></span>
            		   <span> | </span>
            		<span class="button"><g:actionSubmit class="prettyPrint" value="prettyPrint" /></span>
                </g:form>
            </div>
        </div>
        
        <h4><div id="xmlDiv" style="margin-left:20px;width:80%;">Exercise XML</div></h4>
        
    </body>
</html>
