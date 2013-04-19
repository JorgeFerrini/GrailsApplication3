package grailsapplication3

class Compra {
    
    String                  status
    Date            fechaCompra
    Date            fechaEntrega
    
    
      
    static belongsTo = [usuario : Usuario , tarjeta : Tarjetacredito]
    static hasMany = [ detalles:Detalle]
    
    static constraints = {
        status              (inList:['EN PROCESO','ENTREGADO'])
        fechaEntrega        (nullable: true)
        
    }
    
    
    
}
