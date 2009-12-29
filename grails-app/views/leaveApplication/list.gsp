
<%@ page import="com.egsgroup.leavemanager.model.LeaveApplication" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>LeaveApplication List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New LeaveApplication</g:link></span>
        </div>
        <div class="body">
            <h1>LeaveApplication List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="comment" title="Comment" />
                        
                   	        <g:sortableColumn property="endDate" title="End Date" />
                        
                   	        <g:sortableColumn property="leaveReason" title="Leave Reason" />
                        
                   	        <th>Leave Type</th>
                   	    
                   	        <g:sortableColumn property="startDate" title="Start Date" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${leaveApplicationInstanceList}" status="i" var="leaveApplicationInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${leaveApplicationInstance.id}">${fieldValue(bean:leaveApplicationInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:leaveApplicationInstance, field:'comment')}</td>
                        
                            <td>${fieldValue(bean:leaveApplicationInstance, field:'endDate')}</td>
                        
                            <td>${fieldValue(bean:leaveApplicationInstance, field:'leaveReason')}</td>
                        
                            <td>${fieldValue(bean:leaveApplicationInstance, field:'leaveType')}</td>
                        
                            <td>${fieldValue(bean:leaveApplicationInstance, field:'startDate')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${leaveApplicationInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
