<%@ page import="grailsapplication3.Carrito" %>



<div class="fieldcontain ${hasErrors(bean: carritoInstance, field: 'idProductos', 'error')} required">
	<label for="idProductos">
		<g:message code="carrito.idProductos.label" default="Id Productos" />
		<span class="required-indicator">*</span>
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: carritoInstance, field: 'nombreProductos', 'error')} required">
	<label for="nombreProductos">
		<g:message code="carrito.nombreProductos.label" default="Nombre Productos" />
		<span class="required-indicator">*</span>
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: carritoInstance, field: 'numeroProductos', 'error')} required">
	<label for="numeroProductos">
		<g:message code="carrito.numeroProductos.label" default="Numero Productos" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="numeroProductos" type="number" value="${carritoInstance.numeroProductos}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carritoInstance, field: 'precioProductos', 'error')} required">
	<label for="precioProductos">
		<g:message code="carrito.precioProductos.label" default="Precio Productos" />
		<span class="required-indicator">*</span>
	</label>
	
</div>

