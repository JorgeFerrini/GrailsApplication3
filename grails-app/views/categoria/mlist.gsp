
<%@ page import="grailsapplication3.Categoria" %>
<!DOCTYPE html>
<html>
	<head>
                  <meta name="viewport" content="width=device-width, initial-scale=1"> 
                  <link rel="stylesheet" href="http://code.jquery.com/mobile/1.0.1/jquery.mobile-1.0.1.min.css" />
                  <script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
                  <script src="http://code.jquery.com/mobile/1.0.1/jquery.mobile-1.0.1.min.js"></script>
		
		<g:set var="entityName" value="${message(code: 'categoria.label', default: 'Categoria')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
              <div data-role="header" data-position="fixed">
                    <h1>Le Cloud Products</h1>
              </div>
          </br>

                <!--
		<a href="#list-categoria" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>-->       

                      <g:form controller="Productos" action="mshowFiltering" >
                                  <div class="fieldcontain ${hasErrors(bean: productosInstance, field: 'nombre', 'error')} ">
                                      
                                      <g:textField name="nombre" size="70" maxlength="50" value="${productosInstance?.nombre}"/>
                                      <g:submitButton name="showFiltering" class="Productos" value="Buscar" />
                                  </div>
                        
			</g:form>
            
          
                <ul data-role="listview" data-inset="true" data-filter="false" class="ui-icon-alt">
                        <li data-role="list-divider"> Categorias </li>
				<g:each in="${categoriaInstanceList}" status="i" var="categoriaInstance">
					
                                  <li>		<g:link action="mshow" id="${categoriaInstance.id}">${fieldValue(bean: categoriaInstance, field: "nombre")}</g:link></li>                                             
                                                
			
				</g:each>
                        </ul>  
			<div class="pagination">
				<g:paginate total="${categoriaInstanceTotal}" />
			</div>
		</div>
                </br>
                
                <ul data-role="listview" data-inset="true" data-filter="false" class="ui-icon-alt">
                        <li data-role="list-divider"> Categorias </li>
                        <li><g:link controller="productos" action="mlist" >Todos</g:link></li>
                </ul>          
                
                <g:if test="${session.Usuario}">
                  <center>  <g:link data-role="button" data-theme="a" data-inline="true" controller="Usuario" action="mlogOut">Logout</g:link> | <g:link data-role="button" data-theme="a" data-inline="true" controller="Compra" action="mlist">Mis Compras</g:link> | <g:link data-role="button" data-theme="a" data-inline="true" controller="Productos" action="mshowCarrito">Carrito:  (${session.Carrito.numeroProductos}) Productos</g:link>        </center>
                        
                  
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
