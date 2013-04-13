package grailsapplication3

class Productos {
    
    String nombre
    String descripcion
    Long precio
    String directorio
    String archivo
    
    
    static hasMany = [ detalles:Detalle, calificaciones: Calificacion, imagenes:Imagen]
    static belongsTo = [categoria:Categoria]
    
    static constraints = {
        
        nombre (size:3..100)
        descripcion (size:20..3000)        
    }
}
