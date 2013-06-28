<%@ page import="grailsapplication3.Usuario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1"> 
                  <link rel="stylesheet" href="http://code.jquery.com/mobile/1.0.1/jquery.mobile-1.0.1.min.css" />
                  <script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
                  <script src="http://code.jquery.com/mobile/1.0.1/jquery.mobile-1.0.1.min.js"></script>
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
	<div data-role="header" data-position="fixed">
          <h1>Le Cloud Products</h1>
              </div>
          </br>
          </br>
          </br>
        <center>Haz iniciado sesion exitosamente para seguir adelante haz click</center>
        </br>
        <center>
            <g:link data-role="button" data-theme="a" data-inline="true" controller="Categoria" action="mlist">Aqui</g:link>
            
        </center>
        </br>
        <center>  <g:link data-role="button" data-theme="a" data-inline="true" controller="Usuario" action="mlogOut">Logout</g:link> | <g:link data-role="button" data-theme="a" data-inline="true" controller="Compra" action="mlist">Mis Compras</g:link> | <g:link data-role="button" data-theme="a" data-inline="true" controller="Productos" action="mshowCarrito">Carrito:  (${session.Carrito.numeroProductos}) Productos</g:link>        </center>

	</body>
</html>
