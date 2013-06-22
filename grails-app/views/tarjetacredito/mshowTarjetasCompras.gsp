
<%@ page import="grailsapplication3.Tarjetacredito" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1"> 
                  <link rel="stylesheet" href="http://code.jquery.com/mobile/1.0.1/jquery.mobile-1.0.1.min.css" />
                  <script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
                  <script src="http://code.jquery.com/mobile/1.0.1/jquery.mobile-1.0.1.min.js"></script>
		<g:set var="entityName" value="${message(code: 'tarjetacredito.label', default: 'Tarjetacredito')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
          <div data-role="header" data-position="fixed">
            <h1>Le Cloud Products</h1>
          </div>
        <g:link data-role="button" data-theme="a" data-inline="true" controller="categoria" action="mlist">Categorias</g:link>
		<!--<a href="#list-tarjetacredito" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>-->
		<div id="list-tarjetacredito" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="tarjetacredito.numero.label" default="Numero" /></th>
					
						<th><g:message code= "tarjetacredito.codigoSeguridad.label" default= "Codigo Seguridad" /></th>
					
						<th><g:message code= "tarjetacredito.marcaComercial.label" default= "Marca Comercial" /></th>
					
						<th><g:message code= "tarjetacredito.fechaVencimiento.label" default= "Fecha Vencimiento" /></th>
					
						<th><g:message code="tarjetacredito.usuario.label" default="Comprar" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tarjetacreditoInstanceList}" status="i" var="tarjetacreditoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: tarjetacreditoInstance, field: "numero")}</td>
					
						<td>${fieldValue(bean: tarjetacreditoInstance, field: "codigoSeguridad")}</td>
					
						<td>${fieldValue(bean: tarjetacreditoInstance, field: "marcaComercial")}</td>
					
						<td><g:formatDate date="${tarjetacreditoInstance.fechaVencimiento}" /></td>
					
                                                <td><g:form controller="compra" action="mguardarCompra">
                                                
                                                    <g:hiddenField name="id" value="${tarjetacreditoInstance.id}" />                                                    
                                                    <label></label><input type="submit" value="comprar"/>
				
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
                  <center>  <g:link data-role="button" data-theme="a" data-inline="true" controller="Usuario" action="logOut">Logout</g:link> | <g:link data-role="button" data-theme="a" data-inline="true" controller="Compra" action="mlist">Mis Compras</g:link> | <g:link data-role="button" data-theme="a" data-inline="true" controller="Productos" action="mshowCarrito">Carrito:  (${session.Carrito.numeroProductos}) Productos</g:link>        </center>
                        
                  
                </g:if>
                <g:else>                   
                  
                  No hay usuario en este momento
                      <g:form controller="usuario" action="login" style="padding-left:200px"> 
                          
                        <div id="janrainEngageEmbed" controller="Usuario" ></div>
                      </g:form>
                      
                </g:else>
    <div data-role="footer" data-position="fixed">
      <h1>ECJ Lab...</h1>
    </div>     
	</body>
</html>