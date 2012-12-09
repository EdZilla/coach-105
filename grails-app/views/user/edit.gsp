  
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>Edit AuthUser</title>
  </head>
  <body>
    <div class="nav">
      <span class="menuButton"><a href="${createLinkTo(dir:'/')}">Home</a></span>
      <span class="menuButton"><g:link action="list">AuthUser List</g:link></span>
      <span class="menuButton"><g:link action="create">New AuthUser</g:link></span>
    </div>
    <div class="body">
      <h1>Edit AuthUser</h1>
      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>
      <g:hasErrors bean="${person}">
        <div class="errors">
          <g:renderErrors bean="${person}" as="list" />
        </div>
      </g:hasErrors>
      
      <div class="prop">
	    <span class="name">Id:</span>
	    <span class="value">${person?.id}</span>
      </div>
                 
      <g:form controller="user" method="post" >
        <input type="hidden" name="id" value="${person?.id}" />
        <div class="dialog">
          <table>
            <tbody> 
                       
		      <tr class='prop'>
			    <td valign='top' class='name'>
			      <label for='username'>Login Name:</label>
			    </td>
				<td valign='top' 
				    class='value ${hasErrors(bean:person,field:'username','errors')}'>
				  <input type="text" name='username' 
				         value="${person?.username?.encodeAsHTML()}"/>
				</td>
			  </tr>
                       
			  <tr class='prop'>
			    <td valign='top' class='name'>
			      <label for='userRealName'>Full Name:</label>
			    </td>
				<td valign='top' 
				    class='value ${hasErrors(bean:person,field:'userRealName','errors')}'>
				  <input type="text" name='userRealName' 
				         value="${person?.userRealName?.encodeAsHTML()}"/>
				</td>
			  </tr>
                       
			  <tr class='prop'>
			    <td valign='top' class='name'>
			      <label for='passwd'>Password:</label>
			    </td>
				<td valign='top' 
				    class='value ${hasErrors(bean:person,field:'passwd','errors')}'>
				  <input type="password" name='passwd' 
				         value="${person?.passwd?.encodeAsHTML()}"/>
				</td>
			  </tr>
                       
			  <tr class='prop'>
				<td valign='top' class='name'>
				  <label for='enabled'>Enabled:</label>
				</td>
				<td valign='top' 
				    class='value ${hasErrors(bean:person,field:'enabled','errors')}'>
				  <g:checkBox name='enabled' value="${person?.enabled}" ></g:checkBox>
				</td>
			  </tr>
                       
			  <tr class='prop'>
			    <td valign='top' class='name'>
			      <label for='description'>Description:</label>
			    </td>
				<td valign='top' 
				    class='value ${hasErrors(bean:person,field:'description','errors')}'>
				  <input type="text" name='description' 
				         value="${person?.description?.encodeAsHTML()}"/>
				</td>
			  </tr>
                       
			  <tr class='prop'>
			    <td valign='top' class='name'>
			      <label for='email'>Email:</label>
			    </td>
				<td valign='top' 
				    class='value ${hasErrors(bean:person,field:'email','errors')}'>
				  <input type="text" name='email' 
				         value="${person?.email?.encodeAsHTML()}"/>
				</td>
			  </tr>
                       
			  <tr class='prop'>
			    <td valign='top' class='name'>
			      <label for='emailShow'>Show Email:</label>
			    </td>
				<td valign='top' 
				    class='value ${hasErrors(bean:person,field:'emailShow','errors')}'>
				  <g:checkBox name='emailShow' value="${person?.emailShow}" >
				  </g:checkBox>
				</td>
			  </tr>

                          <tr class='prop'>
			    <td valign='top' class='name'>
			      <label for='timeZoneOffset'>Time Zone Offset:</label>
			    </td>
				<td valign='top'
				    class='value ${hasErrors(bean:person,field:'timeZoneOffset','errors')}'>
				  <g:checkBox name='timeZoneOffset' value="${person?.timeZoneOffset}" >
				  </g:checkBox>
				</td>
			  </tr>
			  
			  <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="biometrics">Biometrics:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:person,field:'biometrics','errors')}">
                                    
<ul>
<g:each var="b" in="${person?.biometrics?}">
    <li><g:link controller="bioMetrics" action="show" id="${b.id}">${b}</g:link></li>
</g:each>
</ul>
<g:link controller="bioMetrics" params="["person.id":athlete?.id]" action="create">Add BioMetrics</g:link>

                                </td>
                            </tr> 
                            
<tr class="prop">

                                <td valign="top" class="name">
                                    <label for="meals">Meals:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:person,field:'meals','errors')}">
                                    
<ul>
<g:each var="m" in="${person?.meals?}">
    <li><g:link controller="meal" action="show" id="${m.id}">${m}</g:link></li>
</g:each>
</ul>
<g:link controller="meal" params="["person.id":person?.id]" action="create">Add Meal</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="workouts">Workouts:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:person,field:'workouts','errors')}">
                                    
<ul>
<g:each var="w" in="${person?.workouts?}">
    <li><g:link controller="workout" action="show" id="${w.id}">${w}</g:link></li>
</g:each>
</ul>
<g:link controller="workout" params="["person.id":person?.id]" action="create">Add Workout</g:link>

                                </td>
                            </tr>                             
                  
			  <tr class='prop'>
				<td valign='top' class='name'>
				  <label for='authorities'>Roles:</label>
				</td>
	    		<td valign='top' 
	    			class='value ${hasErrors(bean:person,field:'authorities','errors')}'>
				  <ul>


					<g:set var="list" value="[]"/>
					<g:each var='b' in="${authorityList.authority}">
    				  <g:each var='a' in='${person?.authorities?}'>
    			        <g:if test="${b==~ a.authority}">
    					  <%if(!list.contains(b)){list.add(b);%>
    					    <li>${a.authority?.substring(5)?.toLowerCase()?.encodeAsHTML()}
    						  <g:checkBox name='${a.authority}' value="${true}" ></g:checkBox>
    						</li>
    					  <%}%>
    					</g:if>
    				  </g:each>
    				  <%if(!list.contains(b)){list.add(b);%>
    				    <li>${b.substring(5)?.toLowerCase()?.encodeAsHTML()}
    					  <g:checkBox name='${b}' value="${false}" ></g:checkBox>
    					</li>
    				  <%}%>
    				</g:each>
				  </ul>
				</td>
			  </tr>
                       
            </tbody>
          </table>
        </div>

        <div class="buttons">
          <span class="button"><g:actionSubmit value="Update" /></span>
          <span class="button"><g:actionSubmit value="Delete" /></span>
        </div>
        
      </g:form>
      
    </div>
  </body>
</html>
