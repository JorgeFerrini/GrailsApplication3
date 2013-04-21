
<%@ page import="grailsapplication3.Carrito" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'carrito.label', default: 'Carrito')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-carrito" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-carrito" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list carrito">
			
				<g:if test="${carritoInstance?.idProductos}">
				<li class="fieldcontain">
					<span id="idProductos-label" class="property-label"><g:message code="carrito.idProductos.label" default="Id Productos" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${carritoInstance?.nombreProductos}">
				<li class="fieldcontain">
					<span id="nombreProductos-label" class="property-label"><g:message code="carrito.nombreProductos.label" default="Nombre Productos" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${carritoInstance?.numeroProductos}">
				<li class="fieldcontain">
					<span id="numeroProductos-label" class="property-label"><g:message code="carrito.numeroProductos.label" default="Numero Productos" /></span>
					
						<span class="property-value" aria-labelledby="numeroProductos-label"><g:fieldValue bean="${carritoInstance}" field="numeroProductos"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carritoInstance?.precioProductos}">
				<li class="fieldcontain">
					<span id="precioProductos-label" class="property-label"><g:message code="carrito.precioProductos.label" default="Precio Productos" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${carritoInstance?.id}" />
					<g:link class="edit" action="edit" id="${carritoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
