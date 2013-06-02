package grailsapplication3



import org.junit.*
import grails.test.*
import org.apache.commons.logging.*
/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
//@TestFor(CalificacionService)
class CalificacionServiceTests extends GrailsUnitTestCase {
 private static Log log = LogFactory.getLog("bitacora."+ProductosController.class.getName())
    void testSomething() {
        log.info("Prueba unitaria exitosa Calificacion")
        log.info("Se crea un objeto Calificacion generico y se le asignan valores")
        def srv = new CalificacionService()
        Calificacion cali = new Calificacion()
        cali.setComentario("Comentario Prueba")
        cali.setFechaCalificacion(srv.convertirFecha("12/03/2013"))
        cali.setValorCalificacion(5)
        log.info("Se crea un mock de Calificacion")
        def testInstances =[cali]
        mockDomain(Calificacion, testInstances)
        
        log.info("Se asignan usuario y producto a la Calificacion")
        def usu = new Usuario()
        usu.id= 393
        cali.usuario = usu
     
        def pro  = new Productos()
        pro.id= 116
        cali.producto = pro
        log.info("Se comprueba que la calificacion se guarde, haciendo una llamada al servicio")
        assertTrue   srv.guardarCalificacion(cali)
    }
    
        void testSomethingWrong() {
        
        log.info("Prueba unitaria fallida Calificacion")
       log.info("Se crea un objeto Calificacion generico y se le asignan valores, se genera el mock pero no se asigna usuario ni producto")
        def srv = new CalificacionService()
        Calificacion cali = new Calificacion()
        cali.setComentario("Comentario Prueba 2")
        cali.setFechaCalificacion(srv.convertirFecha("12/03/2013"))
        cali.setValorCalificacion(5) 
        def testInstances =[cali]
        mockDomain(Calificacion, testInstances)
//        def usu = new Usuario()
//        usu.id= 393
//        cali.usuario = usu
//     
//        def pro  = new Productos()
//        pro.id= 116
//        cali.producto = pro
       
        assertTrue   srv.guardarCalificacion(cali)
        log.error("Prueba fallida")
    }
}
