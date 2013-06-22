package grailsapplication3

import org.springframework.dao.DataIntegrityViolationException
import java.lang.*
import grails.converters.XML
import org.apache.commons.logging.*

class ProductosController {
    private static Log log = LogFactory.getLog("bitacora."+ProductosController.class.getName())
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def productosService
    
        def rest = {
        log.info("Definicion de metodos del webservice para busqueda de productos")
        switch (request.method){
            case 'GET':
                doGet(params)
                break;
            case 'POST':
                doPost(params)
                break;
            case 'PUT':
                doPut(params)
                break;
            case 'DELETE':
                doDelete(params)
                break;
                
        }
    }
    
     def rest2 = {
         log.info("Definicion de metodos del webservice para cantidad de paginas")
        switch (request.method){
            case 'GET':
                doGet2(params)
                break;
            case 'POST':
                doPost(params)
                break;
            case 'PUT':
                doPut(params)
                break;
            case 'DELETE':
                doDelete(params)
                break;
                
        }
    }
    
    

    
 private void doGet(params) {
        log.info("Devuelve el XML con la busqueda de productos")
        //def productosInstanceList
        //def p = Productos.get(params.id)
        //def p = Productos.findAllByNombreIlike(params.id)
        def p = productosService.buscandoProductos(params.id)
        //productosService.imprimeCualquierVaina()
        //def p = Productos.findAllByIdIlike(params.id)
        //def p = productosService.busquedaProducto(16)
        println(p)
            
            render p as XML
            //render p as XML
            
        productosService.actualizarRuta(p)
    }
    
        
    private void doGet2(params) {
        log.info("Devuelve el XML con la cantidad de paginas")
        //def productosInstanceList
        //def p = Productos.get(params.id)
        //def p = Productos.findAllByNombreIlike(params.id)
        def c = productosService.CantidadPaginas(params.id)
        //def p = productosService.buscandoProductos(params.id)
        //productosService.imprimeCualquierVaina()
        //def p = Productos.findAllByIdIlike(params.id)
        //def p = productosService.busquedaProducto(16)
      //  c = "<?xml version=\"1.0\" encoding=\"UTF-8\"?> <paginas>"+c+"</paginas>"
        render (text:"<paginas>"+c+"</paginas>",contentType:"text/xml",enconding:"UTF-8") as XML
    }
    

    def index() {
        
        redirect(action: "list", params: params)
        
        
    }

    def list(Integer max) {
        log.error("Hay un error con un producto")
        params.max = Math.min(max ?: 10, 100)
        [productosInstanceList: Productos.list(params), productosInstanceTotal: Productos.count()]
        
    }
    
    def mlist(Integer max) {
        log.error("Hay un error con un producto")
        params.max = Math.min(max ?: 10, 100)
        [productosInstanceList: Productos.list(params), productosInstanceTotal: Productos.count()]
        
    }

    def create() {
        [productosInstance: new Productos(params)]
    }

    def save() {
        def productosInstance = new Productos(params)
        if (!productosInstance.save(flush: true)) {
            render(view: "create", model: [productosInstance: productosInstance])
            return 
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'productos.label', default: 'Productos'), productosInstance.id])
        redirect(action: "show", id: productosInstance.id)
    }

    def show(Long id) {
        def productosInstance = Productos.get(id)
        if (!productosInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'productos.label', default: 'Productos'), id])
            redirect(action: "list")
            return
        }

        [productosInstance: productosInstance]
    }
    
    def mshow(Long id) {
        def productosInstance = Productos.get(id)
        if (!productosInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'productos.label', default: 'Productos'), id])
            redirect(action: "list")
            return
        }

        [productosInstance: productosInstance]
    }
    
    
    def showFiltering(Integer max) {
        
        //params.max = Math.min(max ?: 10, 100)   
        def nombre = params.nombre
        println("prueba"+nombre)        
        String palabraClave1
        String palabraClave2
        String palabraClave3
        def list
        def productosInstanceList        
        def productosInstanceList2
        
        list = [null,null,null]        
       
        if(nombre != null){            
            list = nombre.split(' ')            
            println(list)            
        }       
        
        
        try{
            println("se tiene todas")
            palabraClave3 = list[2]
            
            palabraClave2 = list[1]
            palabraClave1 = list[0]
            productosInstanceList2 = Productos.findAllByNombreIlikeOrNombreIlike("%"+palabraClave1+"%"+palabraClave2+"%"+palabraClave3+"%",
            "%"+palabraClave1+"%"+palabraClave3+"%"+palabraClave2+"%")
            productosInstanceList = Productos.findAllByNombreIlikeOrNombreIlike("%"+palabraClave1+"%"+palabraClave2+"%"+palabraClave3+"%",
            "%"+palabraClave1+"%"+palabraClave3+"%"+palabraClave2+"%", params)
            
        }catch(Throwable e){
            
            println("no se tiene la 3")
            try{
                
            println("se tiene la 1 y 2")
            palabraClave2 = list[1]
            palabraClave1 = list[0]
            productosInstanceList2 = Productos.findAllByNombreIlikeOrNombreIlike("%"+palabraClave1+"%"+palabraClave2+"%","%"+palabraClave2+"%"+palabraClave1+"%")
            productosInstanceList = Productos.findAllByNombreIlikeOrNombreIlike("%"+palabraClave1+"%"+palabraClave2+"%","%"+palabraClave2+"%"+palabraClave1+"%", params)
            
            }
            catch(Throwable e2){
                println("no se tiene la 2")
                try{
                    
                    println("se tiene la 1")
                    palabraClave1 = list[0]
                    productosInstanceList2 = Productos.findAllByNombreIlike("%"+palabraClave1+"%")
                    productosInstanceList = Productos.findAllByNombreIlike("%"+palabraClave1+"%", params)
                   
                }
                catch(Throwable e3){
                    
                    println("no se tienen ninguna kjshdaksjhdkas")
                    
                }                
                
            }
            
            
        }        
        
        //render(template="Productos" ,view: "showFiltering.gsp", "prueba aklanklANSLA")
        
        [productosInstanceList: productosInstanceList]
        //[productosInstanceList: productosInstanceList.asList() , productosInstanceTotal: productosInstanceList2.size() ]
        //render(view: "showFiltering", model: [productosInstanceList: productosInstanceList])            
    }
    

    def edit(Long id) {
        def productosInstance = Productos.get(id)
        if (!productosInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'productos.label', default: 'Productos'), id])
            redirect(action: "list")
            return
        }

        [productosInstance: productosInstance]
    }

    def update(Long id, Long version) {
        def productosInstance = Productos.get(id)
        if (!productosInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'productos.label', default: 'Productos'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (productosInstance.version > version) {
                productosInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'productos.label', default: 'Productos')] as Object[],
                          "Another user has updated this Productos while you were editing")
                render(view: "edit", model: [productosInstance: productosInstance])
                return
            }
        }

        productosInstance.properties = params

        if (!productosInstance.save(flush: true)) {
            render(view: "edit", model: [productosInstance: productosInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'productos.label', default: 'Productos'), productosInstance.id])
        redirect(action: "show", id: productosInstance.id)
    }

    def delete(Long id) {
        def productosInstance = Productos.get(id)
        if (!productosInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'productos.label', default: 'Productos'), id])
            redirect(action: "list")
            return
        }

        try {
            productosInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'productos.label', default: 'Productos'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'productos.label', default: 'Productos'), id])
            redirect(action: "show", id: id)
        }
    }
    
    def addToCarrito (Integer id, String nombre, Long precio, Long cantidad){
        
        println("valor del id: " +id)
        println("valor del nombre " +nombre)
        println("valor del precio "+ precio)
        println("valor de la cantidad "+cantidad)
        
        String respuestaCarrito = true
        
        //def carritoInstance = new Carrito()
        
        //carritoInstance.agregarCarrito(id,nombre,precio,cantidad)
        respuestaCarrito = session.Carrito.agregarCarrito(id,nombre,precio,cantidad)
        
        println("estos son los id de los productos"+session.Carrito.idProductos)
        if(respuestaCarrito){
            
            redirect(action: "show", id: id)
        }else{
            
            redirect(action: "show", id: id)            
        }
        
        
    }
    
    def addToCarritom (Integer id, String nombre, Long precio, Long cantidad){
        
        println("valor del id: " +id)
        println("valor del nombre " +nombre)
        println("valor del precio "+ precio)
        println("valor de la cantidad "+cantidad)
        
        String respuestaCarrito = true
        
        //def carritoInstance = new Carrito()
        
        //carritoInstance.agregarCarrito(id,nombre,precio,cantidad)
        respuestaCarrito = session.Carrito.agregarCarrito(id,nombre,precio,cantidad)
        
        println("estos son los id de los productos"+session.Carrito.idProductos)
        if(respuestaCarrito){
            
            redirect(action: "mshow", id: id)
        }else{
            
            redirect(action: "mshow", id: id)            
        }
        
        
    }
    
    def removeCarrito (Integer id){
        
        String respuestaCarrito = true
        
        respuestaCarrito = session.Carrito.elimarDeCarrito(id)
        
        if (respuestaCarrito){
            
            redirect (action: "showCarrito")
        }else{
            
            redirect (action: "showCarrito")            
            
        }
        
    }
    
        def mremoveCarrito (Integer id){
        
        String respuestaCarrito = true
        
        respuestaCarrito = session.Carrito.elimarDeCarrito(id)
        
        if (respuestaCarrito){
            
            redirect (action: "mshowCarrito")
        }else{
            
            redirect (action: "mshowCarrito")            
            
        }
        
    }
    
    
    
    def showCarrito(){
        
        render (view: "showCarrito")
    }
    
    def mshowCarrito(){
        
        render (view: "mshowCarrito")
    }
}
