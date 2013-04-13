<%@ page import="grailsapplication3.Imagen" %>



<div class="fieldcontain ${hasErrors(bean: imagenInstance, field: 'alto', 'error')} required">
	<label for="alto">
		<g:message code="imagen.alto.label" default="Alto" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="alto" type="number" value="${imagenInstance.alto}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: imagenInstance, field: 'ancho', 'error')} required">
	<label for="ancho">
		<g:message code="imagen.ancho.label" default="Ancho" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="ancho" type="number" value="${imagenInstance.ancho}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: imagenInstance, field: 'directorioImagen', 'error')} ">
	<label for="directorioImagen">
		<g:message code="imagen.directorioImagen.label" default="Directorio Imagen" />
		
	</label>
	<g:textField name="directorioImagen" value="${imagenInstance?.directorioImagen}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: imagenInstance, field: 'producto', 'error')} required">
	<label for="producto">
		<g:message code="imagen.producto.label" default="Producto" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="producto" name="producto.id" from="${grailsapplication3.Productos.list()}" optionKey="id" required="" value="${imagenInstance?.producto?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: imagenInstance, field: 'rutaImagen', 'error')} ">
	<label for="rutaImagen">
		<g:message code="imagen.rutaImagen.label" default="Ruta Imagen" />
		
	</label>
	<g:textField name="rutaImagen" value="${imagenInstance?.rutaImagen}"/>
</div>

