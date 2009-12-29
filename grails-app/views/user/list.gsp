<head>
	<meta name="layout" content="main" />
	<title>User List</title>
</head>

<body>

	<div class="nav">
		<span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
		<span class="menuButton"><g:link class="create" action="create">New User</g:link></span>
	</div>

	<div class="body">
		<h1>User List</h1>
		<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
		</g:if>
		<div class="list">
			<table>
			<thead>
				<tr>
					<g:sortableColumn property="id" title="Id" />
					<g:sortableColumn property="username" title="Login Name" />
					<g:sortableColumn property="userRealName" title="Full Name" />
					<g:sortableColumn property="enabled" title="Enabled" />
					<g:sortableColumn property="description" title="Description" />
					<th>&nbsp;</th>
				</tr>
			</thead>
			<tbody>
			<g:each in="${userInstanceList}" status="i" var="userInstance">
				<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
					<td>${userInstance.id}</td>
					<td>${userInstance.username?.encodeAsHTML()}</td>
					<td>${userInstance.userRealName?.encodeAsHTML()}</td>
					<td>${userInstance.enabled?.encodeAsHTML()}</td>
					<td>${userInstance.description?.encodeAsHTML()}</td>
					<td class="actionButtons">
						<span class="actionButton">
							<g:link action="show" id="${userInstance.id}">Show</g:link>
						</span>
					</td>
				</tr>
			</g:each>
			</tbody>
			</table>
		</div>

		<div class="paginateButtons">
			<g:paginate total="${com.egsgroup.leavemanager.model.User.count()}" />
		</div>

	</div>
</body>
