<%@ page import="grailsapplication3.Categoria" %>
<%@ page import="grailsapplication3.Productos" %>
<%@ page session="true"%>

<!DOCTYPE html>
<html>
	<head>
        
<script type="text/javascript">
(function() {
    if (typeof window.janrain !== 'object') window.janrain = {};
    if (typeof window.janrain.settings !== 'object') window.janrain.settings = {};
    
    janrain.settings.tokenUrl = 'http://localhost:3306/GrailsApplication3/usuario/janrainMobileSignIn';

    function isReady() { janrain.ready = true; };
    if (document.addEventListener) {
      document.addEventListener("DOMContentLoaded", isReady, false);
    } else {
      window.attachEvent('onload', isReady);
    }

    var e = document.createElement('script');
    e.type = 'text/javascript';
    e.id = 'janrainAuthWidget';

    if (document.location.protocol === 'https:') {
      e.src = 'https://rpxnow.com/js/lib/desarrollocarolina/engage.js';
    } else {
      e.src = 'http://widget-cdn.rpxnow.com/js/lib/desarrollocarolina/engage.js';
    }

    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(e, s);
})();
</script>
<script language="javascript">
step=0;
function autoImgFlip() {
if (step < 8) {step++;}
else {step=0;}
if (step==0)
{a.src="1.jpg";}
if (step==1)
{a.src="2.jpg";}
setTimeout("autoImgFlip()", 3000);
if (step==2)
{a.src="3.jpg";}
if (step==3)
{a.src="4.jpg";}
if (step==4)
{a.src="5.jpg";}
if (step==5)
{a.src="6.jpg";}
if (step==6)
{a.src="7.jpg";}
if (step==7)
{a.src="8.jpg";}
}
</script>

		<meta name="layout" content="main"/>
		<title>Welcome to Grails</title>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
		</style>
                		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'categoria.label', default: 'Categoria')}" />
                                
	</head>
	<body onLoad="autoImgFlip();">                
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                       
                <div class="nav" role="navigation">
			<ul>
				
                                <li><g:link controller="categoria" action="list">Categorias</g:link></li>
				<li><g:link controller="productos" action="list">Productos</g:link></li>
                                <li><a href="<g:createLinkTo dir="/WEB-INF" file="docAPI.docx" /> " >Documentacion API</a></li>
				 
			</ul>
		</div>        
		
		<div id="page-body" role="main">
			<h1>Busca tu Producto</h1>
			<g:form controller="Productos" action="showFiltering" >
                                  <div class="fieldcontain ${hasErrors(bean: productosInstance, field: 'nombre', 'error')} ">
                                      
                                      <g:textField name="nombre" size="70" maxlength="50" value="${productosInstance?.nombre}"/>
                                      <g:submitButton name="showFiltering" class="Productos" value="Buscar" />
                                  </div>
                        
			</g:form>

			<div id="controller-list" role="navigation">
				<h2>Productos en Oferta!!:</h2>
                        
                                <ul>
                                  <img src="images/1.jpg" id="a">
                                </ul>
                                <ul>
                                    <g:if test="${session.Usuario}">
                  Login as: ${session.Usuario.nombreUser} | <g:link controller="Usuario" action="logOut">Logout</g:link> | <g:link controller="Usuario" action="show" id="${session.Usuario.id}">Mi perfil</g:link> | <g:link controller="Compra" action="list">Mis Compras</g:link> | <g:link controller="Tarjetacredito" action="list" max="5">Mis Tarjetas</g:link> | <g:link controller="Calificacion" action="listPorUsuario">Mis Calificaciones</g:link> | <g:link controller="Productos" action="showCarrito">Carrito:  (${session.Carrito.numeroProductos}) Productos</g:link>        
                        
                  
                </g:if>
                <g:else>                   
                  
                  No hay usuario en este momento
                      <g:form controller="usuario" action="login" style="padding-left:200px"> 
                          
                        <div id="janrainEngageEmbed" controller="Usuario" ></div>
                      </g:form>
                      
                </g:else>
                        
				</ul>
                        
                        
                        
                                
                        
                                
                        
			</div>
		</div>               
                  
	</body>
</html>
