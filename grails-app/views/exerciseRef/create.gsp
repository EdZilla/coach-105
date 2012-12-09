

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create ExerciseRef</title>         
    </head>
    <body>
    
     <div class="searchbar">
		<div class="total">
			Search for an exercise
		</div>
			<div class="search">
				<g:form action="search">
					<g:textField name="searchFieldCriteria" />
				</g:form>
			</div>
	</div>
    
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">ExerciseRef List</g:link></span>
            <span> | </span>
            <span class="button"><g:link controller = "exercise" action = "create">Create new exercise</g:link></span>
        </div>
        <div class="body">
            <h1>Create ExerciseRef</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${exerciseRef}">
            <div class="errors">
                <g:renderErrors bean="${exerciseRef}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="workout">Workout:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:exerciseRef,field:'workout','errors')}">
                                    <g:select optionKey="id" from="${Workout.list()}" name="workout.id" value="${exerciseRef?.workout?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="exercise">Exercise:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:exerciseRef,field:'exercise','errors')}">
                                    <g:select optionKey="id" from="${Exercise.list()}" name="exercise.id" value="${exerciseRef?.exercise?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create Exercise Ref" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
