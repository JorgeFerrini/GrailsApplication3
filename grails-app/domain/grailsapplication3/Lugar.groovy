package grailsapplication3

class Lugar {
    
    String nombreLugar
    String tipoLugar    
    String direccion
    
    //static hasMany = [ lugares:Lugar,usuarios:Usuario]
    static hasMany = [ lugares:Lugar]
    static belongsTo = [lugar:Lugar, usuario:Usuario]
    

    static constraints = {
        
        lugar (nullable:true)
        usuario (nullable:true)
        tipoLugar      (inList:['CONTINENTE','PAIS','CIUDAD','DIRECCION'])

    }
}
