
<%@ page import="grailsapplication3.Productos" %>
<!DOCTYPE html>
<html>
	<head>
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
					
						<g:each in="${productosInstance.calificaciones}" var="c">
						<span class="property-value" aria-labelledby="calificaciones-label"><g:link controller="calificacion" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			

			
				<g:if test="${productosInstance?.detalles}">
				<li class="fieldcontain">
					<span id="detalles-label" class="property-label"><g:message code="productos.detalles.label" default="Detalles" /></span>
					
						<g:each in="${productosInstance.detalles}" var="d">
						<span class="property-value" aria-labelledby="detalles-label"><g:link controller="detalle" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
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

                <g:if test="${session.Usuario}">
                  Login as: ${session.Usuario.nombreUser} | <g:link controller="Usuario" action="logOut">Logout</g:link> | <g:link controller="Usuario" action="show" id="${session.Usuario.id}">Mi perfil</g:link>
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
                          <div style="width: 220px">
                            <label>Name: </label><input type="text" name="username"/>
                            <label>Password:</label><input type="password" name="password"/>
                            <label></label><input type="submit" value="login"/>
                          </div>
                      </g:form>                      
                </g:else>        
         
       
        
	</body>
</html>
