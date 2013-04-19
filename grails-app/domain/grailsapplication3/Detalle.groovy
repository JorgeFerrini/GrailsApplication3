package grailsapplication3

class Detalle {
    
    Integer     cantidad
    
    

    static belongsTo = [productos :Productos, compra:Compra]
    
    
}
