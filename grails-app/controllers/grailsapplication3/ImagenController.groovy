package grailsapplication3

import org.springframework.dao.DataIntegrityViolationException

class ImagenController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [imagenInstanceList: Imagen.list(params), imagenInstanceTotal: Imagen.count()]
    }

    def create() {
        [imagenInstance: new Imagen(params)]
    }

    def save() {
        def imagenInstance = new Imagen(params)
        if (!imagenInstance.save(flush: true)) {
            render(view: "create", model: [imagenInstance: imagenInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'imagen.label', default: 'Imagen'), imagenInstance.id])
        redirect(action: "show", id: imagenInstance.id)
    }

    def show(Long id) {
        def imagenInstance = Imagen.get(id)
        if (!imagenInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'imagen.label', default: 'Imagen'), id])
            redirect(action: "list")
            return
        }

        [imagenInstance: imagenInstance]
    }

    def edit(Long id) {
        def imagenInstance = Imagen.get(id)
        if (!imagenInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'imagen.label', default: 'Imagen'), id])
            redirect(action: "list")
            return
        }

        [imagenInstance: imagenInstance]
    }

    def update(Long id, Long version) {
        def imagenInstance = Imagen.get(id)
        if (!imagenInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'imagen.label', default: 'Imagen'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (imagenInstance.version > version) {
                imagenInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'imagen.label', default: 'Imagen')] as Object[],
                          "Another user has updated this Imagen while you were editing")
                render(view: "edit", model: [imagenInstance: imagenInstance])
                return
            }
        }

        imagenInstance.properties = params

        if (!imagenInstance.save(flush: true)) {
            render(view: "edit", model: [imagenInstance: imagenInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'imagen.label', default: 'Imagen'), imagenInstance.id])
        redirect(action: "show", id: imagenInstance.id)
    }

    def delete(Long id) {
        def imagenInstance = Imagen.get(id)
        if (!imagenInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'imagen.label', default: 'Imagen'), id])
            redirect(action: "list")
            return
        }

        try {
            imagenInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'imagen.label', default: 'Imagen'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'imagen.label', default: 'Imagen'), id])
            redirect(action: "show", id: id)
        }
    }
}
