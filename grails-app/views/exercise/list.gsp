

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Exercise List</title>
    </head>
    <body>
    
    <div class="searchbar">
		<div class="total">
			Search for Exercises
		</div>
			<div class="search">
				<g:form action="search">
					<g:textField name="searchFieldCriteria" />
				</g:form>
			</div>
	</div>
	
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Exercise</g:link></span>
             <span> | </span>
            <span class="button"><g:link action = "listXml">Export list as XML</g:link></span>
        </div>
        <div class="body">
            <h1>Exercise List</h1>
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
                        
                   	        <g:sortableColumn property="avgSpeed" title="Avg Speed" />
                        
                   	        <g:sortableColumn property="maxSpeed" title="Max Speed" />
                   	        
                   	        <g:sortableColumn property="avgHeartRate" title="Avg HR" />
                        
                   	        <g:sortableColumn property="maxHeartRate" title="Max HR" />
                        
                   	        <g:sortableColumn property="distance" title="Distance" />
                   	        
                   	        <g:sortableColumn property="reps" title="Reps" />
                   	        
                   	        <g:sortableColumn property="sets" title="Sets" />
                   	        
                   	        <g:sortableColumn property="seconds" title="Seconds" />
                        	    
                   	        <g:sortableColumn property="animation" title="Animation" />
                   	        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${exerciseList}" status="i" var="exercise">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${exercise.id}">${exercise.id?.encodeAsHTML()}</g:link></td>
                        
                            <td><g:link action="show" id="${exercise.id}">${exercise.name?.encodeAsHTML()}</g:link></td>
                            
                            <td><g:render template="exercise" var="exercise" bean="${exercise}" /></td>
                              
                            <td>${exercise.avgSpeed?.encodeAsHTML()}</td>
                        
                            <td>${exercise.maxSpeed?.encodeAsHTML()}</td>
                        
                        	<td>${exercise.avgHeartRate?.encodeAsHTML()}</td>
                        
                            <td>${exercise.maxHeartRate?.encodeAsHTML()}</td>
                            
                            <td>${exercise.distance?.encodeAsHTML()}</td>
                            
                            <td>${exercise.reps?.encodeAsHTML()}</td>
                            
                            <td>${exercise.sets?.encodeAsHTML()}</td>
                            
                            <td>${exercise.seconds?.encodeAsHTML()}</td>
                            
                            <g:if test="${exercise.animation}">
                            	<td>yes</td>
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
                <g:paginate total="${Exercise.count()}" />
            </div>
        </div>
    </body>
</html>
