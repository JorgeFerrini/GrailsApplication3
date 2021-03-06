
<%@ page import="grailsapplication3.Calificacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'calificacion.label', default: 'Calificacion')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-calificacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link controller="categoria" action="list">Categorias</g:link></li>
				<li><g:link controller="productos" action="list">Productos</g:link></li>
			</ul>
		</div>
		<div id="show-calificacion" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list calificacion">
			
				<g:if test="${calificacionInstance?.comentario}">
				<li class="fieldcontain">
					<span id="comentario-label" class="property-label"><g:message code="calificacion.comentario.label" default="Comentario" /></span>
					
						<span class="property-value" aria-labelledby="comentario-label"><g:fieldValue bean="${calificacionInstance}" field="comentario"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${calificacionInstance?.fechaCalificacion}">
				<li class="fieldcontain">
					<span id="fechaCalificacion-label" class="property-label"><g:message code="calificacion.fechaCalificacion.label" default="Fecha Calificacion" /></span>
					
						<span class="property-value" aria-labelledby="fechaCalificacion-label"><g:formatDate date="${calificacionInstance?.fechaCalificacion}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${calificacionInstance?.producto}">
				<li class="fieldcontain">
					<span id="producto-label" class="property-label"><g:message code="calificacion.producto.label" default="Producto" /></span>
					
						<span class="property-value" aria-labelledby="producto-label"><g:link controller="productos" action="show" id="${calificacionInstance?.producto?.id}">${calificacionInstance?.producto?.nombre}</g:link></span>
					
				</li>
				</g:if>	
			
				<g:if test="${calificacionInstance?.valorCalificacion}">
				<li class="fieldcontain">
					<span id="valorCalificacion-label" class="property-label"><g:message code="calificacion.valorCalificacion.label" default="Valor Calificacion" /></span>
					
						<span class="property-value" aria-labelledby="valorCalificacion-label"><g:fieldValue bean="${calificacionInstance}" field="valorCalificacion"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${calificacionInstance?.id}" />
					
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
