

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Equipment</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Equipment List</g:link></span>

        </div>
        <div class="body">
            <h1>Create Equipment</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${equipment}">
            <div class="errors">
                <g:renderErrors bean="${equipment}" as="list" />
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
                                <td valign="top" class="value ${hasErrors(bean:equipment,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:equipment,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:equipment,field:'description','errors')}">
                                    <input type="text" id="description" name="description" value="${fieldValue(bean:equipment,field:'description')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cost">Cost:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:equipment,field:'cost','errors')}">
                                    <input type="text" id="cost" name="cost" value="${fieldValue(bean:equipment,field:'cost')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="photo">Photo:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:equipment,field:'photo','errors')}">
                                    <input type="text" id="photo" name="photo" value="${fieldValue(bean:equipment,field:'photo')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="datePurchased">Date Purchased:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:equipment,field:'datePurchased','errors')}">
                                    <g:datePicker name="datePurchased" value="${equipment?.datePurchased}" ></g:datePicker>
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
