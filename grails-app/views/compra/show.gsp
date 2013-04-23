
<%@ page import="grailsapplication3.Compra" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'compra.label', default: 'Compra')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-compra" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-compra" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list compra">
			
				<g:if test="${compraInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="compra.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${compraInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${compraInstance?.fechaEntrega}">
				<li class="fieldcontain">
					<span id="fechaEntrega-label" class="property-label"><g:message code="compra.fechaEntrega.label" default="Fecha Entrega" /></span>
					
						<span class="property-value" aria-labelledby="fechaEntrega-label"><g:formatDate date="${compraInstance?.fechaEntrega}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${compraInstance?.detalles}">
				<li class="fieldcontain">
					<span id="detalles-label" class="property-label"><g:message code="compra.detalles.label" default="Calificar y Comentar" /></span>
					
						<g:each in="${compraInstance.detalles}" var="d">
						<span class="property-value" aria-labelledby="detalles-label"><g:link controller="calificacion" action="create" id="${d.productos.id}">${d?.productos.nombre}     Cantidad: ${d?.cantidad}    Precio Unidad: ${d?.productos.precio}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${compraInstance?.fechaCompra}">
				<li class="fieldcontain">
					<span id="fechaCompra-label" class="property-label"><g:message code="compra.fechaCompra.label" default="Fecha Compra" /></span>
					
						<span class="property-value" aria-labelledby="fechaCompra-label"><g:formatDate date="${compraInstance?.fechaCompra}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${compraInstance?.tarjeta}">
				<li class="fieldcontain">
					<span id="tarjeta-label" class="property-label"><g:message code="compra.tarjeta.label" default="Tarjeta" /></span>
					
						<span class="property-value" aria-labelledby="tarjeta-label"><g:link controller="tarjetacredito" action="show" id="${compraInstance?.tarjeta?.id}">${compraInstance?.tarjeta?.numero}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
		</div>
	</body>
</html>
