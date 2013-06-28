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
          <g:form controller="usuario" action="mlogin" > 
                          
                        <g:textField name="username" maxlength="25" placeholder="email"/>
                        <g:passwordField name="password" maxlength="25" placeholder="password"/>
                        <fieldset class="buttons">
					<g:submitButton name="iniciar" class="Productos" value="Iniciar" />
				</fieldset>
                      </g:form>
	</body>
</html>
