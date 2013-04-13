
<%@ page import="grailsapplication3.Lugar" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'lugar.label', default: 'Lugar')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-lugar" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-lugar" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list lugar">
			
				<g:if test="${lugarInstance?.lugar}">
				<li class="fieldcontain">
					<span id="lugar-label" class="property-label"><g:message code="lugar.lugar.label" default="Lugar" /></span>
					
						<span class="property-value" aria-labelledby="lugar-label"><g:link controller="lugar" action="show" id="${lugarInstance?.lugar?.id}">${lugarInstance?.lugar?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${lugarInstance?.tipoLugar}">
				<li class="fieldcontain">
					<span id="tipoLugar-label" class="property-label"><g:message code="lugar.tipoLugar.label" default="Tipo Lugar" /></span>
					
						<span class="property-value" aria-labelledby="tipoLugar-label"><g:fieldValue bean="${lugarInstance}" field="tipoLugar"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lugarInstance?.lugares}">
				<li class="fieldcontain">
					<span id="lugares-label" class="property-label"><g:message code="lugar.lugares.label" default="Lugares" /></span>
					
						<g:each in="${lugarInstance.lugares}" var="l">
						<span class="property-value" aria-labelledby="lugares-label"><g:link controller="lugar" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${lugarInstance?.nombreLugar}">
				<li class="fieldcontain">
					<span id="nombreLugar-label" class="property-label"><g:message code="lugar.nombreLugar.label" default="Nombre Lugar" /></span>
					
						<span class="property-value" aria-labelledby="nombreLugar-label"><g:fieldValue bean="${lugarInstance}" field="nombreLugar"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lugarInstance?.usuarios}">
				<li class="fieldcontain">
					<span id="usuarios-label" class="property-label"><g:message code="lugar.usuarios.label" default="Usuarios" /></span>
					
						<g:each in="${lugarInstance.usuarios}" var="u">
						<span class="property-value" aria-labelledby="usuarios-label"><g:link controller="usuario" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${lugarInstance?.id}" />
					<g:link class="edit" action="edit" id="${lugarInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
