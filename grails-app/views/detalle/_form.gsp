<%@ page import="grailsapplication3.Detalle" %>



<div class="fieldcontain ${hasErrors(bean: detalleInstance, field: 'cantidad', 'error')} required">
	<label for="cantidad">
		<g:message code="detalle.cantidad.label" default="Cantidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cantidad" type="number" value="${detalleInstance.cantidad}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: detalleInstance, field: 'compra', 'error')} required">
	<label for="compra">
		<g:message code="detalle.compra.label" default="Compra" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="compra" name="compra.id" from="${grailsapplication3.Compra.list()}" optionKey="id" required="" value="${detalleInstance?.compra?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: detalleInstance, field: 'productos', 'error')} required">
	<label for="productos">
		<g:message code="detalle.productos.label" default="Productos" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="productos" name="productos.id" from="${grailsapplication3.Productos.list()}" optionKey="id" required="" value="${detalleInstance?.productos?.id}" class="many-to-one"/>
</div>

