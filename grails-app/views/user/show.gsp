  
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>Show AuthUser</title>
  </head>
  <body>
    <div class="nav">
      <span class="menuButton"><a href="${createLinkTo(dir:'/')}">Home</a></span>
      <span class="menuButton"><g:link action="list">AuthUser List</g:link></span>
      <span class="menuButton"><g:link action="create">New AuthUser</g:link></span>
    </div>
    
    <div class="body">
      <h1>Show AuthUser</h1>
      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>
      <div class="dialog">
        <table>
          <tbody>
                   
            <tr class="prop">
              <td valign="top" class="name">Id:</td>
              <td valign="top" class="value">${person.id?.encodeAsHTML()}</td>
            </tr>
                   
            <tr class="prop">
              <td valign="top" class="name">Login Name:</td>
              <td valign="top" class="value">
              	${person.username?.encodeAsHTML()}
              </td>
            </tr>
                   
            <tr class="prop">
              <td valign="top" class="name">Full Name:</td>
              <td valign="top" class="value">
                ${person.userRealName?.encodeAsHTML()}
              </td>
            </tr>
                   
            <tr class="prop">
              <td valign="top" class="name">Enabled:</td>
              <td valign="top" class="value">
                ${person.enabled?.encodeAsHTML()}
              </td>
            </tr>
                   
            <tr class="prop">
              <td valign="top" class="name">Description:</td>
              <td valign="top" class="value">
                ${person.description?.encodeAsHTML()}
              </td>
            </tr>
                   
            <tr class="prop">
              <td valign="top" class="name">Email:</td>
              <td valign="top" class="value">
                ${person.email?.encodeAsHTML()}
              </td>
            </tr>
                   
            <tr class="prop">
              <td valign="top" class="name">Show Email:</td>
              <td valign="top" class="value">
                ${person.emailShow?.encodeAsHTML()}
              </td>
            </tr>

            <tr class="prop">
              <td valign="top" class="name">Time Zone Offset:</td>
              <td valign="top" class="value">
                ${person.timeZoneOffset?.encodeAsHTML()}
              </td>
            </tr>
                   
            <tr class="prop">
              <td valign="top" class="name">Roles:</td>
              <td valign="top" class="value">
                <ul>
                <g:collect in="${person.authorities}" expr="${it.authority}">
                  <li>${it?.substring(5)?.toLowerCase()}</li>
                </g:collect>
                </ul>
              </td>
            </tr>
            
            <tr class="prop">
                            <td valign="top" class="name">Biometrics:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="b" in="${person.biometrics}">
                                    <li><g:link controller="bioMetrics" action="show" id="${b.id}">${b}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
             </tr>
             
             <tr class="prop">
                            <td valign="top" class="name">Meals:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="m" in="${person.meals}">
                                    <li><g:link controller="meal" action="show" id="${m.id}">${m}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
            </tr>
                        
			<tr class="prop">
                            <td valign="top" class="name">Workouts:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="w" in="${person.workouts}">
                                    <li><g:link controller="workout" action="show" id="${w.id}">${w}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
            </tr>                        
                   
          </tbody>
        </table>
      </div>
      
      <div class="buttons">
        <g:form controller="user">
          <input type="hidden" name="id" value="${person?.id}" />
          <span class="button"><g:actionSubmit value="Edit" /></span>
          <span class="button"><g:actionSubmit value="Delete" /></span>
        </g:form>
      </div>
      
    </div>
  </body>
</html>
