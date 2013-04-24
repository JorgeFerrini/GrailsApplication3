
<%@ page import="grailsapplication3.Usuario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-usuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link controller="categoria" action="list">Categorias</g:link></li>
				<li><g:link controller="productos" action="list">Productos</g:link></li>                                
                                
			</ul>
		</div>
		<div id="show-usuario" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list usuario">
			
				<g:if test="${usuarioInstance?.nombreUser}">
				<li class="fieldcontain">
					<span id="nombreUser-label" class="property-label"><g:message code="usuario.nombreUser.label" default="Nombre User" /></span>
					
						<span class="property-value" aria-labelledby="nombreUser-label"><g:fieldValue bean="${usuarioInstance}" field="nombreUser"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.apellidoUser}">
				<li class="fieldcontain">
					<span id="apellidoUser-label" class="property-label"><g:message code="usuario.apellidoUser.label" default="Apellido User" /></span>
					
						<span class="property-value" aria-labelledby="apellidoUser-label"><g:fieldValue bean="${usuarioInstance}" field="apellidoUser"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.identificadorUser}">
				<li class="fieldcontain">
					<span id="identificadorUser-label" class="property-label"><g:message code="usuario.identificadorUser.label" default="Identificador User" /></span>
					
						<span class="property-value" aria-labelledby="identificadorUser-label"><g:fieldValue bean="${usuarioInstance}" field="identificadorUser"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.tipoIdUser}">
				<li class="fieldcontain">
					<span id="tipoIdUser-label" class="property-label"><g:message code="usuario.tipoIdUser.label" default="Tipo Id User" /></span>
					
						<span class="property-value" aria-labelledby="tipoIdUser-label"><g:fieldValue bean="${usuarioInstance}" field="tipoIdUser"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.emailUser}">
				<li class="fieldcontain">
					<span id="emailUser-label" class="property-label"><g:message code="usuario.emailUser.label" default="Email User" /></span>
					
						<span class="property-value" aria-labelledby="emailUser-label"><g:fieldValue bean="${usuarioInstance}" field="emailUser"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.activacionUser}">
				<li class="fieldcontain">
					<span id="activacionUser-label" class="property-label"><g:message code="usuario.activacionUser.label" default="Activacion User" /></span>
					
						<span class="property-value" aria-labelledby="activacionUser-label"><g:fieldValue bean="${usuarioInstance}" field="activacionUser"/></span>
					
				</li>
				</g:if>
			


			
				<g:if test="${usuarioInstance?.fechaNacimientoUser}">
				<li class="fieldcontain">
					<span id="fechaNacimientoUser-label" class="property-label"><g:message code="usuario.fechaNacimientoUser.label" default="Fecha Nacimiento User" /></span>
					
						<span class="property-value" aria-labelledby="fechaNacimientoUser-label"><g:formatDate date="${usuarioInstance?.fechaNacimientoUser}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.fechaRegistroUser}">
				<li class="fieldcontain">
					<span id="fechaRegistroUser-label" class="property-label"><g:message code="usuario.fechaRegistroUser.label" default="Fecha Registro User" /></span>
					
						<span class="property-value" aria-labelledby="fechaRegistroUser-label"><g:formatDate date="${usuarioInstance?.fechaRegistroUser}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.lugares}">
				<li class="fieldcontain">
					<span id="lugares-label" class="property-label"><g:message code="usuario.lugares.label" default="Lugares" /></span>
					
						<g:each in="${usuarioInstance.lugares}" var="l">
						<span class="property-value" aria-labelledby="lugares-label"><g:link controller="lugar" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>

			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${usuarioInstance?.id}" />
					<g:link class="edit" action="edit" id="${usuarioInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
