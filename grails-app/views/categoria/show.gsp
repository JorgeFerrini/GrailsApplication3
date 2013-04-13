
<%@ page import="grailsapplication3.Categoria" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'categoria.label', default: 'Categoria')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-categoria" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				
			</ul>
		</div>
		<div id="show-categoria" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list categoria">
			
				<g:if test="${categoriaInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label">Categoria: </span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${categoriaInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${categoriaInstance?.produtor}">
				<li class="fieldcontain">
					<span id="produtor-label" class="property-label"><g:message code="categoria.produtor.label" default="Produtos" /></span>
					
						<g:each in="${categoriaInstance.produtor}" var="p">
						<span class="property-value" aria-labelledby="produtor-label"><g:link controller="productos" action="show" id="${p.id}">${p.nombre}</g:link></span>
                                                <span class="property-value" aria-labelledby="produtor-label">BsF ${p.precio}</span>
                                                <span class="property-value"><g:link controller="productos" action="show" id="${p.id}"><img src="<g:createLinkTo dir="${p.directorio}" file="${p.archivo}" /> " width="75" height="75"  /> </g:link></span>                                  
                                                
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			
		</div>
                
                
                
                
	</body>
</html>
