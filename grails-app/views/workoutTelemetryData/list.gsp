

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>WorkoutTelemetryData List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New WorkoutTelemetryData</g:link></span>
        </div>
        <div class="body">
            <h1>WorkoutTelemetryData List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="fileName" title="File Name" />
                        
                   	        <th>Workout</th>
                   	    
                   	        <g:sortableColumn property="gpsData" title="Gps Data" />
                        
                   	        <g:sortableColumn property="hrmData" title="Hrm Data" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${workoutTelemetryDataList}" status="i" var="workoutTelemetryData">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${workoutTelemetryData.id}">${workoutTelemetryData.id?.encodeAsHTML()}</g:link></td>
                        
                            <td>${workoutTelemetryData.fileName?.encodeAsHTML()}</td>
                        
                            <td>${workoutTelemetryData.workout?.name.encodeAsHTML()}, ${workoutTelemetryData.workout?.startDateTime.encodeAsHTML()}</td>
                        
                            <td>${workoutTelemetryData.gpsData?.encodeAsHTML()}</td>
                        
                            <td>${workoutTelemetryData.hrmData?.encodeAsHTML()}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${WorkoutTelemetryData.count()}" />
            </div>
        </div>
    </body>
</html>
