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
        
        for (int i=0; i<=9;i++){
            
            if(this.idProductos[i] == 0){
                
                println("esta es la cantidad de productos que hay"+numeroProductos)
                this.idProductos       [i]       = id
                this.nombreProductos   [i]       = nombre
                this.precioProductos   [i]       = precio
                this.cantidadProductos [i]       = cantidad
        
                this.numeroProductos ++       
                return true
            }
            
        }
        
        return false
               
    }
    
    def elimarDeCarrito (Integer id){
        
        
        if (this.numeroProductos != 0){
            for (int i=0; i<=9 ;i++){
            
                if (this.idProductos[i] == id){
                    this.idProductos[i] = 0
                    this.nombreProductos[i] = 0
                    this.precioProductos[i] = 0
                    this.cantidadProductos[i] = 0
                    this.numeroProductos --
                    return true
                }
            
            }
        }else{
            
            return false
            
        }
        
        
    }
}
