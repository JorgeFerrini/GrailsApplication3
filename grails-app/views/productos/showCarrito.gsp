<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta name="layout" content="main">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Detalle Carrito de Compras</title>
    <g:set var="num" value="${0}" /> 
    <g:set var="total" value="${0}" /> 
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
      <table>
        <thead>
					<tr>
					
                                                <th><g:message code="productos.categoria.label" default="Nombre" /></th>
                                                
                                                <th><g:message code="productos.categoria.label" default="Precio" /></th>
                                                
                                                <th><g:message code="productos.categoria.label" default="Cantidad" /></th>
					
                                                <th><g:message code="productos.categoria.label" default="Eliminar" /></th>
					</tr>
        </thead>
        <tbody>
        
          
                    <g:while test="${num < 10 }">
                      <tr class="${(num % 2) == 0 ? 'even' : 'odd'}">  
       
                      <g:if test="${session.Carrito.idProductos [num]}">
                  
                       
                       <td><g:link action="show" id="${session.Carrito.idProductos [num]}">${session.Carrito.nombreProductos [num]}</g:link></td>
					
                       <td>${session.Carrito.precioProductos [num]}</td>
                       <td>${session.Carrito.cantidadProductos [num]}</td> 
                       <td><g:link action="removeCarrito" id="${session.Carrito.idProductos [num]}"><img src="<g:createLinkTo dir="/images" file="delete.png" /> " /></g:link></td>
                       
                        <g:set var="total" value="${total+(session.Carrito.precioProductos [num] * session.Carrito.cantidadProductos [num])}" /> 
                      </g:if>
                      <g:else>
                        
                        
                      </g:else>
                    ${num ++}
                    
                      </tr>
                    </g:while>
        
      
      </tbody>  
      
      </table>  
  </div>     
    ${total}     
  </body>
</html>
