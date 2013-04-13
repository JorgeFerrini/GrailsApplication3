package grailsapplication3

class Detalle {
    
    Integer     cantidad
    Long        total
    
    

    static belongsTo = [productos :Productos, compra:Compra]
    
    static constraints = {
        
        total (nulleable:true)
    }
}
