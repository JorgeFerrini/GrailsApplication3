package grailsapplication3

import org.springframework.dao.DataIntegrityViolationException

class CarritoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [carritoInstanceList: Carrito.list(params), carritoInstanceTotal: Carrito.count()]
    }

    def create() {
        [carritoInstance: new Carrito(params)]
    }

    def save() {
        def carritoInstance = new Carrito(params)
        if (!carritoInstance.save(flush: true)) {
            render(view: "create", model: [carritoInstance: carritoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'carrito.label', default: 'Carrito'), carritoInstance.id])
        redirect(action: "show", id: carritoInstance.id)
    }

    def show(Long id) {
        def carritoInstance = Carrito.get(id)
        if (!carritoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'carrito.label', default: 'Carrito'), id])
            redirect(action: "list")
            return
        }

        [carritoInstance: carritoInstance]
    }

    def edit(Long id) {
        def carritoInstance = Carrito.get(id)
        if (!carritoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'carrito.label', default: 'Carrito'), id])
            redirect(action: "list")
            return
        }

        [carritoInstance: carritoInstance]
    }

    def update(Long id, Long version) {
        def carritoInstance = Carrito.get(id)
        if (!carritoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'carrito.label', default: 'Carrito'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (carritoInstance.version > version) {
                carritoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'carrito.label', default: 'Carrito')] as Object[],
                          "Another user has updated this Carrito while you were editing")
                render(view: "edit", model: [carritoInstance: carritoInstance])
                return
            }
        }

        carritoInstance.properties = params

        if (!carritoInstance.save(flush: true)) {
            render(view: "edit", model: [carritoInstance: carritoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'carrito.label', default: 'Carrito'), carritoInstance.id])
        redirect(action: "show", id: carritoInstance.id)
    }

    def delete(Long id) {
        def carritoInstance = Carrito.get(id)
        if (!carritoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'carrito.label', default: 'Carrito'), id])
            redirect(action: "list")
            return
        }

        try {
            carritoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'carrito.label', default: 'Carrito'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'carrito.label', default: 'Carrito'), id])
            redirect(action: "show", id: id)
        }
    }
}
