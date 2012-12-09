

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create WorkoutTelemetryData</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">WorkoutTelemetryData List</g:link></span>
        </div>
        <div class="body">
            <h1>Create WorkoutTelemetryData</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${workoutTelemetryData}">
            <div class="errors">
                <g:renderErrors bean="${workoutTelemetryData}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fileName">File Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:workoutTelemetryData,field:'fileName','errors')}">
                                    <input type="text" id="fileName" name="fileName" value="${fieldValue(bean:workoutTelemetryData,field:'fileName')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="workout">Workout:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:workoutTelemetryData,field:'workout','errors')}">
                                    <g:select optionKey="id" from="${Workout.list()}" name="workout.id" value="${workoutTelemetryData?.workout?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="gpsData">Gps Data:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:workoutTelemetryData,field:'gpsData','errors')}">
                                    
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="hrmData">Hrm Data:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:workoutTelemetryData,field:'hrmData','errors')}">
                                    
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
