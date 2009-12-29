<head>
	<meta name="layout" content="main" />
    <gui:resources components="['autoComplete']" mode="debug"/>
	<title>Create User</title>
</head>

<body>

	<div class="nav">
		<span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
		<span class="menuButton"><g:link class="list" action="list">User List</g:link></span>
	</div>

	<div class="body">
		<h1>Create User</h1>
		<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
		</g:if>
		<g:hasErrors bean="${userInstance}">
		<div class="errors">
			<g:renderErrors bean="${userInstance}" as="list" />
		</div>
		</g:hasErrors>
		<g:form action="save">
			<div class="dialog">
				<table>
				<tbody>

					<tr class="prop">
						<td valign="top" class="name"><label for="username">Login Name:</label></td>
						<td valign="top" class="value ${hasErrors(bean:userInstance,field:'username','errors')}">
							<input type="text" id="username" name="username" value="${userInstance.username?.encodeAsHTML()}"/>
						</td>
					</tr>

					<tr class="prop">
						<td valign="top" class="name"><label for="userRealName">Full Name:</label></td>
						<td valign="top" class="value ${hasErrors(bean:userInstance,field:'userRealName','errors')}">
							<input type="text" id="userRealName" name="userRealName" value="${userInstance.userRealName?.encodeAsHTML()}"/>
						</td>
					</tr>

					<tr class="prop">
						<td valign="top" class="name"><label for="passwd">Password:</label></td>
						<td valign="top" class="value ${hasErrors(bean:userInstance,field:'passwd','errors')}">
							<input type="password" id="passwd" name="passwd" value="${userInstance.passwd?.encodeAsHTML()}"/>
						</td>
					</tr>

					<tr class="prop">
						<td valign="top" class="name"><label for="enabled">Enabled:</label></td>
						<td valign="top" class="value ${hasErrors(bean:userInstance,field:'enabled','errors')}">
							<g:checkBox name="enabled" value="${userInstance.enabled}" ></g:checkBox>
						</td>
					</tr>

					<tr class="prop">
						<td valign="top" class="name"><label for="description">Description:</label></td>
						<td valign="top" class="value ${hasErrors(bean:userInstance,field:'description','errors')}">
							<input type="text" id="description" name="description" value="${userInstance.description?.encodeAsHTML()}"/>
						</td>
					</tr>

					<tr class="prop">
						<td valign="top" class="name"><label for="email">Email:</label></td>
						<td valign="top" class="value ${hasErrors(bean:userInstance,field:'email','errors')}">
							<input type="text" id="email" name="email" value="${userInstance.email?.encodeAsHTML()}"/>
						</td>
					</tr>

					<tr class="prop">
						<td valign="top" class="name"><label for="emailShow">Show Email:</label></td>
						<td valign="top" class="value ${hasErrors(bean:userInstance,field:'emailShow','errors')}">
							<g:checkBox name="emailShow" value="${userInstance.emailShow}"/>
						</td>
					</tr>

                    <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="position">Position:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:userInstance,field:'position','errors')}">
                                    <g:select optionKey="id" from="${com.egsgroup.leavemanager.model.Position.list()}" name="position.id" value="${userInstance?.position?.id}" ></g:select>
                                </td>
                    </tr>

                     <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="position">Manages:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:userInstance,field:'managing','errors')}">
                                    <g:select optionKey="id" from="${com.egsgroup.leavemanager.model.User.list()}" name="managingId" value="${userInstance*.id}" multiple="multiple"></g:select>
                                </td>
                    </tr>

					<tr class="prop">
						<td valign="top" class="name" align="left">Assign Roles:</td>
					</tr>

					<tr class="prop">
                      <g:each in="${authorityList}">
						<td valign="top" class="name" align="left">${it.authority.encodeAsHTML()}</td>
						<td align="left"><g:checkBox name="${it.authority}"/></td>
                      </g:each>
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
