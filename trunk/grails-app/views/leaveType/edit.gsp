
<%@ page import="com.egsgroup.leavemanager.model.LeaveType" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit LeaveType</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">LeaveType List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New LeaveType</g:link></span>
        </div>
        <div class="body">
            <h1>Edit LeaveType</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${leaveTypeInstance}">
            <div class="errors">
                <g:renderErrors bean="${leaveTypeInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${leaveTypeInstance?.id}" />
                <input type="hidden" name="version" value="${leaveTypeInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:leaveTypeInstance,field:'name','errors')}">
                                    <input type="text" maxlength="60" id="name" name="name" value="${fieldValue(bean:leaveTypeInstance,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:leaveTypeInstance,field:'description','errors')}">
                                    <textarea rows="5" cols="40" name="description">${fieldValue(bean:leaveTypeInstance, field:'description')}</textarea>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="numberOfDays">Number Of Days:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:leaveTypeInstance,field:'numberOfDays','errors')}">
                                    <input type="text" id="numberOfDays" name="numberOfDays" value="${fieldValue(bean:leaveTypeInstance,field:'numberOfDays')}" />
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
