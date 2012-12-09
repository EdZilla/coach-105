

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Workout List</title>
    </head>
    <body>

		<div class="searchbar">
		<div class="total">
			Search your Workouts
		</div>
			<div class="search">
				<g:form action="search">
					<g:textField name="searchFieldCriteria" />
				</g:form>
			</div>
	</div>
				
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Workout</g:link></span>
            <span> | </span>
             <span class="button"><g:link action = "listXml">Export Workout Data</g:link></span>
            <span> | </span>
             <span class="button"><g:link action = "emailRecent">Email Recent Workouts</g:link></span>
        </div>
        <div class="body">
            <h1>Workout List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="name" title="Name" />
                        
                   	        <g:sortableColumn property="description" title="Description" />
                        
                   	        <g:sortableColumn property="startDateTime" title="Start Date Time" />
                        
                   	        <g:sortableColumn property="location" title="Location" />
                   	        
                   	        <g:sortableColumn property="duration" title="Duration" />
                        
                   	        <g:sortableColumn property="avgHeartRate" title="Avg Heart Rate" />
                   	        
                   	        <g:sortableColumn property="distance" title="Distance" />
                   	        
                   	        <g:sortableColumn property="course" title="Course" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${workoutList}" status="i" var="workout">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${workout.id}">${workout.id?.encodeAsHTML()}</g:link></td>
                        
                            <td><g:link action="show" id="${workout.id}">${workout.name?.encodeAsHTML()}</g:link></td>
                        
                            <td><g:render template="workout" var="workout" bean="${workout}" /></td>
                        
                            <td>${workout.startDateTime?.encodeAsHTML()}</td>
                        
                            <td>${workout.location?.encodeAsHTML()}</td>
                            
                            <td>${workout.duration?.encodeAsHTML()}</td>
                        
                            <td>${workout.avgHeartRate?.encodeAsHTML()}</td>
                            
                            <td>${workout.distance?.encodeAsHTML()}</td>
                            
                            <g:if test="${workout.course}">
                            	<td><g:link controller="course" action="show" id="${workout.course?.id}">yes</g:link></td>
                            </g:if>
                            <g:else>
								<td>no</td>                            		
                            </g:else>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${Workout.count()}" />
            </div>
        </div>
    </body>
</html>
