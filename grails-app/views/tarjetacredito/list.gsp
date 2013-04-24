
<%@ page import="grailsapplication3.Tarjetacredito" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tarjetacredito.label', default: 'Tarjetacredito')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-tarjetacredito" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create">Agregar Tarjeta</g:link></li>
                                <li><g:link controller="categoria" action="list">Categorias</g:link></li>
				<li><g:link controller="productos" action="list">Productos</g:link></li>
			</ul>
		</div>
		<div id="list-tarjetacredito" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="numero" title="${message(code: 'tarjetacredito.numero.label', default: 'Numero')}" />
					
						<g:sortableColumn property="codigoSeguridad" title="${message(code: 'tarjetacredito.codigoSeguridad.label', default: 'Codigo Seguridad')}" />
					
						<g:sortableColumn property="marcaComercial" title="${message(code: 'tarjetacredito.marcaComercial.label', default: 'Marca Comercial')}" />
					
						<g:sortableColumn property="fechaVencimiento" title="${message(code: 'tarjetacredito.fechaVencimiento.label', default: 'Fecha Vencimiento')}" />
					
						<th><g:message code="tarjetacredito.usuario.label" default="Eliminar" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tarjetacreditoInstanceList}" status="i" var="tarjetacreditoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tarjetacreditoInstance.id}">${fieldValue(bean: tarjetacreditoInstance, field: "numero")}</g:link></td>
					
						<td>${fieldValue(bean: tarjetacreditoInstance, field: "codigoSeguridad")}</td>
					
						<td>${fieldValue(bean: tarjetacreditoInstance, field: "marcaComercial")}</td>
					
						<td><g:formatDate date="${tarjetacreditoInstance.fechaVencimiento}" /></td>
					
                                                <td><g:form>
                                                
                                                    <g:hiddenField name="id" value="${tarjetacreditoInstance.id}" />
                                                    <g:link class="edit" action="edit" id="${tarjetacreditoInstance.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                                                    <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				
                                                </g:form></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${tarjetacreditoInstanceTotal}" />
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
