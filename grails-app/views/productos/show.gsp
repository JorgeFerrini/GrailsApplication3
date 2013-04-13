
<%@ page import="grailsapplication3.Productos" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'productos.label', default: 'Productos')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-productos" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-productos" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list productos">
			
				<g:if test="${productosInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="productos.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${productosInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productosInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="productos.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${productosInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productosInstance?.archivo}">
				<li class="fieldcontain">
					<span id="archivo-label" class="property-label"><g:message code="productos.archivo.label" default="Archivo" /></span>
					
						<span class="property-value" aria-labelledby="archivo-label"><g:fieldValue bean="${productosInstance}" field="archivo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productosInstance?.calificaciones}">
				<li class="fieldcontain">
					<span id="calificaciones-label" class="property-label"><g:message code="productos.calificaciones.label" default="Calificaciones" /></span>
					
						<g:each in="${productosInstance.calificaciones}" var="c">
						<span class="property-value" aria-labelledby="calificaciones-label"><g:link controller="calificacion" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${productosInstance?.categoria}">
				<li class="fieldcontain">
					<span id="categoria-label" class="property-label"><g:message code="productos.categoria.label" default="Categoria" /></span>
					
						<span class="property-value" aria-labelledby="categoria-label"><g:link controller="categoria" action="show" id="${productosInstance?.categoria?.id}">${productosInstance?.categoria?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${productosInstance?.detalles}">
				<li class="fieldcontain">
					<span id="detalles-label" class="property-label"><g:message code="productos.detalles.label" default="Detalles" /></span>
					
						<g:each in="${productosInstance.detalles}" var="d">
						<span class="property-value" aria-labelledby="detalles-label"><g:link controller="detalle" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${productosInstance?.directorio}">
				<li class="fieldcontain">
					<span id="directorio-label" class="property-label"><g:message code="productos.directorio.label" default="Directorio" /></span>
					
						<span class="property-value" aria-labelledby="directorio-label"><g:fieldValue bean="${productosInstance}" field="directorio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productosInstance?.imagenes}">
				<li class="fieldcontain">
					<span id="imagenes-label" class="property-label"><g:message code="productos.imagenes.label" default="Imagenes" /></span>
					
						<g:each in="${productosInstance.imagenes}" var="i">
						<span class="property-value" aria-labelledby="imagenes-label"><g:link controller="imagen" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${productosInstance?.precio}">
				<li class="fieldcontain">
					<span id="precio-label" class="property-label"><g:message code="productos.precio.label" default="Precio" /></span>
					
						<span class="property-value" aria-labelledby="precio-label"><g:fieldValue bean="${productosInstance}" field="precio"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${productosInstance?.id}" />
					<g:link class="edit" action="edit" id="${productosInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
