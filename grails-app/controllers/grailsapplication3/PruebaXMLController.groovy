package grailsapplication3
import groovy.xml.*
import groovy.xml.MarkupBuilder
import grailsapplication3.Productos
import grailsapplication3.Compra


class PruebaXMLController {

          
  def createFromStatic_Simple(Long id) 
      {
        

        def sw = new StringWriter()
        def compraInstance = Compra.findById(id)
        def xml = new groovy.xml.MarkupBuilder(sw) 
        xml.Raiz{
            Compra(IdCompra:compraInstance.id,Fecha:compraInstance.fechaCompra,Estado:"ENTREGADO")
        }

        def f = new File("Compra"+compraInstance.id+".xml")
        f.write(sw.toString())
      
        
        Date fecha = new Date()
        compraInstance.fechaEntrega = fecha
        compraInstance.status = "ENTREGADO"
        compraInstance.save()
        println sw
      
       
   }
}