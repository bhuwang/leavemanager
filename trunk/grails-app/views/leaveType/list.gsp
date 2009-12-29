
<%@ page import="com.egsgroup.leavemanager.model.LeaveType" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>LeaveType List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New LeaveType</g:link></span>
        </div>
        <div class="body">
            <h1>LeaveType List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="name" title="Name" />
                        
                   	        <g:sortableColumn property="description" title="Description" />
                        
                   	        <g:sortableColumn property="numberOfDays" title="Number Of Days" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${leaveTypeInstanceList}" status="i" var="leaveTypeInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${leaveTypeInstance.id}">${fieldValue(bean:leaveTypeInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:leaveTypeInstance, field:'name')}</td>
                        
                            <td>${fieldValue(bean:leaveTypeInstance, field:'description')}</td>
                        
                            <td>${fieldValue(bean:leaveTypeInstance, field:'numberOfDays')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${leaveTypeInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
