package grailsapplication3

import org.springframework.dao.DataIntegrityViolationException

class DetalleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [detalleInstanceList: Detalle.list(params), detalleInstanceTotal: Detalle.count()]
    }

    def create() {
        [detalleInstance: new Detalle(params)]
    }

    def save() {
        def detalleInstance = new Detalle(params)
        if (!detalleInstance.save(flush: true)) {
            render(view: "create", model: [detalleInstance: detalleInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'detalle.label', default: 'Detalle'), detalleInstance.id])
        redirect(action: "show", id: detalleInstance.id)
    }

    def show(Long id) {
        def detalleInstance = Detalle.get(id)
        if (!detalleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'detalle.label', default: 'Detalle'), id])
            redirect(action: "list")
            return
        }

        [detalleInstance: detalleInstance]
    }

    def edit(Long id) {
        def detalleInstance = Detalle.get(id)
        if (!detalleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'detalle.label', default: 'Detalle'), id])
            redirect(action: "list")
            return
        }

        [detalleInstance: detalleInstance]
    }

    def update(Long id, Long version) {
        def detalleInstance = Detalle.get(id)
        if (!detalleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'detalle.label', default: 'Detalle'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (detalleInstance.version > version) {
                detalleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'detalle.label', default: 'Detalle')] as Object[],
                          "Another user has updated this Detalle while you were editing")
                render(view: "edit", model: [detalleInstance: detalleInstance])
                return
            }
        }

        detalleInstance.properties = params

        if (!detalleInstance.save(flush: true)) {
            render(view: "edit", model: [detalleInstance: detalleInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'detalle.label', default: 'Detalle'), detalleInstance.id])
        redirect(action: "show", id: detalleInstance.id)
    }

    def delete(Long id) {
        def detalleInstance = Detalle.get(id)
        if (!detalleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'detalle.label', default: 'Detalle'), id])
            redirect(action: "list")
            return
        }

        try {
            detalleInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'detalle.label', default: 'Detalle'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'detalle.label', default: 'Detalle'), id])
            redirect(action: "show", id: id)
        }
    }
}
