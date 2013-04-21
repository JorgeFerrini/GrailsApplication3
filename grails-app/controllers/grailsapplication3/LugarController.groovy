package grailsapplication3

import org.springframework.dao.DataIntegrityViolationException

class LugarController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [lugarInstanceList: Lugar.list(params), lugarInstanceTotal: Lugar.count()]
    }

    def create() {
        [lugarInstance: new Lugar(params)]
    }

    def save() {
        def lugarInstance = new Lugar(params)
        if (!lugarInstance.save(flush: true)) {
            render(view: "create", model: [lugarInstance: lugarInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'lugar.label', default: 'Lugar'), lugarInstance.id])
        redirect(action: "show", id: lugarInstance.id)
    }

    def show(Long id) {
        def lugarInstance = Lugar.get(id)
        if (!lugarInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'lugar.label', default: 'Lugar'), id])
            redirect(action: "list")
            return
        }

        [lugarInstance: lugarInstance]
    }

    def edit(Long id) {
        def lugarInstance = Lugar.get(id)
        if (!lugarInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'lugar.label', default: 'Lugar'), id])
            redirect(action: "list")
            return
        }

        [lugarInstance: lugarInstance]
    }

    def update(Long id, Long version) {
        def lugarInstance = Lugar.get(id)
        if (!lugarInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'lugar.label', default: 'Lugar'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (lugarInstance.version > version) {
                lugarInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'lugar.label', default: 'Lugar')] as Object[],
                          "Another user has updated this Lugar while you were editing")
                render(view: "edit", model: [lugarInstance: lugarInstance])
                return
            }
        }

        lugarInstance.properties = params

        if (!lugarInstance.save(flush: true)) {
            render(view: "edit", model: [lugarInstance: lugarInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'lugar.label', default: 'Lugar'), lugarInstance.id])
        redirect(action: "show", id: lugarInstance.id)
    }

    def delete(Long id) {
        def lugarInstance = Lugar.get(id)
        if (!lugarInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'lugar.label', default: 'Lugar'), id])
            redirect(action: "list")
            return
        }

        try {
            lugarInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'lugar.label', default: 'Lugar'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'lugar.label', default: 'Lugar'), id])
            redirect(action: "show", id: id)
        }
    }
}
