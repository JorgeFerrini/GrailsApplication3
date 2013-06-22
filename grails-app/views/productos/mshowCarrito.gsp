<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
     <meta name="viewport" content="width=device-width, initial-scale=1"> 
                  <link rel="stylesheet" href="http://code.jquery.com/mobile/1.0.1/jquery.mobile-1.0.1.min.css" />
                  <script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
                  <script src="http://code.jquery.com/mobile/1.0.1/jquery.mobile-1.0.1.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Detalle Carrito de Compras</title>
    <g:set var="num" value="${0}" /> 
    <g:set var="total" value="${0}" /> 
  </head>
  <body>
    <div data-role="header" data-position="fixed">
      <h1>Le Cloud Products</h1>
    </div>
  <g:link data-role="button" data-theme="a" data-inline="true" controller="categoria" action="mlist">Categorias</g:link>
  <!--
                    <div class="nav" role="navigation">
			<ul>
                                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>				
                                <li><g:link controller="categoria" action="list">Categorias</g:link></li>
				<li><g:link controller="productos" action="list">Productos</g:link></li>
				
			</ul>
		</div> -->
      
  <center> 
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
                  
                       
                       <td><g:link action="mshow" id="${session.Carrito.idProductos [num]}">${session.Carrito.nombreProductos [num]}</g:link></td>
					
                       <td>${session.Carrito.precioProductos [num]}</td>
                       <td>${session.Carrito.cantidadProductos [num]}</td> 
                       <td><g:link action="mremoveCarrito" id="${session.Carrito.idProductos [num]}"><img src="<g:createLinkTo dir="/images" file="delete.png" /> " /></g:link></td>
                       
                       <g:set var="total" value="${total+(session.Carrito.precioProductos [num] * session.Carrito.cantidadProductos [num])}" />
                      </g:if>
                      <g:else>
                        
                        
                      </g:else>
                    <font color="white">${num ++}</font>
                    
                      </tr>
                    </g:while>
        
      
      </tbody>  
      
      </table>  
    </div>   </center>  
  <center><h1> Total= ${total} BsF.</h1></center>    
  <g:if test="${total != 0}">
  <center><g:link data-role="button" data-theme="a" data-inline="true" controller="tarjetacredito" action ="mshowTarjetasCompras">Comprar</g:link></center></li>
  </g:if>
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
