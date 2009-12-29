
<%@ page import="com.egsgroup.leavemanager.model.Holiday" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Holiday List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Holiday</g:link></span>
        </div>
        <div class="body">
            <h1>Holiday List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="description" title="Description" />
                        
                   	        <g:sortableColumn property="fromDate" title="From Date" />
                        
                   	        <g:sortableColumn property="holidayName" title="Holiday Name" />
                        
                   	        <g:sortableColumn property="thruDate" title="Thru Date" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${holidayInstanceList}" status="i" var="holidayInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${holidayInstance.id}">${fieldValue(bean:holidayInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:holidayInstance, field:'description')}</td>
                        
                            <td>${fieldValue(bean:holidayInstance, field:'fromDate')}</td>
                        
                            <td>${fieldValue(bean:holidayInstance, field:'holidayName')}</td>
                        
                            <td>${fieldValue(bean:holidayInstance, field:'thruDate')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${holidayInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
