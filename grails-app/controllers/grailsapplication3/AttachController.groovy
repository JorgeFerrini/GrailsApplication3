package grailsapplication3

class AttachController {

    def index() {
     redirect (action: "send")
    }
    
   def send = {
       
         def usuarioInstance = Usuario.findById(session.Usuario.id)
    sendMail {
    
    multipart true
    to usuarioInstance.emailUser
    subject "Le cloud Products Detalle de Compra"
    body "Felicidades has comprado un producto(s): "
    //attachBytes "C:/Users/vit/Documents/GitHub/GrailsApplication3/web-app/WEB-INF/document"+session.CompraPDF+".pdf", "text/pdf", contentOrder.getBytes("UTF-8")
    //To get started quickly, try the following
    attachBytes './web-app/WEB-INF/document'+session.CompraPDF+'.pdf','text/pdf', new File('./web-app/WEB-INF/document'+session.CompraPDF+'.pdf').readBytes()
    //html '<a href="<g:createLinkTo dir="/WEB-INF" file="document${session.CompraPDF}.pdf" /> " ><img src="<g:createLinkTo dir="/images" file="LOGO_PDF.png" /> " /></a>'
//C:/Users/vit/Documents/GitHub/GrailsApplication3
        }
render "listoooo"
}
}
