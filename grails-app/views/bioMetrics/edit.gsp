

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit BioMetrics</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">BioMetrics List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New BioMetrics</g:link></span>
        </div>
        <div class="body">
            <h1>Edit BioMetrics</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${bioMetrics}">
            <div class="errors">
                <g:renderErrors bean="${bioMetrics}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${bioMetrics?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="height">Height:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:bioMetrics,field:'height','errors')}">
                                    <input type="text" id="height" name="height" value="${fieldValue(bean:bioMetrics,field:'height')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="weight">Weight:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:bioMetrics,field:'weight','errors')}">
                                    <input type="text" id="weight" name="weight" value="${fieldValue(bean:bioMetrics,field:'weight')}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="bodyFatPercentage">Body Fat Percentage:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:bioMetrics,field:'bodyFatPercentage','errors')}">
                                    <input type="text" id="bodyFatPercentage" name="bodyFatPercentage" value="${fieldValue(bean:bioMetrics,field:'bodyFatPercentage')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="waist">Waist:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:bioMetrics,field:'waist','errors')}">
                                    <input type="text" id="waist" name="waist" value="${fieldValue(bean:bioMetrics,field:'waist')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="chest">Chest:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:bioMetrics,field:'chest','errors')}">
                                    <input type="text" id="chest" name="chest" value="${fieldValue(bean:bioMetrics,field:'chest')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="bicep">Bicep:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:bioMetrics,field:'bicep','errors')}">
                                    <input type="text" id="bicep" name="bicep" value="${fieldValue(bean:bioMetrics,field:'bicep')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="thigh">Thigh:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:bioMetrics,field:'thigh','errors')}">
                                    <input type="text" id="thigh" name="thigh" value="${fieldValue(bean:bioMetrics,field:'thigh')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="athlete">Athlete:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:bioMetrics,field:'athlete','errors')}">
                                    <g:select optionKey="id" from="${AuthUser.list()}" name="athlete.id" value="${bioMetrics?.athlete?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="date">Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:bioMetrics,field:'date','errors')}">
                                    <g:datePicker name="date" value="${bioMetrics?.date}" ></g:datePicker>
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
