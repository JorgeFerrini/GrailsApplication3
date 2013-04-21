<%@ page import="grailsapplication3.Calificacion" %>



<div class="fieldcontain ${hasErrors(bean: calificacionInstance, field: 'comentario', 'error')} ">
	<label for="comentario">
		<g:message code="calificacion.comentario.label" default="Comentario" />
		
	</label>
	<g:textField name="comentario" value="${calificacionInstance?.comentario}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: calificacionInstance, field: 'fechaCalificacion', 'error')} required">
	<label for="fechaCalificacion">
		<g:message code="calificacion.fechaCalificacion.label" default="Fecha Calificacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaCalificacion" precision="day"  value="${calificacionInstance?.fechaCalificacion}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: calificacionInstance, field: 'producto', 'error')} required">
	<label for="producto">
		<g:message code="calificacion.producto.label" default="Producto" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="producto" name="producto.id" from="${grailsapplication3.Productos.list()}" optionKey="id" required="" value="${calificacionInstance?.producto?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: calificacionInstance, field: 'usuario', 'error')} required">
	<label for="usuario">
		<g:message code="calificacion.usuario.label" default="Usuario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="usuario" name="usuario.id" from="${grailsapplication3.Usuario.list()}" optionKey="id" required="" value="${calificacionInstance?.usuario?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: calificacionInstance, field: 'valorCalificacion', 'error')} required">
	<label for="valorCalificacion">
		<g:message code="calificacion.valorCalificacion.label" default="Valor Calificacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="valorCalificacion" type="number" value="${calificacionInstance.valorCalificacion}" required=""/>
</div>

