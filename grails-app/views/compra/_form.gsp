<%@ page import="grailsapplication3.Compra" %>



<div class="fieldcontain ${hasErrors(bean: compraInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="compra.status.label" default="Status" />
		
	</label>
	<g:select name="status" from="${compraInstance.constraints.status.inList}" value="${compraInstance?.status}" valueMessagePrefix="compra.status" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: compraInstance, field: 'fechaEntrega', 'error')} ">
	<label for="fechaEntrega">
		<g:message code="compra.fechaEntrega.label" default="Fecha Entrega" />
		
	</label>
	<g:datePicker name="fechaEntrega" precision="day"  value="${compraInstance?.fechaEntrega}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: compraInstance, field: 'detalles', 'error')} ">
	<label for="detalles">
		<g:message code="compra.detalles.label" default="Detalles" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${compraInstance?.detalles?}" var="d">
    <li><g:link controller="detalle" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="detalle" action="create" params="['compra.id': compraInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'detalle.label', default: 'Detalle')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: compraInstance, field: 'fechaCompra', 'error')} required">
	<label for="fechaCompra">
		<g:message code="compra.fechaCompra.label" default="Fecha Compra" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaCompra" precision="day"  value="${compraInstance?.fechaCompra}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: compraInstance, field: 'tarjeta', 'error')} required">
	<label for="tarjeta">
		<g:message code="compra.tarjeta.label" default="Tarjeta" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tarjeta" name="tarjeta.id" from="${grailsapplication3.Tarjetacredito.list()}" optionKey="id" required="" value="${compraInstance?.tarjeta?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: compraInstance, field: 'usuario', 'error')} required">
	<label for="usuario">
		<g:message code="compra.usuario.label" default="Usuario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="usuario" name="usuario.id" from="${grailsapplication3.Usuario.list()}" optionKey="id" required="" value="${compraInstance?.usuario?.id}" class="many-to-one"/>
</div>

