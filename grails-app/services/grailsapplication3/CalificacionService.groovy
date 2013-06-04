package grailsapplication3
import java.text.SimpleDateFormat
//import GrailsApplication3.Usuario
import org.apache.commons.logging.*

class CalificacionService {

      private static Log log = LogFactory.getLog("bitacora."+ProductosController.class.getName())
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
        
        if(!calificado.usuario){
            log.error("Falto el usuario por eso no se inserto")                           
        }
        if(!calificado.producto){
            log.error("Falto el producto por eso no se inserto")                           
        }
        
        if(!calificacionInstance.save(flush:true)){
            log.error("No se pudo hacer el save porque faltan datos")
            return false
        }
        log.info("Save exitoso")
        return true
    }
    
}