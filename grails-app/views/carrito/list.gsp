
<%@ page import="grailsapplication3.Carrito" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'carrito.label', default: 'Carrito')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-carrito" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-carrito" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="idProductos" title="${message(code: 'carrito.idProductos.label', default: 'Id Productos')}" />
					
						<g:sortableColumn property="nombreProductos" title="${message(code: 'carrito.nombreProductos.label', default: 'Nombre Productos')}" />
					
						<g:sortableColumn property="numeroProductos" title="${message(code: 'carrito.numeroProductos.label', default: 'Numero Productos')}" />
					
						<g:sortableColumn property="precioProductos" title="${message(code: 'carrito.precioProductos.label', default: 'Precio Productos')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${carritoInstanceList}" status="i" var="carritoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${carritoInstance.id}">${fieldValue(bean: carritoInstance, field: "idProductos")}</g:link></td>
					
						<td>${fieldValue(bean: carritoInstance, field: "nombreProductos")}</td>
					
						<td>${fieldValue(bean: carritoInstance, field: "numeroProductos")}</td>
					
						<td>${fieldValue(bean: carritoInstance, field: "precioProductos")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${carritoInstanceTotal}" />
			</div>
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
