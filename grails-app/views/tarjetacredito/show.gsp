
<%@ page import="grailsapplication3.Tarjetacredito" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tarjetacredito.label', default: 'Tarjetacredito')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-tarjetacredito" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list">Tarjetas</g:link></li>
				<li><g:link class="create" action="create">Agregar Tarjeta</g:link></li>
                                <li><g:link controller="categoria" action="list">Categorias</g:link></li>
				<li><g:link controller="productos" action="list">Productos</g:link></li>
			</ul>
		</div>
		<div id="show-tarjetacredito" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list tarjetacredito">
			
				<g:if test="${tarjetacreditoInstance?.numero}">
				<li class="fieldcontain">
					<span id="numero-label" class="property-label"><g:message code="tarjetacredito.numero.label" default="Numero" /></span>
					
						<span class="property-value" aria-labelledby="numero-label"><g:fieldValue bean="${tarjetacreditoInstance}" field="numero"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tarjetacreditoInstance?.codigoSeguridad}">
				<li class="fieldcontain">
					<span id="codigoSeguridad-label" class="property-label"><g:message code="tarjetacredito.codigoSeguridad.label" default="Codigo Seguridad" /></span>
					
						<span class="property-value" aria-labelledby="codigoSeguridad-label"><g:fieldValue bean="${tarjetacreditoInstance}" field="codigoSeguridad"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tarjetacreditoInstance?.marcaComercial}">
				<li class="fieldcontain">
					<span id="marcaComercial-label" class="property-label"><g:message code="tarjetacredito.marcaComercial.label" default="Marca Comercial" /></span>
					
						<span class="property-value" aria-labelledby="marcaComercial-label"><g:fieldValue bean="${tarjetacreditoInstance}" field="marcaComercial"/></span>
					
				</li>
				</g:if>
			

			
				<g:if test="${tarjetacreditoInstance?.fechaVencimiento}">
				<li class="fieldcontain">
					<span id="fechaVencimiento-label" class="property-label"><g:message code="tarjetacredito.fechaVencimiento.label" default="Fecha Vencimiento" /></span>
					
						<span class="property-value" aria-labelledby="fechaVencimiento-label"><g:formatDate date="${tarjetacreditoInstance?.fechaVencimiento}" /></span>
					
				</li>
				</g:if>
						
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${tarjetacreditoInstance?.id}" />
					<g:link class="edit" action="edit" id="${tarjetacreditoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
                                                    <g:if test="${session.Usuario}">
                  Login as: ${session.Usuario.nombreUser} | <g:link controller="Usuario" action="logOut">Logout</g:link> | <g:link controller="Usuario" action="show" id="${session.Usuario.id}">Mi perfil</g:link> | <g:link controller="Compra" action="list">Mis Compras</g:link> | <g:link controller="Tarjetacredito" action="list" max="5">Mis Tarjetas</g:link> | <g:link controller="Calificacion" action="listPorUsuario">Mis Calificaciones</g:link> | <g:link controller="Productos" action="showCarrito">Carrito:  (${session.Carrito.numeroProductos}) Productos</g:link>        
                        
                  
                </g:if>
                <g:else>                   
                  
                  No hay usuario en este momento
                      <g:form controller="usuario" action="login" style="padding-left:200px"> 
                          
                        <div id="janrainEngageEmbed" controller="Usuario" ></div>
                      </g:form>
                      
                </g:else>
	</body>
</html>
