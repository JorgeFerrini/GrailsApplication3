package grailsapplication3

import org.springframework.dao.DataIntegrityViolationException

class CompraController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [compraInstanceList: Compra.list(params), compraInstanceTotal: Compra.count()]
    }

    def create() {
        [compraInstance: new Compra(params)]
    }

    def save() {
        def compraInstance = new Compra(params)
        if (!compraInstance.save(flush: true)) {
            render(view: "create", model: [compraInstance: compraInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'compra.label', default: 'Compra'), compraInstance.id])
        redirect(action: "show", id: compraInstance.id)
    }

    def show(Long id) {
        def compraInstance = Compra.get(id)
        if (!compraInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'compra.label', default: 'Compra'), id])
            redirect(action: "list")
            return
        }

        [compraInstance: compraInstance]
    }

    def edit(Long id) {
        def compraInstance = Compra.get(id)
        if (!compraInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'compra.label', default: 'Compra'), id])
            redirect(action: "list")
            return
        }

        [compraInstance: compraInstance]
    }

    def update(Long id, Long version) {
        def compraInstance = Compra.get(id)
        if (!compraInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'compra.label', default: 'Compra'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (compraInstance.version > version) {
                compraInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'compra.label', default: 'Compra')] as Object[],
                          "Another user has updated this Compra while you were editing")
                render(view: "edit", model: [compraInstance: compraInstance])
                return
            }
        }

        compraInstance.properties = params

        if (!compraInstance.save(flush: true)) {
            render(view: "edit", model: [compraInstance: compraInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'compra.label', default: 'Compra'), compraInstance.id])
        redirect(action: "show", id: compraInstance.id)
    }

    def delete(Long id) {
        def compraInstance = Compra.get(id)
        if (!compraInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'compra.label', default: 'Compra'), id])
            redirect(action: "list")
            return
        }

        try {
            compraInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'compra.label', default: 'Compra'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'compra.label', default: 'Compra'), id])
            redirect(action: "show", id: id)
        }
    }
}
