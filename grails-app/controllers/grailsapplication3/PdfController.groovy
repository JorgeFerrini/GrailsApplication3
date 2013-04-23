package grailsapplication3


import com.itextpdf.text.Document
import com.itextpdf.text.Paragraph
import com.itextpdf.text.pdf.PdfWriter
import grailsapplication3.Compra

class PdfController {

    def index() { 
     redirect (action: "pdf1")
    }
    


 def pdf1 (Compra compra)  {
println("COMPRAAAAASDKJHAKJGSDAUGSDKLASFLAFSK    "+compra.id)
def usuarioInstance = Usuario.findById(session.Usuario.id)        
        
// step 1
def document = new Document()
println("Document Created")
 
// step 2
PdfWriter.getInstance(document, new FileOutputStream("./web-app/web-inf/document"+usuarioInstance.identificadorUser+".pdf"))
println("PdfWriter Created")
 
// step 3
document.open()
println("Document Opened")
 
// step 4
document.add(new Paragraph("Hello Groovy!"))
document.add(new Paragraph("Linea 2"))
println("Content Added")
 
// step 5
document.close()
println("Document Closed")

        render "Documento creado con éxito!"
 }   
}
