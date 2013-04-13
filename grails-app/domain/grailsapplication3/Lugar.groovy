package grailsapplication3

class Lugar {
    
    String nombreLugar
    String tipoLugar
    
    static hasMany = [ lugares:Lugar,usuarios:Usuario]
    
    static belongsTo = [lugar:Lugar]
    

    static constraints = {
        
        lugar (nulleable:true)
        tipoLugar      (inList:['CONTINENTE','PAIS','CIUDAD'])

    }
}
