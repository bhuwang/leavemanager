
<%@ page import="com.egsgroup.leavemanager.model.Position" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Position List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Position</g:link></span>
        </div>
        <div class="body">
            <h1>Position List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="positionName" title="Position Name" />
                        
                   	        <g:sortableColumn property="positionDescription" title="Position Description" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${positionInstanceList}" status="i" var="positionInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${positionInstance.id}">${fieldValue(bean:positionInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:positionInstance, field:'positionName')}</td>
                        
                            <td>${fieldValue(bean:positionInstance, field:'positionDescription')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${positionInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
