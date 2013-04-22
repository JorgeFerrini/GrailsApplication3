package grailsapplication3
import groovy.xml.*
import groovy.xml.MarkupBuilder
import grailsapplication3.Productos
import grailsapplication3.Compra


class PruebaXMLController {

          
  def createFromStatic_Simple() 
      {
        

        def sw = new StringWriter()
        def compraInstance = Compra.findById(101)
        def xml = new groovy.xml.MarkupBuilder(sw) 
        xml.Raiz{
            Compra(Fecha:compraInstance.fechaCompra,Estado:compraInstance.status)
        }

      def f = new File("Compra.xml")
      f.write(sw.toString())
      println sw
      
       
   }
}
