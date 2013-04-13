package grailsapplication3

import org.springframework.dao.DataIntegrityViolationException

class TarjetacreditoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [tarjetacreditoInstanceList: Tarjetacredito.list(params), tarjetacreditoInstanceTotal: Tarjetacredito.count()]
    }

    def create() {
        [tarjetacreditoInstance: new Tarjetacredito(params)]
    }

    def save() {
        def tarjetacreditoInstance = new Tarjetacredito(params)
        if (!tarjetacreditoInstance.save(flush: true)) {
            render(view: "create", model: [tarjetacreditoInstance: tarjetacreditoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'tarjetacredito.label', default: 'Tarjetacredito'), tarjetacreditoInstance.id])
        redirect(action: "show", id: tarjetacreditoInstance.id)
    }

    def show(Long id) {
        def tarjetacreditoInstance = Tarjetacredito.get(id)
        if (!tarjetacreditoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tarjetacredito.label', default: 'Tarjetacredito'), id])
            redirect(action: "list")
            return
        }

        [tarjetacreditoInstance: tarjetacreditoInstance]
    }

    def edit(Long id) {
        def tarjetacreditoInstance = Tarjetacredito.get(id)
        if (!tarjetacreditoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tarjetacredito.label', default: 'Tarjetacredito'), id])
            redirect(action: "list")
            return
        }

        [tarjetacreditoInstance: tarjetacreditoInstance]
    }

    def update(Long id, Long version) {
        def tarjetacreditoInstance = Tarjetacredito.get(id)
        if (!tarjetacreditoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tarjetacredito.label', default: 'Tarjetacredito'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (tarjetacreditoInstance.version > version) {
                tarjetacreditoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'tarjetacredito.label', default: 'Tarjetacredito')] as Object[],
                          "Another user has updated this Tarjetacredito while you were editing")
                render(view: "edit", model: [tarjetacreditoInstance: tarjetacreditoInstance])
                return
            }
        }

        tarjetacreditoInstance.properties = params

        if (!tarjetacreditoInstance.save(flush: true)) {
            render(view: "edit", model: [tarjetacreditoInstance: tarjetacreditoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'tarjetacredito.label', default: 'Tarjetacredito'), tarjetacreditoInstance.id])
        redirect(action: "show", id: tarjetacreditoInstance.id)
    }

    def delete(Long id) {
        def tarjetacreditoInstance = Tarjetacredito.get(id)
        if (!tarjetacreditoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tarjetacredito.label', default: 'Tarjetacredito'), id])
            redirect(action: "list")
            return
        }

        try {
            tarjetacreditoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'tarjetacredito.label', default: 'Tarjetacredito'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tarjetacredito.label', default: 'Tarjetacredito'), id])
            redirect(action: "show", id: id)
        }
    }
}
