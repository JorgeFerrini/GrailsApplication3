package grailsapplication3
import  serv.consumeServicio;


class PruebaBDController {

    def index() { 
    
     Boolean prueba;
       
       prueba = consumeServicio.insertandoProductos();
       
//        DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
//        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","desarrollo","1234");
//        
//        Statement stmt = conn.createStatement();
//        ResultSet rset = stmt.executeQuery("insert into productos values (HIBERNATE_SEQUENCE.NEXTVAL,0,'no-image.jpg',10,'aqui va la descripcion','/images','aqui va el nombre', 1500)");
//        
       
       println("el valor de prueba = "+prueba);
    
    }
}
