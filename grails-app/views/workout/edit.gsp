

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Workout</title>
    </head>
    <body>

      <resource:richTextEditor />

        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Workout List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Workout</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Workout</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${workout}">
            <div class="errors">
                <g:renderErrors bean="${workout}" as="list" />
            </div>
            </g:hasErrors>
            <g:form controller="workout" method="post" >
                <input type="hidden" name="id" value="${workout?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:workout,field:'name','errors')}">
                                  <input type="text" id="name" name="name" value="${fieldValue(bean:workout,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:workout,field:'description','errors')}">
			         <input type="text" id="description" name="description" value="${fieldValue(bean:workout,field:'description')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="startDateTime">Start Date Time:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:workout,field:'startDateTime','errors')}">
                                    <g:datePicker name="startDateTime" value="${workout?.startDateTime}" ></g:datePicker>
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="duration">Duration:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:workout,field:'duration','errors')}">
   									<input type="text" id="duration" name="duration" value="${fieldValue(bean:workout,field:'duration')}" />
                                </td>
                            </tr>
                            
<!--                            <tr class="prop">-->
<!--                                <td valign="top" class="name">-->
<!--                                    <label for="endDateTime">End Date Time:</label>-->
<!--                                </td>-->
<!--                                <td valign="top" class="value ${hasErrors(bean:workout,field:'endDateTime','errors')}">-->
<!--                                    <g:datePicker name="endDateTime" value="${workout?.endDateTime}" ></g:datePicker>-->
<!--                                </td>-->
<!--                            </tr> -->
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="location">Location:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:workout,field:'location','errors')}">
                                    <input type="text" id="location" name="location" value="${fieldValue(bean:workout,field:'location')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="avgHeartRate">Avg Heart Rate:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:workout,field:'avgHeartRate','errors')}">
                                    <input type="text" id="avgHeartRate" name="avgHeartRate" value="${fieldValue(bean:workout,field:'avgHeartRate')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="maxHeartRate">Max Heart Rate:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:workout,field:'maxHeartRate','errors')}">
                                    <input type="text" id="maxHeartRate" name="maxHeartRate" value="${fieldValue(bean:workout,field:'maxHeartRate')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="distance">Distance:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:workout,field:'distance','errors')}">
                                    <input type="text" id="distance" name="distance" value="${fieldValue(bean:workout,field:'distance')}" />
                                </td>
                            </tr>

                              <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="calories">Calories:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:workout,field:'calories','errors')}">
                                    <input type="text" id="calories" name="calories" value="${fieldValue(bean:workout,field:'calories')}" />
                                </td>
                            </tr>
                        
                            <!--<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="athlete">Athlete:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:workout,field:'athlete','errors')}">
                                    <g:select optionKey="id" from="${AuthUser.list()}" name="athlete.id" value="${workout?.athlete?.id}" ></g:select>
                                </td>
                            </tr> -->
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="exercises">Exercises:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:workout,field:'exercises','errors')}">
                                    
							<ul>
								<g:each var="e" in="${workout?.exercises?}">
    								<li><g:link controller="exerciseRef" action="show" id="${e.id}">${e}</g:link></li>
								</g:each>
							</ul>
								<g:link controller="exerciseRef" params="["workout.id":workout?.id]" action="create">Add ExerciseRef</g:link>

                                </td>
                            </tr> 
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="animation">Animation:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:workout,field:'animation','errors')}">
									<input type="text" id="animation" name="animation" value="${fieldValue(bean:workout,field:'animation')}" />                                    
                                </td>
                            </tr> 
                            
                            
                             <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="course">Course:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:workout,field:'course','errors')}">
                                    <g:select optionKey="id" from="${Course.list()}" name="course.id" value="${workout?.course?.id}" ></g:select>
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
