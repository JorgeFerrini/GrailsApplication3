package grailsapplication3

class Usuario {
    
    String nombreUser
    String apellidoUser
    String identificadorUser 
    String tipoIdUser
    String emailUser
    Date   fechaNacimientoUser
    Date   fechaRegistroUser
    String activacionUser    
    String idGoogle 
      
    
    
    static hasMany = [ compras:Compra, tarjetas:Tarjetacredito, calificaciones: Calificacion, lugares: Lugar]
    //static belongsTo = [lugar:Lugar]
    
    static String valorInicialValidacion = 'NO'
    
    
    static constraints = {
        nombreUser          (size:3..25)
        apellidoUser        (size:2..25)
        identificadorUser   (size:1..20)
        tipoIdUser          (inList:['CEDULA','PASAPORTE'])
        emailUser           (email:true)        
        activacionUser      (inList:['SI','NO'])
               
    }
    
    //Los clientes nuevos no deberian saber si estan activados o no es un atributo que no deben mmodificar ellos directamente
    
    
    
    def Usuario(){
        
        Date fecha = new Date()
        this.activacionUser = valorInicialValidacion
        this.fechaRegistroUser = fecha
        
    }
    
    
}
