package grailsapplication3

class EmailConfirmacionController {

    def index() { 
    redirect (action: "send")
    }
    
    def send = {
        def usuarioInstance = Usuario.findById(session.Id)
       sendMail {
            
            to session.Email            
            subject "Le Cloud Products"
            body 'Bienvenido, usuario: '+usuarioInstance.nombreUser+' '+usuarioInstance.apellidoUser+'. Para confirmar su cuenta vaya al siguiente LINK: http://localhost:3306/GrailsApplication3/usuario/verificar/'+session.Id
           }
           session.Email= null
           println("Email Sent!")
           redirect(controller: "Usuario" , action: "show", id: session.Id)
    }
    
        def send2 = {
        def usuarioInstance = Usuario.findById(session.Usuario.id)
       sendMail {
            
            to session.Email            
            subject "Le Cloud Products"
            body 'Hola, usuario: '+usuarioInstance.nombreUser+' '+usuarioInstance.apellidoUser+'. Tu perfil ha sido modificado!'
           }
           session.Email= null
           println("Email Sent!")
           redirect(controller: "Usuario" , action: "show", id: usuarioInstance.id)
    }
    
}



