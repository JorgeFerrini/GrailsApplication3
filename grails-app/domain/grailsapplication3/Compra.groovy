package grailsapplication3

class Compra {
    
    String          status
    Date            fechaCompra
    Date            fechaEntrega
    Tarjetacredito  tarjeta
    
      
    static belongsTo = [usuario : Usuario]
    static hasMany = [ detalles:Detalle]
    
    static constraints = {
        status              (inList:['EN PROCESO','ENTREGADO'])
        fechaEntrega        (nulleable:true)
        
    }
}
