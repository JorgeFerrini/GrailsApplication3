package grailsapplication3

import org.springframework.dao.DataIntegrityViolationException
import org.apache.commons.logging.*

class CategoriaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    private static Log log = LogFactory.getLog("bitacora."+CategoriaController.class.getName())

    def index() {
        redirect(action: "list", params: params)
        
        
    }

    def list(Integer max) {
        log.info "Listado de Categoria"
        params.max = Math.min(max ?: 10, 100)
        [categoriaInstanceList: Categoria.list(params), categoriaInstanceTotal: Categoria.count()]
    }
    
    def mlist(Integer max) {
        log.info "Listado de Categoria"
        params.max = Math.min(max ?: 10, 100)
        [categoriaInstanceList: Categoria.list(params), categoriaInstanceTotal: Categoria.count()]
    }

    def create() {
        [categoriaInstance: new Categoria(params)]
    }

    def save() {
        def categoriaInstance = new Categoria(params)
        if (!categoriaInstance.save(flush: true)) {
            render(view: "create", model: [categoriaInstance: categoriaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'categoria.label', default: 'Categoria'), categoriaInstance.id])
        redirect(action: "show", id: categoriaInstance.id)
    }

    def show(Long id) {
        def categoriaInstance = Categoria.get(id)
        if (!categoriaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'categoria.label', default: 'Categoria'), id])
            redirect(action: "list")
            return
        }

        [categoriaInstance: categoriaInstance]
    }
    
    def mshow(Long id) {
        def categoriaInstance = Categoria.get(id)
        if (!categoriaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'categoria.label', default: 'Categoria'), id])
            redirect(action: "list")
            return
        }

        [categoriaInstance: categoriaInstance]
    }

    def edit(Long id) {
        def categoriaInstance = Categoria.get(id)
        if (!categoriaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'categoria.label', default: 'Categoria'), id])
            redirect(action: "list")
            return
        }

        [categoriaInstance: categoriaInstance]
    }

    def update(Long id, Long version) {
        def categoriaInstance = Categoria.get(id)
        if (!categoriaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'categoria.label', default: 'Categoria'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (categoriaInstance.version > version) {
                categoriaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'categoria.label', default: 'Categoria')] as Object[],
                          "Another user has updated this Categoria while you were editing")
                render(view: "edit", model: [categoriaInstance: categoriaInstance])
                return
            }
        }

        categoriaInstance.properties = params

        if (!categoriaInstance.save(flush: true)) {
            render(view: "edit", model: [categoriaInstance: categoriaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'categoria.label', default: 'Categoria'), categoriaInstance.id])
        redirect(action: "show", id: categoriaInstance.id)
    }

    def delete(Long id) {
        def categoriaInstance = Categoria.get(id)
        if (!categoriaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'categoria.label', default: 'Categoria'), id])
            redirect(action: "list")
            return
        }

        try {
            categoriaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'categoria.label', default: 'Categoria'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'categoria.label', default: 'Categoria'), id])
            redirect(action: "show", id: id)
        }
    }
    
    
    def splitRuta  (int number, String ruta){
        
        String [] listaPalabras
        String directorio
        String archivo
        
        listaPalabras = ruta.split("/")
        if (number == 1){
            
            directorio = listaPalabras[0]+listaPalabras[1]
            directorio = '1'
            return directorio
        }
        else{
            
            archivo = listaPalabras[2]+'.jpg'
            archivo = '2'
            return archivo
            
        } 
        
    }
}
