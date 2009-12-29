
<%@ page import="com.egsgroup.leavemanager.model.MyLeave" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show MyLeave</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">MyLeave List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New MyLeave</g:link></span>
        </div>
        <div class="body">
            <h1>Show MyLeave</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:myLeaveInstance, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Balance:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:myLeaveInstance, field:'balance')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">From Date:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:myLeaveInstance, field:'fromDate')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Leave Type:</td>
                            
                            <td valign="top" class="value"><g:link controller="leaveType" action="show" id="${myLeaveInstance?.leaveType?.id}">${myLeaveInstance?.leaveType?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Thru Date:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:myLeaveInstance, field:'thruDate')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">User:</td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${myLeaveInstance?.user?.id}">${myLeaveInstance?.user?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${myLeaveInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
