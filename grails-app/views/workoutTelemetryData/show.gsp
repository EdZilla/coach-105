

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show WorkoutTelemetryData</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">WorkoutTelemetryData List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New WorkoutTelemetryData</g:link></span>
        </div>
        <div class="body">
            <h1>Show WorkoutTelemetryData</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${workoutTelemetryData.id}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">File Name:</td>
                            
                            <td valign="top" class="value">${workoutTelemetryData.fileName}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Workout:</td>
                            
                            <td valign="top" class="value"><g:link controller="workout" action="show" id="${workoutTelemetryData?.workout?.id}">${workoutTelemetryData?.workout.name}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Gps Data:</td>
                            
                            <td valign="top" class="value">${workoutTelemetryData.gpsData}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Hrm Data:</td>
                            
                            <td valign="top" class="value">${workoutTelemetryData.hrmData}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${workoutTelemetryData?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                    <span class="button"><g:link controller = "workoutTelemetryData" action = "create">Import GPS/HRM Data</g:link></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
