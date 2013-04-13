<%@ page import="grailsapplication3.Categoria" %>



<div class="fieldcontain ${hasErrors(bean: categoriaInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="categoria.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" maxlength="25" value="${categoriaInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: categoriaInstance, field: 'produtor', 'error')} ">
	<label for="produtor">
		<g:message code="categoria.produtor.label" default="Produtor" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${categoriaInstance?.produtor?}" var="p">
    <li><g:link controller="productos" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="productos" action="create" params="['categoria.id': categoriaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'productos.label', default: 'Productos')])}</g:link>
</li>
</ul>

</div>

