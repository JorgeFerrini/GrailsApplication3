package grailsapplication3

class Calificacion {

    Integer         valorCalificacion
    String          comentario
    Date            fechaCalificacion
    
    
    
    
    static belongsTo = [usuario:Usuario, producto:Productos]
    
    static constraints = {
        
        
    }
}
