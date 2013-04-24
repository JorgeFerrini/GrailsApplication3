<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="grailsapplication3.Productos" %>

<html>
  <head>
    <meta name="layout" content="main">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <g:set var="entityName" value="${message(code: 'productos.label', default: 'Productos')}" />
    
  </head>
  <body>
                    <div class="nav" role="navigation">
			<ul>
                                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link controller="usuario">Registrarse</g:link></li>
                                <li><g:link controller="categoria" action="list">Categorias</g:link></li>
				<li><g:link controller="productos" action="list">Productos</g:link></li>
				
			</ul>
		</div> 
    
    <div id="showFiltering-productos" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'productos.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'productos.descripcion.label', default: 'Descripcion')}" />
					
                                                <th>Imagenes</th>
					
						<th><g:message code="productos.categoria.label" default="Categoria" /></th>
					
						
					
						<g:sortableColumn property="precio" title="${message(code: 'productos.precio.label', default: 'Precio')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${productosInstanceList}" status="i" var="productosInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${productosInstance.id}">${fieldValue(bean: productosInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: productosInstance, field: "descripcion")}</td>
					
						<td><g:link controller="productos" action="show" id="${productosInstance.id}"><img src="<g:createLinkTo dir="${productosInstance.directorio}" file="${productosInstance.archivo}" /> " width="75" height="75"  /> </g:link></td>
					
						<td>${productosInstance.categoria.nombre}</td>
					
						
					
						<td>${fieldValue(bean: productosInstance, field: "precio")}</td>
					
					</tr>
				</g:each>
                                
				</tbody>
			</table>
			
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
