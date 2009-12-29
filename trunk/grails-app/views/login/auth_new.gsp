<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta name="layout" content="public" />
    <title>Login</title>
  </head>
  <body>
    <div>${flash.message}</div>
    <g:form action="${resource(file: 'j_spring_security_check')}" method="POST">
      <fieldset style="width: 210">
        <legend>Please enter your login details</legend>
          <ul>
          <li>User Name: <g:textField name="j_username" size="20"/></li>
          <li>Password: <g:passwordField name="j_password" size="20"/></li>
          <li>Remember: <g:checkBox name="_spring_security_remember_me"/></li>
          <li><g:submitButton name="login" value="Login"/></li>
        </ul>
      </fieldset>
    </g:form>


        
    
</body>
</html>
