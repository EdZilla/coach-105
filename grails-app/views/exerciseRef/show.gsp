

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show ExerciseRef</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">ExerciseRef List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New ExerciseRef</g:link></span>
            <span> | </span>
			<span class="button"><g:link controller = "exercise" action = "create">Create new exercise</g:link></span>                    
        </div>
        <div class="body">
            <h1>Show ExerciseRef</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${exerciseRef.id}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Workout:</td>
                            
                            <td valign="top" class="value"><g:link controller="workout" action="show" id="${exerciseRef?.workout?.id}">${exerciseRef?.workout}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Exercise:</td>
                            
                            <td valign="top" class="value"><g:link controller="exercise" action="show" id="${exerciseRef?.exercise?.id}">${exerciseRef?.exercise}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form controller="exerciseRef">
                    <input type="hidden" name="id" value="${exerciseRef?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
