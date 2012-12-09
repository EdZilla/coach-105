

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Food</title>         
    </head>
    <body>
    	
    	<resource:autoComplete skin="default" />
    	
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Food List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Food</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${food}">
            <div class="errors">
                <g:renderErrors bean="${food}" as="list" />
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
                                <td valign="top" class="value ${hasErrors(bean:food,field:'name','errors')}">
                                 <richui:autoComplete name="name" action="${createLinkTo('dir': 'food/searchAJAX')}" />
<!--                                    <input type="text" id="name" name="name" value="${fieldValue(bean:food,field:'name')}"/>-->
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:food,field:'description','errors')}">
                                    <input type="text" id="description" name="description" value="${fieldValue(bean:food,field:'description')}"/>
                                </td>
                            </tr> 
                            
                             <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cost">Cost:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:food,field:'cost','errors')}">
                                    <input type="text" id="cost" name="cost" value="${fieldValue(bean:food,field:'cost')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="animation">Animation:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:food,field:'animation','errors')}">
									<input type="text" id="animation" name="animation" value="${fieldValue(bean:food,field:'animation')}" />                                    
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
