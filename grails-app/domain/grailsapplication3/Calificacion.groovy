package grailsapplication3

class Calificacion {

    Integer         valorCalificacion
    String          comentario
    Date            fechaCalificacion
    
    
    
    
    static belongsTo = [usuario:Usuario, producto:Productos]
    
    static constraints = {
        
    comentario (size:3..2500)
    valorCalificacion      (inList:[1,2,3,4,5])
    }
    
    
    def Calificacion(){
        
        Date fecha = new Date()        
        this.fechaCalificacion = fecha
        
        
    }
}
