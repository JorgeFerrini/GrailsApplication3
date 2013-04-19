package grailsapplication3

class Tarjetacredito {
    
    Long    numero
    Integer codigoSeguridad
    String  marcaComercial
    Date    fechaVencimiento
    
    
    static hasMany = [ compras: Compra]
    static belongsTo = [usuario:Usuario]
    static constraints = {
        numero              (creditCard:true)
        codigoSeguridad     (size:3..5)
        marcaComercial      (inList:['VISA','MASTERCARD','AMERICAN'])
                
    }
    
    def Tarjetacredito (){
        
        
        
    }
}
