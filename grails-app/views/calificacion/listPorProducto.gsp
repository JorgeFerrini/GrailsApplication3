
<%@ page import="grailsapplication3.Calificacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'calificacion.label', default: 'Calificacion')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-calificacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				
			</ul>
		</div>
		<div id="list-calificacion" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="comentario" title="${message(code: 'calificacion.comentario.label', default: 'Comentario')}" />
					
						<g:sortableColumn property="fechaCalificacion" title="${message(code: 'calificacion.fechaCalificacion.label', default: 'Fecha Calificacion')}" />
					
						<th><g:message code="calificacion.producto.label" default="Producto" /></th>
									
						<g:sortableColumn property="valorCalificacion" title="${message(code: 'calificacion.valorCalificacion.label', default: 'Valor Calificacion')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${calificacionInstanceList}" status="i" var="calificacionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: calificacionInstance, field: "comentario")}</td>
					
						<td><g:formatDate date="${calificacionInstance.fechaCalificacion}" /></td>
					
						<td>${calificacionInstance.producto.nombre}</td>
															
						<td>${fieldValue(bean: calificacionInstance, field: "valorCalificacion")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${calificacionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
