
<%@ page import="grailsapplication3.Compra" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'compra.label', default: 'Compra')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-compra" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-compra" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="status" title="${message(code: 'compra.status.label', default: 'Status')}" />
					
						<g:sortableColumn property="fechaEntrega" title="${message(code: 'compra.fechaEntrega.label', default: 'Fecha Entrega')}" />
					
						<g:sortableColumn property="fechaCompra" title="${message(code: 'compra.fechaCompra.label', default: 'Fecha Compra')}" />
					
						<th><g:message code="compra.tarjeta.label" default="Tarjeta" /></th>
					
						<th><g:message code="compra.usuario.label" default="Usuario" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${compraInstanceList}" status="i" var="compraInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${compraInstance.id}">${fieldValue(bean: compraInstance, field: "status")}</g:link></td>
					
						<td><g:formatDate date="${compraInstance.fechaEntrega}" /></td>
					
						<td><g:formatDate date="${compraInstance.fechaCompra}" /></td>
					
						<td>${fieldValue(bean: compraInstance, field: "tarjeta")}</td>
					
						<td>${fieldValue(bean: compraInstance, field: "usuario")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${compraInstanceTotal}" />
			</div>
		</div>
	</body>
</html>