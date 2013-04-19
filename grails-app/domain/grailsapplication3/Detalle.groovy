package grailsapplication3

class Detalle {
    
    Integer     cantidad
    
    

    static belongsTo = [productos :Productos, compra:Compra]
    
    def detalle( Integer cantidad, Productos producto, Compra compra){
        
        this.cantidad = cantidad
        this.productos = producto
        this.compra = compra
        
    }
}
