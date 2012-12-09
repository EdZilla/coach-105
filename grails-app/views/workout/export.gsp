

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Export Workout Data</title>
    </head>
    <body>

		<g:if test="${session}">
			<div class="userDetails">
			<h3>Your Profile ${params.myUser}</h3>
			
			</div>
		</g:if>
		
		<g:if test="${session.user}">
			<div class="userDetails">
			<h3>Profile Stuff</h3>
			
			</div>
		</g:if>
		
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
        </div>
        <div class="body">
            <h1>Export: Workout List</h1>
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
                        
                   	        <g:sortableColumn property="avgHeartRate" title="Avg Heart Rate" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${workoutList}" status="i" var="workout">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${workout.id}">${workout.id?.encodeAsHTML()}</g:link></td>
                        
                            <td>${workout.name?.encodeAsHTML()}</td>
                        
                            <td><g:render template="workout" var="workout" bean="${workout}" /></td>
                        
                            <td>${workout.startDateTime?.encodeAsHTML()}</td>
                        
                            <td>${workout.location?.encodeAsHTML()}</td>
                        
                            <td>${workout.avgHeartRate?.encodeAsHTML()}</td>
                        
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
