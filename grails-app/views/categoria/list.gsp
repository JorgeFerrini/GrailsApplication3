
<%@ page import="grailsapplication3.Categoria" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'categoria.label', default: 'Categoria')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-categoria" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-categoria" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'categoria.nombre.label', default: 'Nombre')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${categoriaInstanceList}" status="i" var="categoriaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${categoriaInstance.id}">${fieldValue(bean: categoriaInstance, field: "nombre")}</g:link></td>                                                
                                                
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${categoriaInstanceTotal}" />
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
