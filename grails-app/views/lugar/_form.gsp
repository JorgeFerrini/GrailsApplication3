<%@ page import="grailsapplication3.Lugar" %>



<div class="fieldcontain ${hasErrors(bean: lugarInstance, field: 'lugar', 'error')} required">
	<label for="lugar">
		<g:message code="lugar.lugar.label" default="Lugar" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="lugar" name="lugar.id" from="${grailsapplication3.Lugar.list()}" optionKey="id" required="" value="${lugarInstance?.lugar?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: lugarInstance, field: 'tipoLugar', 'error')} ">
	<label for="tipoLugar">
		<g:message code="lugar.tipoLugar.label" default="Tipo Lugar" />
		
	</label>
	<g:select name="tipoLugar" from="${lugarInstance.constraints.tipoLugar.inList}" value="${lugarInstance?.tipoLugar}" valueMessagePrefix="lugar.tipoLugar" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: lugarInstance, field: 'lugares', 'error')} ">
	<label for="lugares">
		<g:message code="lugar.lugares.label" default="Lugares" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${lugarInstance?.lugares?}" var="l">
    <li><g:link controller="lugar" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="lugar" action="create" params="['lugar.id': lugarInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'lugar.label', default: 'Lugar')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: lugarInstance, field: 'nombreLugar', 'error')} ">
	<label for="nombreLugar">
		<g:message code="lugar.nombreLugar.label" default="Nombre Lugar" />
		
	</label>
	<g:textField name="nombreLugar" value="${lugarInstance?.nombreLugar}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: lugarInstance, field: 'usuarios', 'error')} ">
	<label for="usuarios">
		<g:message code="lugar.usuarios.label" default="Usuarios" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${lugarInstance?.usuarios?}" var="u">
    <li><g:link controller="usuario" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="usuario" action="create" params="['lugar.id': lugarInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'usuario.label', default: 'Usuario')])}</g:link>
</li>
</ul>

</div>

