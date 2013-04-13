
<%@ page import="grailsapplication3.Detalle" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'detalle.label', default: 'Detalle')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-detalle" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-detalle" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="total" title="${message(code: 'detalle.total.label', default: 'Total')}" />
					
						<g:sortableColumn property="cantidad" title="${message(code: 'detalle.cantidad.label', default: 'Cantidad')}" />
					
						<th><g:message code="detalle.compra.label" default="Compra" /></th>
					
						<th><g:message code="detalle.productos.label" default="Productos" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${detalleInstanceList}" status="i" var="detalleInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${detalleInstance.id}">${fieldValue(bean: detalleInstance, field: "total")}</g:link></td>
					
						<td>${fieldValue(bean: detalleInstance, field: "cantidad")}</td>
					
						<td>${fieldValue(bean: detalleInstance, field: "compra")}</td>
					
						<td>${fieldValue(bean: detalleInstance, field: "productos")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${detalleInstanceTotal}" />
			</div>
		</div>
	</body>
</html>