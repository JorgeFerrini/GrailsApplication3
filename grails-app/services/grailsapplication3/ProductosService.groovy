                                            
package grailsapplication3
import grails.converters.*
import org.apache.commons.logging.*
class ProductosService {
    private static Log log = LogFactory.getLog("bitacora."+ProductosController.class.getName())

    def serviceMethod() {

    }
    
    def imprimeCualquierVaina() {
        
        
        
        println("Cualquier Vaina AQUI")
        
        
    }
    
    def listar(Integer max){
        
        params.max = Math.min(max ?: max, 100)
        [productosInstanceList: Productos.list(params), productosInstanceTotal: Productos.count()]
        
    }
    
    def buscarDesde(String cadena){
 
        def vector = cadena.split(",");
        for (int y=0;y<vector.length;y++)
        //println(" Posicion: "+y+":"+vector[y]);
        cadena = vector[1]
        
        return cadena
      
        
    }
//    
//    def buscarHasta(String cadena){
//        
//        int hasta
//        
//        def vector = cadena.split(",");
//        for (int y=0;y<vector.length;y++)
//        //println(" Posicion: "+y+":"+vector[y]);
//        hasta = Integer.parseInt(vector[2])
//        
//        return hasta
//        
//        
//    }
//    
    def buscarId(String cadena){
        
        def vector = cadena.split(",");
        for (int y=0;y<vector.length;y++)
        //println(" Posicion: "+y+":"+vector[y]);
        cadena = vector[0]
        
        return cadena
        
    }
    
    def buscandoProductos(String nombre){
        
    //    println("Este es el valor del URL: " + nombre)
        def lista = []
        int numeroMaximoProductos = 10
        int residuo
        int division
        int pagina
        String desde
        def rangoMinimo //es el rango minimo de busqueda
        def rangoMaximo //es el rango maximo de busqueda
        log.info("Se determina la pagina a buscar del producto")
       try{ pagina = Integer.parseInt(buscarDesde(nombre))
           } catch (ArrayIndexOutOfBoundsException E){
               pagina = 1;
              log.error("No se ingreso el numero de pagina en el URL")
           }
        log.info("Se determina el nombre del producto a buscar")   
        nombre = buscarId(nombre)
   //     println("el valor del nombre es: " + nombre)
   //     println("el numero de la paginaaa es: " + pagina)
        String prueba = (String) java.net.InetAddress.getLocalHost().getHostAddress()+":"+"3306/GrailsApplication3"
        String slash = "/"
  //      println("prueba"+nombre)        
        String palabraClave1
        String palabraClave2
        String palabraClave3
        def list
        def productosInstanceList        
        
        list = [null,null,null]        
       
        if(nombre != null){            
            list = nombre.split(' ')            
            println(list)            
        }
        
        
        
        try{
       //     println("se tiene todas")
            palabraClave3 = list[2]
            
            palabraClave2 = list[1]
            palabraClave1 = list[0]
            log.info("Se busca la lista de productos que hacen match con la info proporcionada")   
            productosInstanceList = Productos.findAllByNombreIlikeOrNombreIlike("%"+palabraClave1+"%"+palabraClave2+"%"+palabraClave3+"%",
            "%"+palabraClave1+"%"+palabraClave3+"%"+palabraClave2+"%")

        }catch(Throwable e){
            
  //          println("no se tiene la 3")
            try{
                
 //           println("se tiene la 1 y 2")
            palabraClave2 = list[1]
            palabraClave1 = list[0]
            
            productosInstanceList = Productos.findAllByNombreIlikeOrNombreIlike("%"+palabraClave1+"%"+palabraClave2+"%","%"+palabraClave2+"%"+palabraClave1+"%")
                
            }
            catch(Throwable e2){
  //              println("no se tiene la 2")
                try{
                    
   //                 println("se tiene la 1")
                    palabraClave1 = list[0]
                    productosInstanceList = Productos.findAllByNombreIlike("%"+palabraClave1+"%")
                    
                }
                catch(Throwable e3){
                    log.error("No se encontro ninguna")   
     //               println("no se tienen ninguna kjshdaksjhdkas")
                    
                }                
                
            }
            
            
        }        
        //pasarImagenaByte()
        //servicio()
        //cantidad de paginas
        division = productosInstanceList.size()/numeroMaximoProductos
        residuo  = productosInstanceList.size()%numeroMaximoProductos
        
        residuo++
        
        //println"el resultado de la division es: "+division
        //println"el resultado del residuo es: "+residuo
        
        if(residuo != 0){
            division++
            println "la cantidad de paginas es :"+division
        }else{
            
            println "el valor de la cantidad de paginas es 2:"+division    
            
        }
        //end cantidad de paginas
        
        if (productosInstanceList.size() <= numeroMaximoProductos){
            
            for (int i = 0; i < (productosInstanceList.size()); i++) {
                
                String directorio = productosInstanceList[i].directorio   
                String archivo = productosInstanceList[i].archivo
                
                String prueba2 = prueba + directorio + slash + archivo
                
                productosInstanceList[i].archivo = prueba2
                lista.add(productosInstanceList[i])
    //            println("la ruta es es: "+prueba2)
            }
            
            return lista
            
        }else{
            
            rangoMaximo = pagina*10
            
            rangoMinimo = rangoMaximo - 10
            //si me manda una pagina mayor a las que existen para esa busqueda me regresa como resultado la ultima
            //esto representa la ultima pagina de la vaina y no es el numero completo
            if (rangoMaximo > productosInstanceList.size()){
                
                rangoMaximo = productosInstanceList.size() // rango maximo de busqueda de la ultima pagina
                rangoMinimo = rangoMaximo - (residuo-1) //rango minimo de busqueda de la ultima pagina 
                
                for (int i = rangoMinimo; i < rangoMaximo; i++) {
                    
                    String directorio = productosInstanceList[i].directorio   
                    String archivo = productosInstanceList[i].archivo
                    
                    String prueba2 = prueba + directorio + slash + archivo
                    
                    
                    productosInstanceList[i].archivo = prueba2
                    lista.add(productosInstanceList[i])
   //                 println("la ruta es es: "+prueba2)
                }
                
//                println"rango maximo es: "+rangoMaximo
//                println"rango minimo es: "+rangoMinimo
//                
//               println(" 1 prueba" + productosInstanceList.size())
//                println("el valor de la lista es : "+lista)
                return lista

                //cada uno tiene un return
            }
            
            if (rangoMaximo == productosInstanceList.size()){
                
                rangoMaximo = productosInstanceList.size()
                rangoMinimo = rangoMaximo - 9
                
//                
//                println"rango maximo es: "+rangoMaximo
//                println"rango minimo es: "+rangoMinimo
                
                for (int i = rangoMinimo; i < rangoMaximo; i++) {
                    
                    String directorio = productosInstanceList[i].directorio   
                    String archivo = productosInstanceList[i].archivo
                    
                    String prueba2 = prueba + directorio + slash + archivo
                    
                    productosInstanceList[i].archivo = prueba2
                    lista.add(productosInstanceList[i])
                    println("la ruta es es: "+prueba2)
                }
//                println("2 prueba" + productosInstanceList.size())
//                println("el valor de la lista es : "+lista)
                return lista
              
                //cada uno tiene un return
            }      
            
                        
            if (rangoMaximo < productosInstanceList.size()){
                
                //rangoMaximo = productosInstanceList.size()
                //rangoMinimo = rangoMaximo - 9
                
                
//                println"rango maximo es: "+rangoMaximo
//                println"rango minimo es: "+rangoMinimo
                
                for (int i = rangoMinimo; i < rangoMaximo; i++) {
                    
                    String directorio = productosInstanceList[i].directorio   
                    String archivo = productosInstanceList[i].archivo
                    
                    String prueba2 = prueba + directorio + slash + archivo
                    
                    productosInstanceList[i].archivo = prueba2
                    lista.add(productosInstanceList[i])
  //                  println("la ruta es es: "+prueba2)
                }
                
//                println("3 prueba" + productosInstanceList.size())
//                println("el valor de la lista es : "+lista)
                return lista
                
                //cada uno tiene un return
            }  

        }
            
            return productosInstanceList

    }
    
    def actualizarRuta(lista){
        
        def list
        String divisor = "\\/"
        
        
        println  "este es el tamaño del arreglo en actualizar la ruta :"+lista.size()
        
        for (int i = 0; i < (lista.size()); i++) {
            
            if(lista[i].archivo != null){            
                list = lista[i].archivo.split('/')            
   //             println("el arreglito bello"+list)            
            }    
        
            
            
            String archivo = lista[i].archivo
            
            lista[i].archivo = list[4]
   //         println("el archivo solo se llama : "+lista[i].archivo)
//            list = null
        }
        
    }
    
    def CantidadPaginas (String nombre) {
        
        int cant
        int numeroMaximoProductos = 10
        int residuo
        int division
       //println("Id: " + buscarId(nombre))
       // nombre = buscarId(nombre)
        String prueba = (String) java.net.InetAddress.getLocalHost().getHostAddress()+":"+"3306/GrailsApplication3"
        String slash = "/"
        println("prueba:"+nombre)        
        String palabraClave1
        String palabraClave2
        String palabraClave3 
        def list
        def productosInstanceList        
        
        list = [null,null,null]        
       
        if(nombre != null){            
            list = nombre.split(' ')            
            println(list)            
        }       
        
        
        try{
           // println("se tiene todas")
            palabraClave3 = list[2]
            
            palabraClave2 = list[1]
            palabraClave1 = list[0]
            productosInstanceList = Productos.findAllByNombreIlikeOrNombreIlike("%"+palabraClave1+"%"+palabraClave2+"%"+palabraClave3+"%",
            "%"+palabraClave1+"%"+palabraClave3+"%"+palabraClave2+"%")

        }catch(Throwable e){
            
           // println("no se tiene la 3")
            try{
                
           // println("se tiene la 1 y 2")
            palabraClave2 = list[1]
            palabraClave1 = list[0]
            
            productosInstanceList = Productos.findAllByNombreIlikeOrNombreIlike("%"+palabraClave1+"%"+palabraClave2+"%","%"+palabraClave2+"%"+palabraClave1+"%")
                
            }
            catch(Throwable e2){
                println("no se tiene la 2")
                try{
                    
                   // println("se tiene la 1")
                    palabraClave1 = list[0]
                    productosInstanceList = Productos.findAllByNombreIlike("%"+palabraClave1+"%")
                    
                }
                catch(Throwable e3){
                    
                    //println("no se tienen ninguna kjshdaksjhdkas")
                    
                }                
                
            }
            
            
        }      
        
        division = productosInstanceList.size()/numeroMaximoProductos
        residuo  = productosInstanceList.size()%numeroMaximoProductos
        
        residuo++
        
        //println"el resultado de la division es: "+division
        //println"el resultado del residuo es: "+residuo
        
        if(residuo != 0){
            division++
            println "la cantidad de paginas es :"+division
        }else{
            
            println "el valor de la cantidad de paginas es 2:"+division    
            
        }
        
//        division = division.toString()        
        return division
        
        
    }
}