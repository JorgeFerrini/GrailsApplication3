
<%@ page import="grailsapplication3.Categoria" %>
<!DOCTYPE html>
<html>
	<head>
		  <meta name="viewport" content="width=device-width, initial-scale=1"> 
                  <link rel="stylesheet" href="http://code.jquery.com/mobile/1.0.1/jquery.mobile-1.0.1.min.css" />
                  <script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
                  <script src="http://code.jquery.com/mobile/1.0.1/jquery.mobile-1.0.1.min.js"></script>
		<g:set var="entityName" value="${message(code: 'categoria.label', default: 'Categoria')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
          <!--
		<a href="#show-categoria" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				
			</ul>
		</div>-->
          <div data-role="header" data-position="fixed">
                    <h1>Le Cloud Products</h1>
              </div>
          </br>
          </br>
          </br>                        
                          
			<ul data-role="listview" data-inset="true">
                          
                          	 	
				<g:if test="${categoriaInstance?.nombre}">
                                         
					<span id="nombre-label" class="property-label">Categoria: </span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${categoriaInstance}" field="nombre"/></span></li>	
					
				
				</g:if>
                          <!--    <li><a href="#">

                             <img src="../../_assets/img/album-bb.jpg">

        <h2>Broken Bells</h2>

        <p>Broken Bells</p></a>

            </li>-->
				<g:if test="${categoriaInstance?.produtor}">
				
					<!--<span id="produtor-label" class="property-label"><g:message code="categoria.produtor.label" default="Produtos" /></span>-->
                                        
						<g:each in="${categoriaInstance.produtor}" var="p">
                                                  <li>  <g:link controller="productos" action="mshow" id="${p.id}">
                                                         <img src="<g:createLinkTo dir="${p.directorio}" file="${p.archivo}" /> " />
                                                         <h2><span class="property-value" aria-labelledby="produtor-label">${p.nombre}</span></h2>
                                                         <p><span class="property-value" aria-labelledby="produtor-label">BsF ${p.precio}</span></p></g:link>
                                                
                                                  </li>
						</g:each>
					
				
				</g:if>
			</ul>
			
			
		

        
        
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
