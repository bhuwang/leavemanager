
<%@ page import="com.egsgroup.leavemanager.model.Holiday" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Holiday</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Holiday List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Holiday</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Holiday</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${holidayInstance}">
            <div class="errors">
                <g:renderErrors bean="${holidayInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${holidayInstance?.id}" />
                <input type="hidden" name="version" value="${holidayInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:holidayInstance,field:'description','errors')}">
                                    <input type="text" id="description" name="description" value="${fieldValue(bean:holidayInstance,field:'description')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fromDate">From Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:holidayInstance,field:'fromDate','errors')}">
                                    <g:datePicker name="fromDate" value="${holidayInstance?.fromDate}" precision="minute" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="holidayName">Holiday Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:holidayInstance,field:'holidayName','errors')}">
                                    <input type="text" id="holidayName" name="holidayName" value="${fieldValue(bean:holidayInstance,field:'holidayName')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="thruDate">Thru Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:holidayInstance,field:'thruDate','errors')}">
                                    <g:datePicker name="thruDate" value="${holidayInstance?.thruDate}" precision="minute" ></g:datePicker>
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
