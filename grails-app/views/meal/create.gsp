

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Meal</title>         
    </head>
    <body>
    	<resource:autoComplete skin="default" />
    	<resource:dateChooser />
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Meal List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Meal for ${session.SPRING_SECURITY_LAST_USERNAME}</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${meal}">
            <div class="errors">
                <g:renderErrors bean="${meal}" as="list" />
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
                                <td valign="top" class="value ${hasErrors(bean:meal,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:meal,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:meal,field:'description','errors')}">
                                    <input type="text" id="description" name="description" value="${fieldValue(bean:meal,field:'description')}"/>
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cost">Cost:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:meal,field:'cost','errors')}">
                                    <input type="text" id="cost" name="cost" value="${fieldValue(bean:meal,field:'cost')}"/>
                                </td>
                            </tr> 
                        
                           <!-- <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="athlete">Athlete:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:meal,field:'athlete','errors')}">
                                    <g:select optionKey="id" from="${AuthUser.list()}" name="athlete.id" value="${meal?.athlete?.id}" ></g:select>
                                </td>
                            </tr> -->
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="date">Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:meal,field:'date','errors')}">
<!--                                    <richui:dateChooser name ="date" format="MM.dd.yyyy" value="${meal?.date}" />-->
                                    <g:datePicker name="date" value="${meal?.date}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                         	<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="animation">Animation:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:meal,field:'animation','errors')}">
									<input type="text" id="animation" name="animation" value="${fieldValue(bean:meal,field:'animation')}" />                                    
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
