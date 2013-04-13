package grailsapplication3

class Imagen {
    
    Integer ancho
    Integer alto
    String  directorioImagen
    String  rutaImagen
    
    static belongsTo = [producto:Productos]
    static constraints = {
    }
}
