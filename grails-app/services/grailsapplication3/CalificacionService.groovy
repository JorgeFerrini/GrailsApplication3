package grailsapplication3
import java.text.SimpleDateFormat
//import GrailsApplication3.Usuario

class CalificacionService {

    
    def serviceMethod() {

    }
     def convertirFecha (fecha){
       
       String fecha2 = (String) fecha
       SimpleDateFormat formatoDeFecha = new SimpleDateFormat("dd/MM/yy")
       
       println(fecha2)
       Date fechaCambiada = new Date()
       
       fechaCambiada = formatoDeFecha.parse(fecha2)
       
              
       return fechaCambiada
   }
   
      def guardarCalificacion(calificado){
        
        def calificacionInstance
        
        calificacionInstance = calificado
        
        if(!calificacionInstance.save(flush:true)){
            
            return false
        }
        
        return true
    }
    
}