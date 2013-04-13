package grailsapplication3

class Categoria {
    
    String nombre
    
    static hasMany = [ produtor:Productos]

    static constraints = {
        
        nombre (size:2..50)
    }
}
