package grailsapplication3

import org.springframework.dao.DataIntegrityViolationException
import grailsapplication3.Carrito
import grails.converters.*
import grails.converters.XML

class UsuarioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def usuarioService
    
    def rest = {
        
        switch (request.method){
            
            case 'GET': doGet(params)
            break
            case 'PUT': doPut(params)
            break
            case 'POST': doPost(params)
            break
              
            
        }
        
        
        
    }
    
    private void doPut(params){
        
        def p = Usuario.get(params.id)
        
        p.properties = params.usuario
        
        if(p.save()){
            
                render p as XML
            
        }else{
            
            response.status = 500
            render p.errors as XML
            
        }
        
    }
    
    private void doPost(params){
        
        def p = new Usuario()
        def d = request.XML
        String xml 
        
        
        
        p.nombreUser = d.nombreUser
        usuarioService.imprimirAlgo(p.nombreUser)
        p.apellidoUser = d.apellidoUser
        usuarioService.imprimirAlgo(p.apellidoUser)
        p.identificadorUser = d.identificadorUser
        usuarioService.imprimirAlgo(p.identificadorUser)
        p.tipoIdUser = d.tipoIdUser
        usuarioService.imprimirAlgo(p.tipoIdUser)
        p.emailUser = d.emailUser
        usuarioService.imprimirAlgo(p.emailUser)
        
        p.fechaNacimientoUser = usuarioService.convertirFecha( d.fechaNacimientoUser)
        
        p.idGoogle = d.idGoogle 
        usuarioService.imprimirAlgo(p.idGoogle)
        
        if (p.save()){
            
            render p as XML
            usuarioService.leeXml(p.toString()) 
        }else{
            
            response.status = 500
            render p.errors as XML
        }
        
    }
    
    
    def index() {
        redirect(action: "create", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [usuarioInstanceList: Usuario.list(params), usuarioInstanceTotal: Usuario.count()]
    }

    def create() {
        [usuarioInstance: new Usuario(params)]
    }

    def save() {
        params.idGoogle = session.IdGoogleS
        params.emailUser = session.Email
        def usuarioInstance = new Usuario(params)
       

        
        session.IdGoogleS = null
        
        
        
        if (!usuarioInstance.save(flush: true)) {
            render(view: "create", model: [usuarioInstance: usuarioInstance])
            return
        }
        session.Id = usuarioInstance.id
        flash.message = message(code: 'default.created.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuarioInstance.id])
        redirect(controller: "EmailConfirmacion" , action: "send")
      
    }

    def show(Long id) {
        def usuarioInstance = Usuario.get(id)
        if (!usuarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), id])
            redirect(action: "list")
            return
        }

        [usuarioInstance: usuarioInstance]
    }

    def edit(Long id) {
        def usuarioInstance = Usuario.get(id)
        if (!usuarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), id])
            redirect(action: "list")
            return
        }

        [usuarioInstance: usuarioInstance]
    }

    def update(Long id, Long version) {
        def usuarioInstance = Usuario.get(id)
        if (!usuarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (usuarioInstance.version > version) {
                usuarioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'usuario.label', default: 'Usuario')] as Object[],
                          "Another user has updated this Usuario while you were editing")
                render(view: "edit", model: [usuarioInstance: usuarioInstance])
                return
            }
        }

        usuarioInstance.properties = params

        if (!usuarioInstance.save(flush: true)) {
            render(view: "edit", model: [usuarioInstance: usuarioInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuarioInstance.id])
        redirect(controller: "EmailConfirmacion" , action: "send2")
       // redirect(action: "show", id: usuarioInstance.id)
    }

    def delete(Long id) {
        def usuarioInstance = Usuario.get(id)
        if (!usuarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), id])
            redirect(action: "list")
            return
        }

        try {
            usuarioInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'usuario.label', default: 'Usuario'), id])
            session.Usuario = null
            session.Carrito = null
            redirect(controller: "categoria" , action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'usuario.label', default: 'Usuario'), id])
            redirect(action: "show", id: id)
        }
    }
    
     def login (){
        
        def usuarioInstance = Usuario.findByEmailUser(params.username)
        def carritoInstance = new Carrito()
        
        if (usuarioInstance) {
            flash.message2 = "login succeed"
            session.Usuario = usuarioInstance
            session.Carrito = carritoInstance
            session.ip= java.net.InetAddress.getLocalHost().getHostAddress()
//            if (!carritoInstance){
//                
//                println "esta vaina no esta haciendo el new"
//            }else{
//                carritoInstance.agregarCarrito(1,"prueba",450)
//                carritoInstance.agregarCarrito(2,"prueba",450)
//                session.Carrito = carritoInstance
//                println "DE BOLAS Q ENTRO"
//                
//            }
        redirect( action:"show", id : usuarioInstance.id)    
        } else{
            flash.message2 = "login failed"   
            redirect ( controller: "Categoria", action: "list")
        }
        
        
    }
    
    def logOut(){
        
        session.Usuario = null
        session.Carrito = null
        redirect( controller : "Categoria", action:"list")
        
        
    }
    
def janrainMobileSignIn () {
        usuarioService.imprimirAlgo()
        session.ip= java.net.InetAddress.getLocalHost().getHostAddress()
        println(session.ip)
        def apiKey = "23aad57369dcde2d4123253ab185041084cf4f68"
        def rpxnow = "https://rpxnow.com"
        def auth_info_url = new URL(
            rpxnow + "/api/v2/auth_info?apiKey="
            + apiKey + "&token=" + params.token)
            
        def connection = auth_info_url.openConnection()
        connection.connect()
        def auth_info_response = connection.content.text
        def auth_info = JSON.parse(auth_info_response)
        
        def identifier = auth_info.profile.identifier
        def email = auth_info.profile.verifiedEmail
        def name = auth_info.profile.displayName
        
        println("valor del identificador google "+identifier)
        println("valor del email  google "+email)
        println("valor del nombre google "+name)
        
        String[] idGoogle = identifier.split("/")
        println("valor del id google "+idGoogle[4])
     /*   def user = User.findWhere(engageIdentifier:identifier)
        if (!user) user = createUserWithAuthInfo(auth_info)
        
        // You should specify a long session timeout for mobile
        // sign-ins, this would be ~10 years:
        session.maxInactiveInterval = 60*60*24*7*52*10
        session.user = user */
        
        //def usuarioInstance = Usuario.findByEmailUser(params.username)
         def usuarioInstance = Usuario.findByIdGoogle(idGoogle[4])
         def carritoInstance = new Carrito()
         session.IdGoogleS = idGoogle[4]
         session.Email= email   
         println("valor del id google en sesion" + session.IdGoogleS )
        
        if (usuarioInstance) {
            
            if (usuarioInstance.activacionUser == "SI"){
            flash.message2 = "login succeed"
            session.Usuario = usuarioInstance
            session.Carrito = carritoInstance
            redirect( action:"show", id : usuarioInstance.id)    
        }else{
                redirect( action: "verificarCuenta")
                
        }
        
//            if (!carritoInstance){
//                
//                println "esta vaina no esta haciendo el new"
//            }else{
//                carritoInstance.agregarCarrito(1,"prueba",450)
//                carritoInstance.agregarCarrito(2,"prueba",450)
//                session.Carrito = carritoInstance
//                println "DE BOLAS Q ENTRO"
//                
//            }
        
        } else{
            flash.message2 = "login failed"   
            redirect ( action: "create" )
        }
      //  render "Sign-in successful"
    }
    
    
       def verificar (Long id) {
           
           
           def carritoInstance = new Carrito()
           def usuarioInstance = Usuario.findById(id)
           if (usuarioInstance){
           usuarioInstance.activacionUser = "SI"
           session.Usuario = usuarioInstance
           session.Carrito = carritoInstance           
           redirect(action: "show" , id: usuarioInstance.id)
           }else{
               redirect(controller: "Categoria" , action: "list" )
            
           }


        
    }
    
        def verificarCuenta (){           
            
        
        }
        
        def mInicio (){
               
        
        }
        
        def mlogin (){
        
        def usuarioInstance = Usuario.findByEmailUserAndPassword(params.username,params.password)
        
        
        
        def carritoInstance = new Carrito()
        
        if (usuarioInstance) {
            
            flash.message2 = "login succeed"
            session.Usuario = usuarioInstance
            session.Carrito = carritoInstance
            session.ip= java.net.InetAddress.getLocalHost().getHostAddress()
//            if (!carritoInstance){
//                
//                println "esta vaina no esta haciendo el new"
//            }else{
//                carritoInstance.agregarCarrito(1,"prueba",450)
//                carritoInstance.agregarCarrito(2,"prueba",450)
//                session.Carrito = carritoInstance
//                println "DE BOLAS Q ENTRO"
//                
//            }
            session.Inicio = 0;
            println("AQUIIII")
            
        } else{
            println("AQUIIII2")
            flash.message2 = "login failed"
            session.Inicio = 1;
            redirect ( controller: "Usuario", action: "mInicio")
        }
        
        
    }
    
    def mlogOut(){
        
        session.Usuario = null
        session.Carrito = null
        redirect( controller : "Usuario", action:"mInicio")
        
        
    }
    
}
