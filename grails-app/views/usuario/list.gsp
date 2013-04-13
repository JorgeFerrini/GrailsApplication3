
<%@ page import="grailsapplication3.Usuario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-usuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-usuario" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nombreUser" title="${message(code: 'usuario.nombreUser.label', default: 'Nombre User')}" />
					
						<g:sortableColumn property="apellidoUser" title="${message(code: 'usuario.apellidoUser.label', default: 'Apellido User')}" />
					
						<g:sortableColumn property="identificadorUser" title="${message(code: 'usuario.identificadorUser.label', default: 'Identificador User')}" />
					
						<g:sortableColumn property="tipoIdUser" title="${message(code: 'usuario.tipoIdUser.label', default: 'Tipo Id User')}" />
					
						<g:sortableColumn property="emailUser" title="${message(code: 'usuario.emailUser.label', default: 'Email User')}" />
					
						<g:sortableColumn property="activacionUser" title="${message(code: 'usuario.activacionUser.label', default: 'Activacion User')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${usuarioInstanceList}" status="i" var="usuarioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${usuarioInstance.id}">${fieldValue(bean: usuarioInstance, field: "nombreUser")}</g:link></td>
					
						<td>${fieldValue(bean: usuarioInstance, field: "apellidoUser")}</td>
					
						<td>${fieldValue(bean: usuarioInstance, field: "identificadorUser")}</td>
					
						<td>${fieldValue(bean: usuarioInstance, field: "tipoIdUser")}</td>
					
						<td>${fieldValue(bean: usuarioInstance, field: "emailUser")}</td>
					
						<td>${fieldValue(bean: usuarioInstance, field: "activacionUser")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${usuarioInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
