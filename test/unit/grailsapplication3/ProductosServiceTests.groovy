package grailsapplication3



import grails.test.*
import org.junit.*
import org.apache.commons.logging.*
/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */

class ProductosServiceTests extends GrailsUnitTestCase {
 private static Log log = LogFactory.getLog("bitacora."+ProductosController.class.getName())
void testSomething() {
        log.info("Prueba unitaria exitosa de busqueda de productos API WS")
        log.info("Se crea un objeto Producto generico y se le asigna el nombre")
        def srv = new ProductosService()
        Productos pro = new Productos()
        pro.setNombre("gps")
        log.info("Se crea un mock de Producto")
        def testInstances =[pro]
        mockDomain(Productos, testInstances)
      
        log.info("Se comprueba que la busqueda de productos devuelve la lista, haciendo una llamada al servicio")
        assertTrue   (srv.buscandoProductos(pro.getNombre())!=null)
    }

    void testSomethingWrong() {
        log.info("Prueba unitaria fallida de busqueda de productos API WS")
        log.info("Se crea un objeto Producto generico y se le asigna un nombre que no esta en el inventario")
        def srv = new ProductosService()
        Productos pro = new Productos()
        pro.setNombre("&^%#@#(*@@#!")
       
        def testInstances =[pro]
        mockDomain(Productos, testInstances)
      
       
        assertTrue   (srv.buscandoProductos(pro.getNombre())!=null)
        log.error("Prueba fallida")
    }
    
        void testSomethingWrong2() {
        log.info("Prueba unitaria fallida 2 de busqueda de productos API WS")
        log.info("Se crea un objeto Producto generico y se le asigna un nombre, se crea el mock y se pone condicion invalida en el assert")
        def srv = new ProductosService()
        Productos pro = new Productos()
        pro.setNombre("gps")
      
        def testInstances =[pro]
        mockDomain(Productos, testInstances)
      
       
        assertTrue   (srv.buscandoProductos(pro.getNombre())==null)
        log.error("Prueba fallida")
    }


}
