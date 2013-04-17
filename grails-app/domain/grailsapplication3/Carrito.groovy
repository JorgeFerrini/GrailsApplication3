package grailsapplication3

class Carrito {

    Integer numeroProductos
    Integer [] idProductos
    String  [] nombreProductos
    Long    [] cantidadProductos
    Long    [] precioProductos
    
    
    def Carrito (){
        
        this.numeroProductos = 0
        println("este es el valor de la cantidad d productos en el carrito"+numeroProductos)
        this.idProductos     =      [0,0,0,0,0,0,0,0,0,0]
        this.cantidadProductos =    [0,0,0,0,0,0,0,0,0,0]
        this.nombreProductos =      [0,0,0,0,0,0,0,0,0,0]
        this.precioProductos =      [0,0,0,0,0,0,0,0,0,0]
    }
    
    
    def agregarCarrito(Integer id, String nombre, Long precio, Long cantidad){
        
        println("esta es la cantidad de productos que hay"+numeroProductos)
        this.idProductos       [this.numeroProductos]       = id
        this.nombreProductos   [this.numeroProductos]       = nombre
        this.precioProductos   [this.numeroProductos]       = precio
        this.cantidadProductos [this.numeroProductos]       = cantidad
        
        this.numeroProductos ++       
        
    }
}
