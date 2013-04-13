package grailsapplication3
import  grailsapplication3.Categoria
import  grailsapplication3.Lugar
import  grailsapplication3.ProductosController

import org.springframework.dao.DataIntegrityViolationException

class PruebaListMuchasCosasController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    
    def index() { 
    
    redirect(action: "new_view", params: params)
    
    }
    
    def new_view() {       
        
        [categoriaInstanceList: Categoria.list(params), categoriaInstanceTotal: Categoria.count()]      
        
    }
    
    
}
