
<%@ page import="grailsapplication3.Carrito" %>
<!DOCTYPE html>
<html>
	<head>
		 <meta name="viewport" content="width=device-width, initial-scale=1"> 
                  <link rel="stylesheet" href="http://code.jquery.com/mobile/1.0.1/jquery.mobile-1.0.1.min.css" />
                  <script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
                  <script src="http://code.jquery.com/mobile/1.0.1/jquery.mobile-1.0.1.min.js"></script>
		<g:set var="entityName" value="${message(code: 'carrito.label', default: 'Carrito')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
          <div data-role="header" data-position="fixed">
            <h1>Le Cloud Products</h1>
          </div>
        <g:link data-role="button" data-theme="a" data-inline="true" controller="categoria" action="mlist">Categorias</g:link>
         <!-- 
		<a href="#show-carrito" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				
			</ul>
		</div>-->
		<div id="show-carrito" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list carrito">
			
				<g:if test="${carritoInstance?.idProductos}">
				<li class="fieldcontain">
					<span id="idProductos-label" class="property-label"><g:message code="carrito.idProductos.label" default="Id Productos" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${carritoInstance?.nombreProductos}">
				<li class="fieldcontain">
					<span id="nombreProductos-label" class="property-label"><g:message code="carrito.nombreProductos.label" default="Nombre Productos" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${carritoInstance?.numeroProductos}">
				<li class="fieldcontain">
					<span id="numeroProductos-label" class="property-label"><g:message code="carrito.numeroProductos.label" default="Numero Productos" /></span>
					
						<span class="property-value" aria-labelledby="numeroProductos-label"><g:fieldValue bean="${carritoInstance}" field="numeroProductos"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carritoInstance?.precioProductos}">
				<li class="fieldcontain">
					<span id="precioProductos-label" class="property-label"><g:message code="carrito.precioProductos.label" default="Precio Productos" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${carritoInstance?.id}" />
					<g:link class="edit" action="edit" id="${carritoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
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
