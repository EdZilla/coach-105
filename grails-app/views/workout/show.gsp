

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Workout</title>
    </head>
    <body>
    
    	<resource:autoComplete skin="default" />
    
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Workout List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Workout</g:link></span>
            <span> | </span>
			<span class="button"><g:link controller = "exerciseRef" action = "create">Add an exercise to this workout</g:link></span>
            <span> | </span>
            <span class="button"><g:link controller = "workoutTelemetryData" action = "create">Import GPS/HRM Data</g:link></span>
            <span> | </span>
            	<span class="button"><g:remoteLink action="toXml" id="${workout?.id}" update="xmlDiv">Show Workout Xml</g:remoteLink>
			<span> | </span>
            <g:link action="email">Email this Workout</g:link>            
        </div>
        <div class="body">
            <h1>Show Workout</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>                            
                            <td valign="top" class="value">${workout.id}</td>                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Name:</td>                            
                            <td valign="top" class="value">${workout.name}</td>                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Description:</td>                            
                            <td valign="top" class="value"><g:render template="workout" var="workout" bean="${workout}" /></td>                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Start Date Time:</td>                            
                            <td valign="top" class="value">${workout.startDateTime}</td>                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name">Duration (in minutes):</td>                            
                            <td valign="top" class="value">${workout.duration}</td>                            
                        </tr>
                        
                        <g:if test="${workout.endDateTime}">                    
                        <tr class="prop">
                            <td valign="top" class="name">End Date Time:</td>                            
                            <td valign="top" class="value">${workout.endDateTime}</td>                            
                        </tr>
                        </g:if>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Location:</td>                            
                            <td valign="top" class="value">${workout.location}</td>                            
                        </tr>
                    
                                        
                    <g:if test="${workout.avgHeartRate}">
                        <tr class="prop">
                            <td valign="top" class="name">Avg Heart Rate:</td>                            
                            <td valign="top" class="value">${workout.avgHeartRate}</td>                            
                        </tr>
                        </g:if>
                    
                    	<g:if test="${workout.maxHeartRate}">
                        <tr class="prop">
                            <td valign="top" class="name">Max Heart Rate:</td>                            
                            <td valign="top" class="value">${workout.maxHeartRate}</td>                            
                        </tr>
                        </g:if>
                    
                    	<g:if test="${workout.distance}">
                        <tr class="prop">
                            <td valign="top" class="name">Distance:</td>                            
                            <td valign="top" class="value">${workout.distance}</td>                            
                        </tr>
                        </g:if>

                        <g:if test="${workout.calories}">
                        <tr class="prop">
                            <td valign="top" class="name">Calories:</td>
                            <td valign="top" class="value">${workout.calories}</td>
                        </tr>
                        </g:if>
                    
                    	<g:if test="${workout.athlete}">
                        <tr class="prop">
                            <td valign="top" class="name">Athlete:</td>                            
                            <td valign="top" class="value"><g:link controller="authUser" action="show" id="${workout?.athlete?.id}">${workout?.athlete}</g:link></td>                            
                        </tr>
                        </g:if>

						
                    
                        <tr class="prop">
                            <td valign="top" class="name">Exercises:</td>                            
                            <td  valign="top" style="text-align:left;" class="value">

                                <h4>Find an Exercise to add:</h4>
								  <richui:autoComplete name="name" action="${createLinkTo('dir': 'exercise/searchAJAX')}" onItemSelect="document.location.href = '${createLinkTo(dir: 'exercise/show')}/' + id;" />

	                            <br>
                                <g:link controller="exercise" params="["workout.id":workout?.id]" action="create">Or create a new exercise</g:link>

	                            <br><br>
							    <g:if test="${workout.exercises}">
								 <h4>Exercises in this workout:</h4>
								</g:if>
								<ul>
                                <g:each var="e" in="${workout.exercises}">
                                    <li><g:link controller="exerciseRef" action="show" id="${e.id}">${e.exercise.name}: ${e.exercise.description} </g:link></li>
                                </g:each>

                                </ul>
                            </td>
                        </tr>
                        
                        <g:if test="${workout.animation}">
                        <tr class="prop">
                            <td valign="top" class="name">Animation:</td>
	                       	<td valign="top" class="value"><g:video url="${workout.animation}" height="225" width="225" /></td>
                        </tr>
                        </g:if>
                        
                        <g:if test="${workout.course}">
                        <tr class="prop">
                            <td valign="top" class="name">Course:</td>
                            <g:if test="${workout.course?.map}">
                            	<td><g:link controller="course" action="show" id="${workout.course.id}"><g:image src="${workout.course.map}" alt="enter the image path here" title="bar" /></g:link></td>
                            </g:if>                            
                        </tr>
                        </g:if>
                        
                        <g:if test="${workout.gpsHrmData}">
                         <tr class="prop">
                            <td valign="top" class="name">HRM or GPS Data:</td>                            
                            <td valign="top" class="value">${workout.gpsHrmData}</td>                            
                        </tr>
                        </g:if>
                    
                    </tbody>
                </table>
            </div>
            
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${workout?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                       <span> | </span>
            		<span class="button"><g:actionSubmit class="toXml" value="toXml" /></span>
                        <span> | </span>
            		<span class="button"><g:actionSubmit class="prettyPrint" value="prettyPrint" /></span>
                        <span> | </span>
                        <span class="button"><g:link controller = "workout" id="${workout?.id}" action = "prevWorkout">previous Workout</g:link></span>
                        <span> | </span>
            		<span class="button"><g:link controller = "workout" id="${workout?.id}" action = "nextWorkout">next Workout</g:link></span>                    
                                      
                </g:form>
            </div>
        </div>
        
        <h4><div id="xmlDiv" style="margin-left:20px;width:80%;">Workout XML</div></h4>
        
    </body>
</html>
