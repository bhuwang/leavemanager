
<%@ page import="com.egsgroup.leavemanager.model.LeaveApplication" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit LeaveApplication</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">LeaveApplication List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New LeaveApplication</g:link></span>
        </div>
        <div class="body">
            <h1>Edit LeaveApplication</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${leaveApplicationInstance}">
            <div class="errors">
                <g:renderErrors bean="${leaveApplicationInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${leaveApplicationInstance?.id}" />
                <input type="hidden" name="version" value="${leaveApplicationInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="comment">Comment:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:leaveApplicationInstance,field:'comment','errors')}">
                                    <input type="text" id="comment" name="comment" value="${fieldValue(bean:leaveApplicationInstance,field:'comment')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="endDate">End Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:leaveApplicationInstance,field:'endDate','errors')}">
                                    <g:datePicker name="endDate" value="${leaveApplicationInstance?.endDate}" precision="minute" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="leaveReason">Leave Reason:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:leaveApplicationInstance,field:'leaveReason','errors')}">
                                    <input type="text" id="leaveReason" name="leaveReason" value="${fieldValue(bean:leaveApplicationInstance,field:'leaveReason')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="leaveType">Leave Type:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:leaveApplicationInstance,field:'leaveType','errors')}">
                                    <g:select optionKey="id" from="${com.egsgroup.leavemanager.model.LeaveType.list()}" name="leaveType.id" value="${leaveApplicationInstance?.leaveType?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="startDate">Start Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:leaveApplicationInstance,field:'startDate','errors')}">
                                    <g:datePicker name="startDate" value="${leaveApplicationInstance?.startDate}" precision="minute" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="status">Status:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:leaveApplicationInstance,field:'status','errors')}">
                                    <input type="text" id="status" name="status" value="${fieldValue(bean:leaveApplicationInstance,field:'status')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="user">User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:leaveApplicationInstance,field:'user','errors')}">
                                    <g:select optionKey="id" from="${com.egsgroup.leavemanager.model.User.list()}" name="user.id" value="${leaveApplicationInstance?.user?.id}" ></g:select>
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
