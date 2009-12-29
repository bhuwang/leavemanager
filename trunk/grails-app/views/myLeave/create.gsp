
<%@ page import="com.egsgroup.leavemanager.model.MyLeave" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create MyLeave</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">MyLeave List</g:link></span>
        </div>
        <div class="body">
            <h1>Create MyLeave</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${myLeaveInstance}">
            <div class="errors">
                <g:renderErrors bean="${myLeaveInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="balance">Balance:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:myLeaveInstance,field:'balance','errors')}">
                                    <input type="text" id="balance" name="balance" value="${fieldValue(bean:myLeaveInstance,field:'balance')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fromDate">From Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:myLeaveInstance,field:'fromDate','errors')}">
                                    <g:datePicker name="fromDate" value="${myLeaveInstance?.fromDate}" precision="minute" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="leaveType">Leave Type:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:myLeaveInstance,field:'leaveType','errors')}">
                                    <g:select optionKey="id" from="${com.egsgroup.leavemanager.model.LeaveType.list()}" name="leaveType.id" value="${myLeaveInstance?.leaveType?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="thruDate">Thru Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:myLeaveInstance,field:'thruDate','errors')}">
                                    <g:datePicker name="thruDate" value="${myLeaveInstance?.thruDate}" precision="minute" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="user">User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:myLeaveInstance,field:'user','errors')}">
                                    <g:select optionKey="id" from="${com.egsgroup.leavemanager.model.User.list()}" name="user.id" value="${myLeaveInstance?.user?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
