
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
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'productos.label', default: 'Productos')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-productos" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                                <li><g:link controller="categoria" action="list">Categorias</g:link></li>
				<li><g:link class="list" action="list">Productos</g:link></li>
				
			</ul>
		</div>
		<div id="show-productos" class="content scaffold-show" role="main">
			<h1>				<g:if test="${productosInstance?.categoria}">
				
					<span id="categoria-label" class="property-label"><g:message code="productos.categoria.label" default="Categoria" /></span>
					
						<span class="property-value" aria-labelledby="categoria-label"><g:link controller="categoria" action="show" id="${productosInstance?.categoria?.id}">${productosInstance?.categoria?.nombre}</g:link></span>
					
				
				</g:if></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list productos">
			
				<g:if test="${productosInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="productos.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${productosInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productosInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="productos.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${productosInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			

			
				<g:if test="${productosInstance?.calificaciones}">
				<li class="fieldcontain">
					<span id="calificaciones-label" class="property-label"><g:message code="productos.calificaciones.label" default="Calificaciones" /></span>
					
						<span class="property-value" aria-labelledby="calificaciones-label"><g:link controller="calificacion" action="listPorProducto" id="${productosInstance?.id}">Calificaciones del Producto</g:link></span>
						
					
				</li>
				</g:if>
			

			
		
				<g:if test="${productosInstance?.imagenes}">
				<li class="fieldcontain">
					<span id="imagenes-label" class="property-label"><g:message code="productos.imagenes.label" default="Imagenes" /></span>
					
						<g:each in="${productosInstance.imagenes}" var="i">
						
                                                <span class="property-value"><img src="<g:createLinkTo dir="${i.directorioImagen}" file="${i.rutaImagen}" /> " width="100" height="100"  /></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${productosInstance?.precio}">
				<li class="fieldcontain">
					<span id="precio-label" class="property-label"><g:message code="productos.precio.label" default="Precio" /></span>
					
						<span class="property-value" aria-labelledby="precio-label"><g:fieldValue bean="${productosInstance}" field="precio"/></span>
					
				</li>
				</g:if>
			
			</ol>

		</div>
                <div id="janrainEngageShare"><center><p>Comparte en Twitter! </p><img src="<g:createLinkTo dir="/images" file="tw.jpg" /> " /></center></div>
                <g:if test="${session.Usuario}">
                  Login as: ${session.Usuario.nombreUser} | <g:link controller="Usuario" action="logOut">Logout</g:link> | <g:link controller="Usuario" action="show" id="${session.Usuario.id}">Mi perfil</g:link> | <g:link controller="Compra" action="list">Mis Compras</g:link> | <g:link controller="Tarjetacredito" action="list" max="5">Mis Tarjetas</g:link> | <g:link controller="Calificacion" action="listPorUsuario">Mis Calificaciones</g:link> | <g:link controller="Productos" action="showCarrito">Carrito:  (${session.Carrito.numeroProductos}) Productos</g:link>        
                  
                       <g:form controller="Productos" action="addToCarrito">
                                <g:hiddenField name="id" value="${productosInstance?.id}" />
                                <g:hiddenField name="nombre" value="${productosInstance?.nombre}" />
                                <g:hiddenField name="precio" value="${productosInstance?.precio}" />
                                
                                <g:select id="cantidad" name="cantidad" from="${2..9}" class="many-to-one" noSelection="['1': '1']"/>
                                                        
				<fieldset class="buttons">
					<g:submitButton name="addToCarrito" class="Productos" value="Comprar" />
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
