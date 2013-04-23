package grailsapplication3

import org.springframework.dao.DataIntegrityViolationException
import grailsapplication3.Detalle
import grailsapplication3.Productos
import grailsapplication3.Carrito

import com.itextpdf.text.Document
import com.itextpdf.text.Paragraph
import com.itextpdf.text.pdf.PdfWriter

class CompraController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [compraInstanceList: Compra.findAllByUsuario(session.Usuario), compraInstanceTotal: Compra.count()]
    }

    def create() {
        [compraInstance: new Compra(params)]
    }

    def save() {
        def compraInstance = new Compra(params)
        if (!compraInstance.save(flush: true)) {
            render(view: "create", model: [compraInstance: compraInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'compra.label', default: 'Compra'), compraInstance.id])
        redirect(action: "show", id: compraInstance.id)
    }

    def show(Long id) {
        def compraInstance = Compra.get(id)
        if (!compraInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'compra.label', default: 'Compra'), id])
            redirect(action: "list")
            return
        }

        [compraInstance: compraInstance]
    }

    def edit(Long id) {
        def compraInstance = Compra.get(id)
        if (!compraInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'compra.label', default: 'Compra'), id])
            redirect(action: "list")
            return
        }

        [compraInstance: compraInstance]
    }

    def update(Long id, Long version) {
        def compraInstance = Compra.get(id)
        if (!compraInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'compra.label', default: 'Compra'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (compraInstance.version > version) {
                compraInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'compra.label', default: 'Compra')] as Object[],
                          "Another user has updated this Compra while you were editing")
                render(view: "edit", model: [compraInstance: compraInstance])
                return
            }
        }

        compraInstance.properties = params

        if (!compraInstance.save(flush: true)) {
            render(view: "edit", model: [compraInstance: compraInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'compra.label', default: 'Compra'), compraInstance.id])
        redirect(action: "show", id: compraInstance.id)
    }

    def delete(Long id) {
        def compraInstance = Compra.get(id)
        if (!compraInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'compra.label', default: 'Compra'), id])
            redirect(action: "list")
            return
        }

        try {
            compraInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'compra.label', default: 'Compra'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'compra.label', default: 'Compra'), id])
            redirect(action: "show", id: id)
        }
    }
    def guardarCompra(Long id){
        
        Date fecha = new Date()
        def productoInstance
        def detalleInstance
        Integer cantidadProducto
        String status = "EN PROCESO"
        Integer total = 0
        params.status = status
        params.fechaCompra = fecha
        params.fechaEntrega = null
        
        println("ENTRA EN EL SAVE DE COMPRA")
        def usuarioInstance = Usuario.findById(session.Usuario.id)
        params.usuario = usuarioInstance
        
        def tarjetaCreditoInstance = Tarjetacredito.findById(id)
        
        params.tarjeta = tarjetaCreditoInstance        
        
        def compraInstance = new Compra(params)
//        println("el id de la tarjeta es desps d "+ compraInstance.tarjeta.id)
//        println("el id del usuario es desps d "+ compraInstance.usuario.id)
//        println("status"+ compraInstance.status)
//        println("fecha1 "+ compraInstance.fechaCompra)
//        println("fecha2 "+ compraInstance.fechaEntrega)
        if (!compraInstance.save(flush: true)) {
            println("ENTRA EN EL Q NO LA CREO")
            render(view: "create", model: [compraInstance: compraInstance])
            return
        }else{
            
           for (int i=0; i<=9;i++){
            
            if(session.Carrito.idProductos[i] != 0){
                
                productoInstance = Productos.findById(session.Carrito.idProductos[i]) 
                cantidadProducto = session.Carrito.cantidadProductos [i]
                detalleInstance = new Detalle(cantidadProducto, productoInstance, compraInstance)
                detalleInstance.save()
        
                productoInstance = null               
                detalleInstance  = null
            }
            
            }
            
      
        
// step 1
def document = new Document()
println("Document Created")
 
// step 2
PdfWriter.getInstance(document, new FileOutputStream("./web-app/web-inf/document"+compraInstance.id+".pdf"))
println("PdfWriter Created")
 
// step 3
document.open()
println("Document Opened")
 
// step 4
document.add(new Paragraph("Le Cloud Products!"))
document.add(new Paragraph("RIF: J-45676548-9"))
document.add(new Paragraph("Direccion: Av. Paez, C.C Multiplaza piso 3 local 32"))
document.add(new Paragraph("Nombre: "+session.Usuario.nombreUser))
document.add(new Paragraph("Apellido: "+session.Usuario.apellidoUser))
document.add(new Paragraph("CI: "+ session.Usuario.identificadorUser))
document.add(new Paragraph("Compra No : "+ compraInstance.id))
document.add(new Paragraph("Tarjeta No : "+ tarjetaCreditoInstance.numero))
document.add(new Paragraph("Direccion de Entrega: Caracas, Venezuela"))
document.add(new Paragraph("Direccion : Caracas, Venezuela"))
document.add(new Paragraph(""))
document.add(new Paragraph(""))
document.add(new Paragraph(""))
           for (int i=0; i<=9;i++){
            
            if(session.Carrito.idProductos[i] != 0){
                
                document.add(new Paragraph("Nombre Producto :"+session.Carrito.nombreProductos[i]))
                document.add(new Paragraph("Precio Producto :"+session.Carrito.precioProductos[i]))
                document.add(new Paragraph("Cantidad Producto :"+session.Carrito.cantidadProductos[i]))
                total = total + (session.Carrito.precioProductos[i] * session.Carrito.cantidadProductos[i] )
                
            }
            
            }

 document.add(new Paragraph("Monto Total Orden: "+total+" BsF."))           
println("Content Added")
 
// step 5
document.close()
println("Document Closed")
            
            def carritoInstance = new Carrito()
            session.Carrito = carritoInstance
            println("COMPRAAAAA instancia    "+compraInstance.id)
            //redirect(controller: "Pdf", action: "pdf1" , compra: compraInstance)
            //redirect( controller: "Compra", action: "list")
            //render "listo esta vaina! "
            session.CompraPDF = compraInstance.id
            redirect (controller: "Attach") //AQUI NOS QUEDAMOS ECHATE AGUA
        }
    
    
    }    
}
