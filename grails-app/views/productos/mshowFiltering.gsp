<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="grailsapplication3.Productos" %>

<html>
  <head>
                      <meta name="viewport" content="width=device-width, initial-scale=1"> 
                  <link rel="stylesheet" href="http://code.jquery.com/mobile/1.0.1/jquery.mobile-1.0.1.min.css" />
                  <script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
                  <script src="http://code.jquery.com/mobile/1.0.1/jquery.mobile-1.0.1.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <g:set var="entityName" value="${message(code: 'productos.label', default: 'Productos')}" />
    
  </head>
  <body>
 <div data-role="header" data-position="fixed">
                    <h1>Le Cloud Products</h1>
              </div>
          </br>
          
          <g:link data-role="button" data-theme="a" data-inline="true" controller="categoria" action="mlist">Categorias</g:link>
		<g:link data-role="button" data-theme="a" data-inline="true" controller="productos" action="mlist">Productos</g:link>
    
    <div id="showFiltering-productos" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			
				<ul data-role="listview" data-inset="true">
				<g:each in="${productosInstanceList}" status="i" var="productosInstance">
					
                                        <li><g:link controller="productos" action="mshow" id="${productosInstance.id}">
                                            <img src="<g:createLinkTo dir="${productosInstance.directorio}" file="${productosInstance.archivo}" /> " width="75" height="75"  />  
						${fieldValue(bean: productosInstance, field: "nombre")}	</br>					
							
                                            <b>Precio: </b> ${fieldValue(bean: productosInstance, field: "precio")}
                                                
                                                </g:link>
                                        </li>
					
				</g:each>
                                
				
			</table>

                                </ul>
		</div>
                                        <g:if test="${session.Usuario}">
                  <center>  <g:link data-role="button" data-theme="a" data-inline="true" controller="Usuario" action="mlogOut">Logout</g:link> | <g:link data-role="button" data-theme="a" data-inline="true" controller="Compra" action="mlist">Mis Compras</g:link> | <g:link data-role="button" data-theme="a" data-inline="true" controller="Productos" action="mshowCarrito">Carrito:  (${session.Carrito.numeroProductos}) Productos</g:link>        </center>
                        
                  
                </g:if>
                <g:else>                   
                  
                  No hay usuario en este momento
                      <g:form controller="usuario" action="login" style="padding-left:200px"> 
                          
                        <div id="janrainEngageEmbed" controller="Usuario" ></div>
                      </g:form>
                      
                </g:else>
  </body>
</html>
