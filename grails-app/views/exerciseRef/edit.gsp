

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit ExerciseRef</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">ExerciseRef List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New ExerciseRef</g:link></span>
        </div>
        <div class="body">
            <h1>Edit ExerciseRef</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${exerciseRef}">
            <div class="errors">
                <g:renderErrors bean="${exerciseRef}" as="list" />
            </div>
            </g:hasErrors>
            <g:form controller="exerciseRef" method="post" >
                <input type="hidden" name="id" value="${exerciseRef?.id}" />
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
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
