<%@ page import="grailsapplication3.Calificacion" %>



<div class="fieldcontain ${hasErrors(bean: calificacionInstance, field: 'comentario', 'error')} ">
	<label for="comentario">
		<g:message code="calificacion.comentario.label" default="Comentario" />
		
	</label>
	<g:textArea name="comentario" cols="40" rows="5" maxlength="2500" value="${calificacionInstance?.comentario}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: calificacionInstance, field: 'valorCalificacion', 'error')} required">
	<label for="valorCalificacion">
		<g:message code="calificacion.valorCalificacion.label" default="Valor Calificacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="cantidad" name="valorCalificacion" type="number" from="${2..5}" class="many-to-one" noSelection="['1': '1']"/>
</div>

