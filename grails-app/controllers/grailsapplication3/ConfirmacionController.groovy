package grailsapplication3

class ConfirmacionController {

  
        def index() { 
    redirect (action: "confi")
    }
    
    def confi = {
        def usuarioInstance = Usuario.getEmailUser()
    
    }
    
    
    
    
}
