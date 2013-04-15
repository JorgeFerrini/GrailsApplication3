<%@ page import="grailsapplication3.Lugar" %>



<div class="fieldcontain ${hasErrors(bean: lugarInstance, field: 'lugar', 'error')} ">
	<label for="lugar">
		<g:message code="lugar.lugar.label" default="Lugar" />
		
	</label>
	<g:select id="lugar" name="lugar.id" from="${grailsapplication3.Lugar.list()}" optionKey="id" value="${lugarInstance?.lugar?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: lugarInstance, field: 'usuario', 'error')} ">
	<label for="usuario">
		<g:message code="lugar.usuario.label" default="Usuario" />
		
	</label>
	<g:select id="usuario" name="usuario.id" from="${grailsapplication3.Usuario.list()}" optionKey="id" value="${lugarInstance?.usuario?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: lugarInstance, field: 'tipoLugar', 'error')} ">
	<label for="tipoLugar">
		<g:message code="lugar.tipoLugar.label" default="Tipo Lugar" />
		
	</label>
	<g:select name="tipoLugar" from="${lugarInstance.constraints.tipoLugar.inList}" value="${lugarInstance?.tipoLugar}" valueMessagePrefix="lugar.tipoLugar" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: lugarInstance, field: 'direccion', 'error')} ">
	<label for="direccion">
		<g:message code="lugar.direccion.label" default="Direccion" />
		
	</label>
	<g:textField name="direccion" value="${lugarInstance?.direccion}"/>
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

