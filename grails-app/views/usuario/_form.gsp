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


<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'fechaNacimientoUser', 'error')} required">
	<label for="fechaNacimientoUser">
		<g:message code="usuario.fechaNacimientoUser.label" default="Fecha Nacimiento User" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaNacimientoUser" precision="day"  value="${usuarioInstance?.fechaNacimientoUser}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="usuario.password.label" default="Password User" />
		
	</label>
	<g:textField name="password" maxlength="25" value="${usuarioInstance?.nombreUser}"/>
</div>


