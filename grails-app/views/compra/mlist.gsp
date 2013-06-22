
<%@ page import="grailsapplication3.Compra" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1"> 
                  <link rel="stylesheet" href="http://code.jquery.com/mobile/1.0.1/jquery.mobile-1.0.1.min.css" />
                  <script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
                  <script src="http://code.jquery.com/mobile/1.0.1/jquery.mobile-1.0.1.min.js"></script>
		<g:set var="entityName" value="${message(code: 'compra.label', default: 'Compra')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
          
         <div data-role="header" data-position="fixed">
            <h1>Le Cloud Products</h1>
          </div>
        <g:link data-role="button" data-theme="a" data-inline="true" controller="categoria" action="mlist">Categorias</g:link>
        <center>
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th>Status</th>
                                                
                                                <th>Fecha Entrega</th>
                                                
                                                <th>Fecha Compra</th>
                                                
                                                <th>Tarjeta</th>

					</tr>
				</thead>
				<tbody>
				<g:each in="${compraInstanceList}" status="i" var="compraInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: compraInstance, field: "status")}</td>
					
						<td><g:formatDate date="${compraInstance.fechaEntrega}" /></td>
					
						<td><g:formatDate date="${compraInstance.fechaCompra}" /></td>
					
						<td>${compraInstance.tarjeta.numero}</td>					
                                                
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${compraInstanceTotal}" />
			</div>
                </center>
                
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
