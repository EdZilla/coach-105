

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create DevelIssue</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">DevelIssue List</g:link></span>
        </div>
        <div class="body">
            <h1>Create DevelIssue</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${develIssue}">
            <div class="errors">
                <g:renderErrors bean="${develIssue}" as="list" />
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
                                <td valign="top" class="value ${hasErrors(bean:develIssue,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:develIssue,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:develIssue,field:'description','errors')}">
                                    <input type="text" id="description" name="description" value="${fieldValue(bean:develIssue,field:'description')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="severity">Severity:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:develIssue,field:'severity','errors')}">
                                    <input type="text" id="severity" name="severity" value="${fieldValue(bean:develIssue,field:'severity')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="status">Status:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:develIssue,field:'status','errors')}">
                                    <g:select id="status" name="status" from="${develIssue.constraints.status.inList.collect{it.encodeAsHTML()}}" value="${fieldValue(bean:develIssue,field:'status')}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="domain">Domain:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:develIssue,field:'domain','errors')}">
                                    <input type="text" id="domain" name="domain" value="${fieldValue(bean:develIssue,field:'domain')}"/>
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
