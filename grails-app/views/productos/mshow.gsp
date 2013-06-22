
<%@ page import="grailsapplication3.Productos" %>
<!DOCTYPE html>
<html>
	<head>
          <script type="text/javascript">
(function() {
    if (typeof window.janrain !== 'object') window.janrain = {};
    if (typeof window.janrain.settings !== 'object') window.janrain.settings = {};
    if (typeof window.janrain.settings.share !== 'object') window.janrain.settings.share = {};
    if (typeof window.janrain.settings.packages !== 'object') janrain.settings.packages = [];
    janrain.settings.packages.push('share');

    /* _______________ can edit below this line _______________ */

    janrain.settings.share.providers = ["twitter"];
    janrain.settings.share.providersEmail = [];
    janrain.settings.share.modes = ["broadcast"];
    janrain.settings.share.attributionDisplay = true;
    janrain.settings.share.message = "";
    janrain.settings.share.title = "";
    janrain.settings.share.url = "";
    janrain.settings.share.description = "";

    // Modal Styles
    janrain.settings.share.modalBackgroundColor = "#000000";
    janrain.settings.share.modalBorderRadius = "5";
    janrain.settings.share.modalOpacity = "0.5";
    janrain.settings.share.modalWidth = "5";

    // Body Styles
    janrain.settings.share.bodyBackgroundColor = "#009DDC";
    janrain.settings.share.bodyBackgroundColorOverride = false;
    janrain.settings.share.bodyColor = "#333333";
    janrain.settings.share.bodyContentBackgroundColor = "#ffffff";
    janrain.settings.share.bodyFontFamily = "Helvetica";
    janrain.settings.share.bodyTabBackgroundColor = "#f8f8f8";
    janrain.settings.share.bodyTabColor = "#000000";

    // Element Styles
    janrain.settings.share.elementBackgroundColor = "#f6f6f6";
    janrain.settings.share.elementBorderColor = "#cccccc";
    janrain.settings.share.elementBorderRadius = "3";
    janrain.settings.share.elementButtonBorderRadius = "6";
    janrain.settings.share.elementButtonBoxShadow = "3";
    janrain.settings.share.elementColor = "#cccccc";
    janrain.settings.share.elementHoverBackgroundColor = "#eeeeee";
    janrain.settings.share.elementLinkColor = "#009DDC";

    /* _______________ can edit above this line _______________ */

    function isReady() { janrain.ready = true; };
    if (document.addEventListener) {
        document.addEventListener("DOMContentLoaded", isReady, false);
    } else {
        window.attachEvent('onload', isReady);
    }

    var e = document.createElement('script');
    e.type = 'text/javascript';
    e.id = 'janrainWidgets';

    if (document.location.protocol === 'https:') {
      e.src = 'https://rpxnow.com/js/lib/desarrolloucab/widget.js';
    } else {
      e.src = 'http://widget-cdn.rpxnow.com/js/lib/desarrolloucab/widget.js';
    }

    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(e, s);
})();
</script>
		  <meta name="viewport" content="width=device-width, initial-scale=1"> 
                  <link rel="stylesheet" href="http://code.jquery.com/mobile/1.0.1/jquery.mobile-1.0.1.min.css" />
                  <script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
                  <script src="http://code.jquery.com/mobile/1.0.1/jquery.mobile-1.0.1.min.js"></script>
		
		<g:set var="entityName" value="${message(code: 'productos.label', default: 'Productos')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
          <div data-role="header" data-position="fixed">
                    <h1>Le Cloud Products</h1>
              </div>
          <g:link data-role="button" data-theme="a" data-inline="true" controller="categoria" action="mlist">Categorias</g:link>
          <!--
		<a href="#show-productos" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                                <li><g:link controller="categoria" action="list">Categorias</g:link></li>
				<li><g:link class="list" action="list">Productos</g:link></li>
				
			</ul>
		</div>-->
          
		<div id="show-productos" class="content scaffold-show" role="main">
			<h4><g:if test="${productosInstance?.categoria}">
				
					<span id="categoria-label" class="property-label"><g:message code="productos.categoria.label" default="Categoria" /></span>
					
						<span class="property-value" aria-labelledby="categoria-label"><g:link controller="categoria" action="mshow" id="${productosInstance?.categoria?.id}">${productosInstance?.categoria?.nombre}</g:link></span>
					
				
				</g:if></h4>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list productos">
			
				<g:if test="${productosInstance?.nombre}">
				
								
                                  <b><span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${productosInstance}" field="nombre"/></span></b>
					
				
				</g:if>
                          </br>
                          
			
				<g:if test="${productosInstance?.precio}">
				
                                  <b><span id="precio-label" class="property-label"><g:message code="productos.precio.label" default="Precio: " /></span></b>
					
                                  <b><span class="property-value" aria-labelledby="precio-label"><g:fieldValue bean="${productosInstance}" field="precio"/></span></b>
					
				
				</g:if>
			
                          </br>
                            </br>
                            
                            <center>
                              <g:if test="${productosInstance?.imagenes}">
				
					
					
						<g:each in="${productosInstance.imagenes}" var="i">
						
                                                <span class="property-value"><img src="<g:createLinkTo dir="${i.directorioImagen}" file="${i.rutaImagen}" /> " width="100" height="100"  /></span>
						</g:each>
					
				
				</g:if>
                            </center>
                            </br>
                            </br>
			
				<g:if test="${productosInstance?.descripcion}">
				
                                  <b><span id="descripcion-label" class="property-label"><g:message code="productos.descripcion.label" default="Descripcion" /></span></b>
					</br>
                                        <div style="width: 90%"><p align="justify"><g:fieldValue bean="${productosInstance}" field="descripcion"/></p></div>
					
				
				</g:if>
			

			
				<g:if test="${productosInstance?.calificaciones}">
				
					<span id="calificaciones-label" class="property-label"><g:message code="productos.calificaciones.label" default="Calificaciones" /></span>
					
						<span class="property-value" aria-labelledby="calificaciones-label"><g:link controller="calificacion" action="listPorProducto" id="${productosInstance?.id}">Calificaciones del Producto</g:link></span>
						
					
				
				</g:if>	
		

			</ol>

		</div>
                <div id="janrainEngageShare"><center><p>Comparte en Twitter! </p><img src="<g:createLinkTo dir="/images" file="tw.jpg" /> " /></center></div>
                <g:if test="${session.Usuario}">
                  
                       <g:form controller="Productos" action="addToCarritom">
                                <g:hiddenField name="id" value="${productosInstance?.id}" />
                                <g:hiddenField name="nombre" value="${productosInstance?.nombre}" />
                                <g:hiddenField name="precio" value="${productosInstance?.precio}" />
                                
                                <g:select id="cantidad" name="cantidad" from="${2..9}" class="many-to-one" noSelection="['1': '1']"/>
                                                        
				<fieldset class="buttons">
					<g:submitButton name="addToCarrito" class="Productos" value="Comprar" />
				</fieldset>
			</g:form>    
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
