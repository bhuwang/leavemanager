<html>
    <head>
        <title>Welcome to Home </title>
		<meta name="layout" content="main" />
		
    </head>
    <body onload="setTitle('Welcome Home');">
	
	
        <h1 >Welcome Home</h1>
    	
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
         </g:if>
            
        <div class="dialog">
            <ul>
              <g:each var="c" in="${grailsApplication.controllerClasses}">
                    <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
              </g:each>
            </ul>
        </div>
    </body>
</html>