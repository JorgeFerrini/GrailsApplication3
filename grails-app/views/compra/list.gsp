
<%@ page import="grailsapplication3.Compra" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'compra.label', default: 'Compra')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-compra" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link controller="categoria" action="list">Categorias</g:link></li>
				<li><g:link controller="productos" action="list">Productos</g:link></li>
			</ul>
		</div>
		<div id="list-compra" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="status" title="${message(code: 'compra.status.label', default: 'Status')}" />
					
						<g:sortableColumn property="fechaEntrega" title="${message(code: 'compra.fechaEntrega.label', default: 'Fecha Entrega')}" />
					
						<g:sortableColumn property="fechaCompra" title="${message(code: 'compra.fechaCompra.label', default: 'Fecha Compra')}" />
					
						<th><g:message code="compra.tarjeta.label" default="Tarjeta" /></th>
					
						<th>Archivo PDF</th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${compraInstanceList}" status="i" var="compraInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${compraInstance.id}">${fieldValue(bean: compraInstance, field: "status")}</g:link></td>
					
						<td><g:formatDate date="${compraInstance.fechaEntrega}" /></td>
					
						<td><g:formatDate date="${compraInstance.fechaCompra}" /></td>
					
						<td>${compraInstance.tarjeta.numero}</td>
					
                                                <td><a href="<g:createLinkTo dir="/WEB-INF" file="document${compraInstance.id}.pdf" /> " ><img src="<g:createLinkTo dir="/images" file="LOGO_PDF.png" /> " /></a></td>
                                                
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${compraInstanceTotal}" />
			</div>
		</div>
                
                <g:if test="${session.Usuario}">
                  Login as: ${session.Usuario.nombreUser} | <g:link controller="Usuario" action="logOut">Logout</g:link> | <g:link controller="Usuario" action="show" id="${session.Usuario.id}">Mi perfil</g:link> | <g:link controller="Productos" action="showCarrito">Mi Carrito</g:link>
                  carrito:  ${session.Carrito.numeroProductos}
                  
                       <g:form controller="Productos" action="addToCarrito">
                                <g:hiddenField name="id" value="${productosInstance?.id}" />
                                <g:hiddenField name="nombre" value="${productosInstance?.nombre}" />
                                <g:hiddenField name="precio" value="${productosInstance?.precio}" />
                                
                                <g:select id="cantidad" name="cantidad" from="${2..9}" class="many-to-one" noSelection="['1': '1']"/>
                                                        
				<fieldset class="buttons">
					<g:submitButton name="addToCarrito" class="Productos" value="Buscar" />
				</fieldset>
			</g:form>    

                </g:if>
                <g:else>                   
                  
                  No hay usuario en este momento
                      <g:form controller="usuario" action="login" style="padding-left:200px"> 
                          <div id="janrainEngageEmbed" controller="Usuario" ></div>
                      </g:form>                      
                </g:else>        
        
        
	</body>
</html>
