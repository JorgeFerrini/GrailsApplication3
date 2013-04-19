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
    
    def compra (){
        
        Date fecha = new Date()
        this.fechaCompra = fecha
        this.fechaEntrega = fecha
        this.status = "EN PROCESO"
        
        
    }
    
}
