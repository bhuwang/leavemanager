
<%@ page import="com.egsgroup.leavemanager.model.MyLeave" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>MyLeave List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New MyLeave</g:link></span>
        </div>
        <div class="body">
            <h1>MyLeave List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="balance" title="Balance" />
                        
                   	        <g:sortableColumn property="fromDate" title="From Date" />
                        
                   	        <th>Leave Type</th>
                   	    
                   	        <g:sortableColumn property="thruDate" title="Thru Date" />
                        
                   	        <th>User</th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${myLeaveInstanceList}" status="i" var="myLeaveInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${myLeaveInstance.id}">${fieldValue(bean:myLeaveInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:myLeaveInstance, field:'balance')}</td>
                        
                            <td>${fieldValue(bean:myLeaveInstance, field:'fromDate')}</td>
                        
                            <td>${fieldValue(bean:myLeaveInstance, field:'leaveType')}</td>
                        
                            <td>${fieldValue(bean:myLeaveInstance, field:'thruDate')}</td>
                        
                            <td>${fieldValue(bean:myLeaveInstance, field:'user')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${myLeaveInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
