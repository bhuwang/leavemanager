<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta name="layout" content="main" />
    <title>Login</title>
  </head>
  <body>
    <form action="${resource(file: 'j_spring_security_check')}" method="POST">
      <fieldset>
        <table>
          <tr>
            <td>User Name:</td>
            <g:textField name="j_username"/></td>
          </tr>
          <tr>
            <td>Password:</td>
            <td><input name="j_password" type="password"/></td>
          </tr>
          <tr>
            <td>Remember:</td>
            <td><input type="checkbox" name="_spring_security_remember_me"/></td>
          </tr>
          <tr>
            <td colspan="2"><g:submitButton name="login" value="Login"/></td>
          </tr>
    </table>
  </fieldset>
</form>
    
</body>
</html>
