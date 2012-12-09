

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create ClassPeriod</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">ClassPeriod List</g:link></span>
        </div>
        <div class="body">
            <h1>Create ClassPeriod</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${classPeriod}">
            <div class="errors">
                <g:renderErrors bean="${classPeriod}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:classPeriod,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:classPeriod,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="startDate">Start Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:classPeriod,field:'startDate','errors')}">
                                    <g:datePicker name="startDate" value="${classPeriod?.startDate}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="endDate">End Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:classPeriod,field:'endDate','errors')}">
                                    <g:datePicker name="endDate" value="${classPeriod?.endDate}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="startTime">Start Time:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:classPeriod,field:'startTime','errors')}">
                                    <g:datePicker name="startTime" value="${classPeriod?.startTime}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="location">Location:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:classPeriod,field:'location','errors')}">
                                    <input type="text" id="location" name="location" value="${fieldValue(bean:classPeriod,field:'location')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="maxAthletes">Max Athletes:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:classPeriod,field:'maxAthletes','errors')}">
                                    <input type="text" id="maxAthletes" name="maxAthletes" value="${fieldValue(bean:classPeriod,field:'maxAthletes')}" />
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
