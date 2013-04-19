<%@ page import="grailsapplication3.Tarjetacredito" %>



<div class="fieldcontain ${hasErrors(bean: tarjetacreditoInstance, field: 'numero', 'error')} required">
	<label for="numero">
		<g:message code="tarjetacredito.numero.label" default="Numero" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="numero" type="number" value="${tarjetacreditoInstance.numero}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: tarjetacreditoInstance, field: 'codigoSeguridad', 'error')} required">
	<label for="codigoSeguridad">
		<g:message code="tarjetacredito.codigoSeguridad.label" default="Codigo Seguridad" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="codigoSeguridad" type="number" value="${tarjetacreditoInstance.codigoSeguridad}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: tarjetacreditoInstance, field: 'marcaComercial', 'error')} ">
	<label for="marcaComercial">
		<g:message code="tarjetacredito.marcaComercial.label" default="Marca Comercial" />
		
	</label>
	<g:select name="marcaComercial" from="${tarjetacreditoInstance.constraints.marcaComercial.inList}" value="${tarjetacreditoInstance?.marcaComercial}" valueMessagePrefix="tarjetacredito.marcaComercial" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tarjetacreditoInstance, field: 'compras', 'error')} ">
	<label for="compras">
		<g:message code="tarjetacredito.compras.label" default="Compras" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${tarjetacreditoInstance?.compras?}" var="c">
    <li><g:link controller="compra" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="compra" action="create" params="['tarjetacredito.id': tarjetacreditoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'compra.label', default: 'Compra')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: tarjetacreditoInstance, field: 'fechaVencimiento', 'error')} required">
	<label for="fechaVencimiento">
		<g:message code="tarjetacredito.fechaVencimiento.label" default="Fecha Vencimiento" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaVencimiento" precision="day"  value="${tarjetacreditoInstance?.fechaVencimiento}"  />
</div>


