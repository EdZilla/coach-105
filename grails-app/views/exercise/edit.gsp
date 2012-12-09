

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Exercise</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Exercise List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Exercise</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Exercise</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${exercise}">
            <div class="errors">
                <g:renderErrors bean="${exercise}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${exercise?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:exercise,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:exercise,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:exercise,field:'description','errors')}">
                                    <input type="text" id="description" name="description" value="${fieldValue(bean:exercise,field:'description')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="avgSpeed">Avg Speed:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:exercise,field:'avgSpeed','errors')}">
                                    <input type="text" id="avgSpeed" name="avgSpeed" value="${fieldValue(bean:exercise,field:'avgSpeed')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="maxSpeed">Max Speed:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:exercise,field:'maxSpeed','errors')}">
                                    <input type="text" id="maxSpeed" name="maxSpeed" value="${fieldValue(bean:exercise,field:'maxSpeed')}" />
                                </td>
                            </tr> 
                        
                         	<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="avgHeartRate">Avg Heart Rate:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:exercise,field:'avgHeartRate','errors')}">
                                    <input type="text" id="avgHeartRate" name="avgHeartRate" value="${fieldValue(bean:exercise,field:'avgHeartRate')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="maxHeartRate">Max Heart Rate:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:exercise,field:'maxHeartRate','errors')}">
                                    <input type="text" id="maxHeartRate" name="maxHeartRate" value="${fieldValue(bean:exercise,field:'maxHeartRate')}" />
                                </td>
                            </tr>
                             
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="distance">Distance:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:exercise,field:'distance','errors')}">
                                    <input type="text" id="distance" name="distance" value="${fieldValue(bean:exercise,field:'distance')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="reps">Reps:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:exercise,field:'reps','errors')}">
                                    <input type="text" id="reps" name="reps" value="${fieldValue(bean:exercise,field:'reps')}" />
                                </td>
                            </tr> 
                        
                         <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="reps">Sets:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:exercise,field:'sets','errors')}">
                                    <input type="text" id="sets" name="sets" value="${fieldValue(bean:exercise,field:'sets')}" />
                                </td>
                            </tr> 
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="calories">Calories:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:exercise,field:'calories','errors')}">
                                    <input type="text" id="calories" name="calories" value="${fieldValue(bean:exercise,field:'calories')}" />
                                </td>
                            </tr> 
                            
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="seconds">Seconds:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:exercise,field:'seconds','errors')}">
                                    <input type="text" id="seconds" name="seconds" value="${fieldValue(bean:exercise,field:'seconds')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="equipment">Equipment:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:exercise,field:'equipment','errors')}">
                                    
							<ul>
							<g:each var="e" in="${exercise?.equipment?}">
							    <li><g:link controller="equipmentRef" action="show" id="${e.id}">${e}</g:link></li>
							</g:each>
							</ul>
							<g:link controller="equipmentRef" params="["exercise.id":exercise?.id]" action="create">Add EquipmentRef</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="animation">Animation:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:exercise,field:'animation','errors')}">
                                    <input type="text" id="animation" name="animation" value="${fieldValue(bean:exercise,field:'animation')}"/>
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
