
<%@ page import="com.egsgroup.leavemanager.model.Position" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Position</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Position List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Position</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Position</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${positionInstance}">
            <div class="errors">
                <g:renderErrors bean="${positionInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${positionInstance?.id}" />
                <input type="hidden" name="version" value="${positionInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="positionName">Position Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:positionInstance,field:'positionName','errors')}">
                                    <input type="text" maxlength="70" id="positionName" name="positionName" value="${fieldValue(bean:positionInstance,field:'positionName')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="positionDescription">Position Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:positionInstance,field:'positionDescription','errors')}">
                                    <textarea rows="5" cols="40" name="positionDescription">${fieldValue(bean:positionInstance, field:'positionDescription')}</textarea>
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
