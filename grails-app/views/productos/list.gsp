
<%@ page import="grailsapplication3.Productos" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'productos.label', default: 'Productos')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-productos" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-productos" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'productos.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'productos.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="archivo" title="${message(code: 'productos.archivo.label', default: 'Archivo')}" />
					
						<th><g:message code="productos.categoria.label" default="Categoria" /></th>
					
						<g:sortableColumn property="directorio" title="${message(code: 'productos.directorio.label', default: 'Directorio')}" />
					
						<g:sortableColumn property="precio" title="${message(code: 'productos.precio.label', default: 'Precio')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${productosInstanceList}" status="i" var="productosInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${productosInstance.id}">${fieldValue(bean: productosInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: productosInstance, field: "descripcion")}</td>
					
						<td>${fieldValue(bean: productosInstance, field: "archivo")}</td>
					
						<td>${fieldValue(bean: productosInstance, field: "categoria")}</td>
					
						<td>${fieldValue(bean: productosInstance, field: "directorio")}</td>
					
						<td>${fieldValue(bean: productosInstance, field: "precio")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${productosInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
