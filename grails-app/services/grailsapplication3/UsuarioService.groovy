package grailsapplication3
import org.springframework.dao.DataIntegrityViolationException
import grailsapplication3.Carrito
import grails.converters.*
import java.text.SimpleDateFormat
import java.io.File;
import org.w3c.dom.Document;
import org.w3c.dom.*;
import java.io.IOException
import java.net.URL
import org.xml.sax.EntityResolver
import org.xml.sax.InputSource
import groovy.xml.StreamingMarkupBuilder 
import java.lang.Object
import org.xml.sax.helpers.DefaultHandler
import groovy.util.XmlSlurper



class UsuarioService {

    def serviceMethod() {

    }
    
    def imprimirAlgo (String algo) {
        
        println("imprimir una vaina con vaina "+algo)
        
        
    }
    
    def convertirFecha (fecha){
        
        String fecha2 = (String) fecha
        SimpleDateFormat formatoDeFecha = new SimpleDateFormat("dd/MM/yy")
        
        println(fecha2)
        Date fechaCambiada = new Date()
        
        fechaCambiada = formatoDeFecha.parse(fecha2)
        
               
        return fechaCambiada
    }
    
    def leeXml (String xml){
        
        
        println("por lo menos entro aqui")
        def elementos = new XmlSlurper().parse(xml)
        println(elementos)
        assert 1 == elementos.Usuarios.size()
        assert "Nombre User" == elementos.Usuarios[0].NombreUser.text()
        assert "Apellido User" == elementos.Usuarios[0].ApellidoUser.text()
        assert "Id User" == elementos.Usuarios[0].identificadorUser.text()
        assert "Tipo" == elementos.Usuarios[0].tipoIdUser.text()
        assert "email" == elementos.Usuarios[0].emailUser.text()
        assert "FechaNac" == elementos.Usuarios[0].fechaNacimientoUser.text()
        assert "Id Google" == elementos.Usuarios[0].idGoogle.text()
        return elementos
        
        //assert "1" == elementos.nodo[0].@id.text()
        
        /*
        <elementoRoot>
        <nodo id="1">
        <nombre>Nombre del nodo</nombre>
        <descripcion>Aquí va la descripción del nodo</descripcion>
        </nodo>
        </elementoRoot>
        
        */
    }

}
