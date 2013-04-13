<%@ page import="grailsapplication3.Productos" %>



<div class="fieldcontain ${hasErrors(bean: productosInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="productos.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" maxlength="100" value="${productosInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productosInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="productos.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textArea name="descripcion" cols="40" rows="5" maxlength="3000" value="${productosInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productosInstance, field: 'archivo', 'error')} ">
	<label for="archivo">
		<g:message code="productos.archivo.label" default="Archivo" />
		
	</label>
	<g:textField name="archivo" value="${productosInstance?.archivo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productosInstance, field: 'calificaciones', 'error')} ">
	<label for="calificaciones">
		<g:message code="productos.calificaciones.label" default="Calificaciones" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${productosInstance?.calificaciones?}" var="c">
    <li><g:link controller="calificacion" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="calificacion" action="create" params="['productos.id': productosInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'calificacion.label', default: 'Calificacion')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: productosInstance, field: 'categoria', 'error')} required">
	<label for="categoria">
		<g:message code="productos.categoria.label" default="Categoria" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="categoria" name="categoria.id" from="${grailsapplication3.Categoria.list()}" optionKey="id" required="" value="${productosInstance?.categoria?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productosInstance, field: 'detalles', 'error')} ">
	<label for="detalles">
		<g:message code="productos.detalles.label" default="Detalles" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${productosInstance?.detalles?}" var="d">
    <li><g:link controller="detalle" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="detalle" action="create" params="['productos.id': productosInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'detalle.label', default: 'Detalle')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: productosInstance, field: 'directorio', 'error')} ">
	<label for="directorio">
		<g:message code="productos.directorio.label" default="Directorio" />
		
	</label>
	<g:textField name="directorio" value="${productosInstance?.directorio}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productosInstance, field: 'imagenes', 'error')} ">
	<label for="imagenes">
		<g:message code="productos.imagenes.label" default="Imagenes" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${productosInstance?.imagenes?}" var="i">
    <li><g:link controller="imagen" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="imagen" action="create" params="['productos.id': productosInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'imagen.label', default: 'Imagen')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: productosInstance, field: 'precio', 'error')} required">
	<label for="precio">
		<g:message code="productos.precio.label" default="Precio" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="precio" type="number" value="${productosInstance.precio}" required=""/>
</div>

