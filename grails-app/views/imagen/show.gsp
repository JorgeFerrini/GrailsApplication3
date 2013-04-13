
<%@ page import="grailsapplication3.Imagen" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'imagen.label', default: 'Imagen')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-imagen" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-imagen" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list imagen">
			
				<g:if test="${imagenInstance?.alto}">
				<li class="fieldcontain">
					<span id="alto-label" class="property-label"><g:message code="imagen.alto.label" default="Alto" /></span>
					
						<span class="property-value" aria-labelledby="alto-label"><g:fieldValue bean="${imagenInstance}" field="alto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${imagenInstance?.ancho}">
				<li class="fieldcontain">
					<span id="ancho-label" class="property-label"><g:message code="imagen.ancho.label" default="Ancho" /></span>
					
						<span class="property-value" aria-labelledby="ancho-label"><g:fieldValue bean="${imagenInstance}" field="ancho"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${imagenInstance?.directorioImagen}">
				<li class="fieldcontain">
					<span id="directorioImagen-label" class="property-label"><g:message code="imagen.directorioImagen.label" default="Directorio Imagen" /></span>
					
						<span class="property-value" aria-labelledby="directorioImagen-label"><g:fieldValue bean="${imagenInstance}" field="directorioImagen"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${imagenInstance?.producto}">
				<li class="fieldcontain">
					<span id="producto-label" class="property-label"><g:message code="imagen.producto.label" default="Producto" /></span>
					
						<span class="property-value" aria-labelledby="producto-label"><g:link controller="productos" action="show" id="${imagenInstance?.producto?.id}">${imagenInstance?.producto?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${imagenInstance?.rutaImagen}">
				<li class="fieldcontain">
					<span id="rutaImagen-label" class="property-label"><g:message code="imagen.rutaImagen.label" default="Ruta Imagen" /></span>
					
						<span class="property-value" aria-labelledby="rutaImagen-label"><g:fieldValue bean="${imagenInstance}" field="rutaImagen"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${imagenInstance?.id}" />
					<g:link class="edit" action="edit" id="${imagenInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
