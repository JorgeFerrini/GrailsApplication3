<%@ page import="grailsapplication3.Usuario" %>



<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'nombreUser', 'error')} ">
	<label for="nombreUser">
		<g:message code="usuario.nombreUser.label" default="Nombre User" />
		
	</label>
	<g:textField name="nombreUser" maxlength="25" value="${usuarioInstance?.nombreUser}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'apellidoUser', 'error')} ">
	<label for="apellidoUser">
		<g:message code="usuario.apellidoUser.label" default="Apellido User" />
		
	</label>
	<g:textField name="apellidoUser" maxlength="25" value="${usuarioInstance?.apellidoUser}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'identificadorUser', 'error')} ">
	<label for="identificadorUser">
		<g:message code="usuario.identificadorUser.label" default="Identificador User" />
		
	</label>
	<g:textField name="identificadorUser" maxlength="20" value="${usuarioInstance?.identificadorUser}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'tipoIdUser', 'error')} ">
	<label for="tipoIdUser">
		<g:message code="usuario.tipoIdUser.label" default="Tipo Id User" />
		
	</label>
	<g:select name="tipoIdUser" from="${usuarioInstance.constraints.tipoIdUser.inList}" value="${usuarioInstance?.tipoIdUser}" valueMessagePrefix="usuario.tipoIdUser" noSelection="['': '']"/>
</div>


<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'calificaciones', 'error')} ">
	<label for="calificaciones">
		<g:message code="usuario.calificaciones.label" default="Calificaciones" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${usuarioInstance?.calificaciones?}" var="c">
    <li><g:link controller="calificacion" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="calificacion" action="create" params="['usuario.id': usuarioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'calificacion.label', default: 'Calificacion')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'compras', 'error')} ">
	<label for="compras">
		<g:message code="usuario.compras.label" default="Compras" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${usuarioInstance?.compras?}" var="c">
    <li><g:link controller="compra" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="compra" action="create" params="['usuario.id': usuarioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'compra.label', default: 'Compra')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'fechaNacimientoUser', 'error')} required">
	<label for="fechaNacimientoUser">
		<g:message code="usuario.fechaNacimientoUser.label" default="Fecha Nacimiento User" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaNacimientoUser" precision="day"  value="${usuarioInstance?.fechaNacimientoUser}"  />
</div>



<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'tarjetas', 'error')} ">
	<label for="tarjetas">
		<g:message code="usuario.tarjetas.label" default="Tarjetas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${usuarioInstance?.tarjetas?}" var="t">
    <li><g:link controller="tarjetacredito" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="tarjetacredito" action="create" params="['usuario.id': usuarioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'tarjetacredito.label', default: 'Tarjetacredito')])}</g:link>
</li>
</ul>

</div>

