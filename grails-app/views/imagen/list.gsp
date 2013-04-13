
<%@ page import="grailsapplication3.Imagen" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'imagen.label', default: 'Imagen')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-imagen" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-imagen" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="alto" title="${message(code: 'imagen.alto.label', default: 'Alto')}" />
					
						<g:sortableColumn property="ancho" title="${message(code: 'imagen.ancho.label', default: 'Ancho')}" />
					
						<g:sortableColumn property="directorioImagen" title="${message(code: 'imagen.directorioImagen.label', default: 'Directorio Imagen')}" />
					
						<th><g:message code="imagen.producto.label" default="Producto" /></th>
					
						<g:sortableColumn property="rutaImagen" title="${message(code: 'imagen.rutaImagen.label', default: 'Ruta Imagen')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${imagenInstanceList}" status="i" var="imagenInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${imagenInstance.id}">${fieldValue(bean: imagenInstance, field: "alto")}</g:link></td>
					
						<td>${fieldValue(bean: imagenInstance, field: "ancho")}</td>
					
						<td>${fieldValue(bean: imagenInstance, field: "directorioImagen")}</td>
					
						<td>${fieldValue(bean: imagenInstance, field: "producto")}</td>
					
						<td>${fieldValue(bean: imagenInstance, field: "rutaImagen")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${imagenInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
