

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>BioMetrics List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New BioMetrics</g:link></span>
        </div>
        <div class="body">
            <h1>BioMetrics List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="date" title="Date" />
                        
                   	        <g:sortableColumn property="weight" title="Weight" />

                       	        <g:sortableColumn property="bodyFatPercentage" title="BFP" />
                        
                   	        <g:sortableColumn property="waist" title="Waist" />
                        
                   	        <g:sortableColumn property="chest" title="Chest" />
                        
                   	        <g:sortableColumn property="bicep" title="Bicep" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${bioMetricsList}" status="i" var="bioMetrics">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${bioMetrics.id}">${bioMetrics.id?.encodeAsHTML()}</g:link></td>
                        
                            <td>${bioMetrics.date?.encodeAsHTML()}</td>
                        
                            <td>${bioMetrics.weight?.encodeAsHTML()}</td>

                            <td>${bioMetrics.bodyFatPercentage?.encodeAsHTML()}</td>
                        
                            <td>${bioMetrics.waist?.encodeAsHTML()}</td>
                        
                            <td>${bioMetrics.chest?.encodeAsHTML()}</td>
                        
                            <td>${bioMetrics.bicep?.encodeAsHTML()}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${BioMetrics.count()}" />
            </div>
        </div>
    </body>
</html>
