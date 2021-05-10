/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Backend;
import Entidades.usuarios;
import Backend.Conexion;
import Entidades.Producto;
import Entidades.administrador;
import java.security.*;
import javax.crypto.*;
import java.io.*;
import Entidades.empleado;
import Entidades.tiquet;
import static com.oracle.jrockit.jfr.ContentType.Bytes;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.security.Key;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.Security;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author osdroix
 */
public class CRUD {
   public Producto listarId(int id){
        try{
            
            Connection c = Conexion.getConnection();
            String x = "select * from productos where Id_producto like '"+id+"'";
            PreparedStatement set1 = c.prepareStatement(x);
            ResultSet rs = set1.executeQuery();
            Producto p=new Producto();
            while (rs.next()) {
                p.setId_incremet(rs.getInt("Id_producto"));
                p.setId_tipo(rs.getInt("Id_tipo_producto"));
                p.setPrecio(rs.getDouble("Precio_producto"));
                p.setNombre(rs.getString("Nom_producto"));
                p.setFecha(rs.getString("Fecha_producto"));
                p.setNum_cantidad(rs.getInt("Num_producto"));
                p.setDescripcion(rs.getString("Descripcion_producto"));
            }
        }catch(Exception e){
            
        }
       return null;
    }
    public static int  eliminarusu( int i){
         Statement set = null;
                try{
                    Connection con = Conexion.getConnection();
                    set = con.createStatement();
                      int editar = set.executeUpdate(""
                            + "DELETE from admin where id_adm="+i);
                    con.close();
                }catch(Exception e){
                            System.out.println("NO hay tablita :'v");
                            System.out.println(e.getMessage());
                            System.out.println(e.getStackTrace());

                    e.printStackTrace();
                }try{
                    Connection con = Conexion.getConnection();
                    set = con.createStatement();
                      int editar = set.executeUpdate(""
                            + "DELETE from trabajo where id_trabajo="+i);
                    con.close();
                }catch(Exception e){
                            System.out.println("NO hay tablita :'v");
                            System.out.println(e.getMessage());
                            System.out.println(e.getStackTrace());

                    e.printStackTrace();
                } try{
                    Connection con = Conexion.getConnection();
                    set = con.createStatement();
                      int editar = set.executeUpdate(""
                            + "DELETE from usu where id_usu="+i);
                    con.close();
                }catch(Exception e){
                            System.out.println("NO hay tablita :'v");
                            System.out.println(e.getMessage());
                            System.out.println(e.getStackTrace());

                    e.printStackTrace();
                }
        return 0;
    }
    
    public static int guardarEmple(empleado e){
        
        int estado = 0;
        try{
            Connection con = Conexion.getConnection();
            String q="insert into usuario_empleado (Id_usu_emple,Nom_usu_emple,App_usu_emple,App2_usu_emple,Correo_usu_emple,sexo_uso_emple,Edad_usu_emple)values(?,?,?,?,?,?,?)";
            PreparedStatement set=con.prepareStatement(q);
            set.setInt(1, e.getUsu());
            set.setString(2, e.getNombre());
            set.setString(3, e.getApp());
            set.setString(4, e.getApp2());
            set.setString(5, e.getCorreo());
            set.setString(6, e.getSexo());
            set.setInt(7, e.getEdad());
            System.out.println("Tabla encontrada");
             estado = set.executeUpdate();
                con.close();
        }catch(Exception d){
            System.out.println("NO HAY TABLA Usuario_emple");
            System.out.println(d.getMessage());
            System.out.println(d.getStackTrace());
        }
        return estado;
    
    } 
    public static int guardarEmple2(empleado e){
        
        int estado = 0;
        try{
            Connection con = Conexion.getConnection();
            String q="insert into empleado (Id_emple,Id_tipo_emple,Fecha_emple,Direccion_emple,Postal_emple,Usuario_emple,Contra_emple,Telefono_emple)values(?,?,?,?,?,?,?,?)";
            PreparedStatement set=con.prepareStatement(q);
            set.setInt(1, e.getEmple());
            set.setInt(2, e.getTipo());
            set.setString(3, e.getFecha());
            set.setString(4, e.getDireccion());
            set.setString(5, e.getPostal());
            set.setString(6, e.getUsuario());
            set.setString(7, e.getContra());
            set.setString(8, e.getTelefono());
            System.out.println("Tabla encontrada");
             estado = set.executeUpdate();
                con.close();
        }catch(Exception d){
            System.out.println("NO HAY TABLA Empleado");
            System.out.println(d.getMessage());
            System.out.println(d.getStackTrace());
        }
        return estado;
    
    }
    public static int guardarProductos(Producto e){
        
        int estado = 0;
        try{
            Connection con = Conexion.getConnection();
            String q="insert into productos (Id_producto,Id_tipo_producto,Nom_producto,Fecha_producto,Precio_producto,Num_producto,Descripcion_producto)values(?,?,?,?,?,?,?)";
            PreparedStatement set=con.prepareStatement(q);
            set.setInt(1, e.getId_incremet());
            set.setInt(2, e.getId_tipo());
            set.setString(3, e.getNombre());
            set.setString(4, e.getFecha());
            set.setDouble(5, e.getPrecio());
            set.setInt(6, e.getNum_cantidad());
            set.setString(7, e.getDescripcion());
            System.out.println("Tabla producto encontrada");
             estado = set.executeUpdate();
                con.close();
        }catch(Exception d){
            System.out.println("NO HAY TABLA producto");
            System.out.println(d.getMessage());
            System.out.println(d.getStackTrace());
        }
        return estado;
    
    }
    public static int guardar(usuarios e){
        
        int estado = 0;
        try{
            Connection con = Conexion.getConnection();
            String q="insert into usuario_cliente (Id_usu_cliente,Nom_usu_cliente,App_usu_cliente,App2_usu_cliente,Correo_usu_cliente,Sexo_usu_cliente,Edad_usu_cliente)values(?,?,?,?,?,?,?)";
            PreparedStatement set=con.prepareStatement(q);
            set.setInt(1, e.getId());
            set.setString(2, e.getNombre());
            set.setString(3, e.getApellido());
            set.setString(4, e.getApellido2());
            set.setString(5, e.getCorreo());
            set.setString(6, e.getSexo());
            set.setInt(7, e.getEdad());
            System.out.println("Tabla encontrada");
             estado = set.executeUpdate();
                con.close();
        }catch(Exception d){
            System.out.println("NO HAY TABLA1");
            System.out.println(d.getMessage());
            System.out.println(d.getStackTrace());
        }
        return estado;
    
    } 
          public static int guardar2(usuarios e){
        
        int estado = 0;
        try{
            
            Connection con = Conexion.getConnection();
            String p="insert into cliente (Id_usu_cliente,Id_tipo_cliente,Nom_cliente,Contra_cliente)values(?,?,?,?)";
            PreparedStatement set=con.prepareStatement(p);
            set.setInt(1, e.getRela());
            set.setInt(2, e.getTipo());
            set.setString(3, e.getUsuario());
            set.setString(4, e.getContra());
            System.out.println("Tabla encontrada");
             estado = set.executeUpdate();
                con.close();
        }catch(Exception d){
            System.out.println("NO HAY TABLA3");
            System.out.println(d.getMessage());
            System.out.println(d.getStackTrace());
        }
        return estado;
    
    }
    
   
     public boolean validarregistro(String nombre) throws SQLException, Exception{
        Connection con = Conexion.getConnection();
        String q = "SELECT * FROM cliente WHERE Nom_cliente='"+nombre+"'";
        PreparedStatement ps = con.prepareStatement(q);
        ResultSet rs = ps.executeQuery();
        
        return rs.next();
    }
      public boolean validarEmple(String nombre) throws SQLException, Exception{
        Connection con = Conexion.getConnection();
        String q = "SELECT * FROM empleado WHERE Usuario_emple='"+nombre+"'";
        PreparedStatement ps = con.prepareStatement(q);
        ResultSet rs = ps.executeQuery();
        
        return rs.next();
    }
      
      
     public static ArrayList<usuarios> getUsu(){
        
        ArrayList<usuarios> usus = new ArrayList();
        
        try{
            Connection c = Conexion.getConnection();
            
            String x = "select * from usuario_cliente INNER JOIN cliente ON usuario_cliente.Id_usu_cliente=cliente.Id_usu_cliente";
            PreparedStatement set1 = c.prepareStatement(x);
            ResultSet rs = set1.executeQuery();
            while (rs.next()) {
                usuarios u = new usuarios();
                u.setId(rs.getInt("Id_usu_cliente"));
                u.setNombre(rs.getString("Nom_usu_cliente"));
                u.setApellido(rs.getString("App_usu_cliente"));
                u.setApellido2(rs.getString("App2_usu_cliente"));
                u.setCorreo(rs.getString("Correo_usu_cliente"));
                u.setSexo(rs.getString("Sexo_usu_cliente"));
                u.setEdad(rs.getInt("Edad_usu_cliente"));
                u.setContra(rs.getString("Contra_cliente"));
                u.setUsuario(rs.getString("Nom_cliente"));
                u.setTipo(rs.getInt("Id_tipo_cliente"));
                u.setRela(rs.getInt("Id_usu_cliente"));
               
                usus.add(u);
            }
            c.close();
            
        }catch(Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            
        }
        
        return usus;
    }
      public static ArrayList<usuarios> getMostrarUsu(String numero){
        
        ArrayList<usuarios> usus = new ArrayList();
        
        try{
            Connection c = Conexion.getConnection();
            
            String x = "select * from usuario_cliente INNER JOIN cliente ON usuario_cliente.Id_usu_cliente=cliente.Id_usu_cliente where Nom_cliente like '"+numero+"'";
            PreparedStatement set1 = c.prepareStatement(x);
            ResultSet rs = set1.executeQuery();
            while (rs.next()) {
                usuarios u = new usuarios();
                u.setId(rs.getInt("Id_usu_cliente"));
                u.setNombre(rs.getString("Nom_usu_cliente"));
                u.setApellido(rs.getString("App_usu_cliente"));
                u.setApellido2(rs.getString("App2_usu_cliente"));
                u.setCorreo(rs.getString("Correo_usu_cliente"));
                u.setSexo(rs.getString("Sexo_usu_cliente"));
                u.setEdad(rs.getInt("Edad_usu_cliente"));
                u.setContra(rs.getString("Contra_cliente"));
                u.setUsuario(rs.getString("Nom_cliente"));
                u.setTipo(rs.getInt("Id_tipo_cliente"));
                u.setRela(rs.getInt("Id_usu_cliente"));
               
                usus.add(u);
            }
            c.close();
            
        }catch(Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            
        }
        
        return usus;
    }
     public static ArrayList<empleado> getEmp(){
        
        ArrayList<empleado> usus = new ArrayList();
        
        try{
            Connection c = Conexion.getConnection();
            
            String x = "select * from usuario_empleado INNER JOIN empleado ON usuario_empleado.Id_usu_emple=empleado.Id_emple where Id_tipo_emple like '2'";
            PreparedStatement set1 = c.prepareStatement(x);
            ResultSet rs = set1.executeQuery();
            while (rs.next()) {
                empleado u = new empleado();
                u.setUsu(rs.getInt("Id_usu_emple"));
                u.setTipo(rs.getInt("Id_tipo_emple"));
                u.setEdad(rs.getInt("Edad_usu_emple"));
                u.setUsuario(rs.getString("Usuario_emple"));
                u.setNombre(rs.getString("Nom_usu_emple"));
                u.setCorreo(rs.getString("Correo_usu_emple"));
                u.setTelefono(rs.getString("Telefono_emple"));
                u.setDireccion(rs.getString("Direccion_emple"));
                u.setPostal(rs.getString("Postal_emple"));
                u.setContra(rs.getString("contra_emple"));
                u.setFecha(rs.getString("Fecha_emple"));
                usus.add(u);
            }
            c.close();
            
        }catch(Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            
        }
        
        return usus;
    }
      public static ArrayList<empleado> getAdmin(){
        
        ArrayList<empleado> usus = new ArrayList();
        
        try{
            Connection c = Conexion.getConnection();
            
            String x = "select * from usuario_empleado INNER JOIN empleado ON usuario_empleado.Id_usu_emple=empleado.Id_emple where Id_tipo_emple like '3'";
            PreparedStatement set1 = c.prepareStatement(x);
            ResultSet rs = set1.executeQuery();
            while (rs.next()) {
                empleado u = new empleado();
                u.setUsu(rs.getInt("Id_usu_emple"));
                u.setTipo(rs.getInt("Id_tipo_emple"));
                u.setEdad(rs.getInt("Edad_usu_emple"));
                u.setUsuario(rs.getString("Usuario_emple"));
                u.setNombre(rs.getString("Nom_usu_emple"));
                u.setCorreo(rs.getString("Correo_usu_emple"));
                u.setTelefono(rs.getString("Telefono_emple"));
                u.setDireccion(rs.getString("Direccion_emple"));
                u.setPostal(rs.getString("Postal_emple"));
                u.setContra(rs.getString("contra_emple"));
                u.setFecha(rs.getString("Fecha_emple"));
                usus.add(u);
            }
            c.close();
            
        }catch(Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            
        }
        
        return usus;
    }
       public static ArrayList<empleado> getMostrardatos(String usuario){
        
        ArrayList<empleado> usus = new ArrayList();
        
        try{
            Connection c = Conexion.getConnection();
            
            String x = "select * from usuario_empleado INNER JOIN empleado ON usuario_empleado.Id_usu_emple=empleado.Id_emple where Usuario_emple like '"+usuario+"'";
            PreparedStatement set1 = c.prepareStatement(x);
            ResultSet rs = set1.executeQuery();
            while (rs.next()) {
                empleado u = new empleado();
                u.setUsu(rs.getInt("Id_usu_emple"));
                u.setTipo(rs.getInt("Id_tipo_emple"));
                u.setEdad(rs.getInt("Edad_usu_emple"));
                u.setUsuario(rs.getString("Usuario_emple"));
                u.setNombre(rs.getString("Nom_usu_emple"));
                u.setCorreo(rs.getString("Correo_usu_emple"));
                u.setTelefono(rs.getString("Telefono_emple"));
                u.setDireccion(rs.getString("Direccion_emple"));
                u.setPostal(rs.getString("Postal_emple"));
                u.setContra(rs.getString("contra_emple"));
                u.setFecha(rs.getString("Fecha_emple"));
                u.setApp(rs.getString("App_usu_emple"));
                u.setApp2(rs.getString("App2_usu_emple"));
                usus.add(u);
            }
            c.close();
            System.out.println("se armo");
        }catch(Exception e){
            System.out.println(e.getMessage());
            System.out.println("no se armo");            
        }
        
        return usus;
    }
       public static ArrayList<Producto> getproductos(int numero){
        
        ArrayList<Producto> usus = new ArrayList();
        
        try{
            Connection c = Conexion.getConnection();
            
            String x = "select * from productos where Id_tipo_producto like '"+numero+"'";
            PreparedStatement set1 = c.prepareStatement(x);
            ResultSet rs = set1.executeQuery();
            while (rs.next()) {
                Producto u = new Producto();
                u.setId_incremet(rs.getInt("Id_producto"));
                u.setId_tipo(rs.getInt("Id_tipo_producto"));
                u.setPrecio(rs.getDouble("Precio_producto"));
                u.setNombre(rs.getString("Nom_producto"));
                u.setFecha(rs.getString("Fecha_producto"));
                u.setNum_cantidad(rs.getInt("Num_producto"));
                u.setDescripcion(rs.getString("Descripcion_producto"));
                usus.add(u);
            }
            c.close();
            
        }catch(Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            
        }
        
        return usus;
    }
       public static ArrayList<Producto> getmostrarproductos(int numero){
        
        ArrayList<Producto> usus = new ArrayList();
        
        try{
            Connection c = Conexion.getConnection();
            
            String x = "select * from productos where Id_producto like '"+numero+"'";
            PreparedStatement set1 = c.prepareStatement(x);
            ResultSet rs = set1.executeQuery();
            while (rs.next()) {
                Producto u = new Producto();
                u.setId_incremet(rs.getInt("Id_producto"));
                u.setId_tipo(rs.getInt("Id_tipo_producto"));
                u.setPrecio(rs.getDouble("Precio_producto"));
                u.setNombre(rs.getString("Nom_producto"));
                u.setFecha(rs.getString("Fecha_producto"));
                u.setNum_cantidad(rs.getInt("Num_producto"));
                u.setDescripcion(rs.getString("Descripcion_producto"));
                usus.add(u);
            }
            c.close();
            
        }catch(Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            
        }
        
        return usus;
    }
       public static ArrayList<Producto> getBuscador(String numero){
        
        ArrayList<Producto> usus = new ArrayList();
        
        try{
            Connection c = Conexion.getConnection();
            
            String x = "select * from productos where Id_tipo_producto like '"+numero+"'";
            PreparedStatement set1 = c.prepareStatement(x);
            ResultSet rs = set1.executeQuery();
            while (rs.next()) {
                Producto u = new Producto();
                u.setId_incremet(rs.getInt("Id_producto"));
                u.setId_tipo(rs.getInt("Id_tipo_producto"));
                u.setPrecio(rs.getDouble("Precio_producto"));
                u.setNombre(rs.getString("Nom_producto"));
                u.setFecha(rs.getString("Fecha_producto"));
                u.setNum_cantidad(rs.getInt("Num_producto"));
                u.setDescripcion(rs.getString("Descripcion_producto"));
                usus.add(u);
            }
            c.close();
            
        }catch(Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            
        }
        
        return usus;
    }
       public static ArrayList<tiquet> getMostartiquetcarro(){
        
        ArrayList<tiquet> usus = new ArrayList();
        
        try{
            Connection c = Conexion.getConnection();
            
            String x = "select * from tiquet_carrito";
            PreparedStatement set1 = c.prepareStatement(x);
            ResultSet rs = set1.executeQuery();
            while (rs.next()) {
                tiquet u = new tiquet();
                u.setId_tiquet(rs.getInt("Id_tiquet"));
                u.setId_usuario(rs.getInt("Id_cliente_tiquet"));
                u.setFecha(rs.getString("Fecha_tiquet"));
                u.setProducto(rs.getString("Producto_tiquet"));
                u.setTotal(rs.getDouble("total_tiquet"));
                usus.add(u);
            }
            c.close();
            
        }catch(Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            
        }
        
        return usus;
    } 
       public static ArrayList<tiquet> getMostartiquet(){
        
        ArrayList<tiquet> usus = new ArrayList();
        
        try{
            Connection c = Conexion.getConnection();
            
            String x = "select * from tiquet";
            PreparedStatement set1 = c.prepareStatement(x);
            ResultSet rs = set1.executeQuery();
            while (rs.next()) {
                tiquet u = new tiquet();
                u.setId_tiquet(rs.getInt("Id_tiquet"));
                u.setId_usuario(rs.getInt("Id_empleado_tiquet"));
                u.setFecha(rs.getString("Fecha_tiquet"));
                u.setProducto(rs.getString("Producto_tiquet"));
                u.setTotal(rs.getDouble("total_tiquet"));
                usus.add(u);
            }
            c.close();
            
        }catch(Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            
        }
        
        return usus;
    } 
        
       
    /*
    public String cifrado(String texto) throws Exception{
      //lo primero que tenemos que hacer es agregar el provider 
        Security.addProvider(new BouncyCastleProvider()); //cargar el nuevo proveedor del servicio del proveedor
        
        System.out.println("1.- Creacion de llaves publica y privada:");
        
        //recordermos que en RSA necesitamos una llave publica y una privada
        
        KeyPairGenerator keygen = KeyPairGenerator.getInstance("RSA", "BC");
        
        //inicializar las llaves, para eso tenemos que recordar que en rsa
        //NOS SUGIERE LLAVES DE 1024
        
        keygen.initialize(1024);
        //generar las llaves de rsa
        KeyPair clavesRSA = keygen.generateKeyPair();
        
        //determino mi llave publica 
        PublicKey clavePublica = clavesRSA.getPublic();
        //determino mi llave privada
        PrivateKey clavePrivada = clavesRSA.getPrivate();
        
        System.out.println("2.- Introduzca el texto a cifrar, por fis max 64 caracteres");
        
        //necesitamos un buffer de bytes
        
        byte[] bufferPlano = texto.getBytes();
        
        //paso 2 crear el cifrador de RSA
        
        /*
        BouncyClastle no funciona en modo ECB ya que no divide el mensaje
        en bloques significa que toma el flujo de el texto  y cifra bit por bit
        
        
        
        Cipher cifrador = Cipher.getInstance("RSA", "BC");
        
        cifrador.init(Cipher.ENCRYPT_MODE, clavePublica);
        
        System.out.println("3.- Cifrado con llave publica: ");
        byte[] bufferCifrado = cifrador.doFinal(bufferPlano);
        System.out.println(" Texto cifrado : ");
        mostrarBytes(bufferCifrado);
        System.out.println("\nuwu fin del cifrado");
        
        
        //vamos a decifrar con privada
        cifrador.init(Cipher.DECRYPT_MODE, clavePrivada);
        System.out.println("4.- Desciframos con la llave privada");
        byte[] bufferDescifrado = cifrador.doFinal(bufferCifrado);
        System.out.println(" Texto Descifrado:  ");
        mostrarBytes(bufferDescifrado);
        String s = new String(bufferCifrado, StandardCharsets.UTF_8);
        System.out.println("\nnwn wiiiii se logro");
        
        
        //ahora veamos que pasa si ciframos con privada y desciframos con publica
        
        cifrador.init(Cipher.ENCRYPT_MODE, clavePrivada);
        System.out.println("5.- Cifrado con llave privada: ");
        bufferCifrado = cifrador.doFinal(bufferPlano);
        System.out.println(" Texto cifrado : ");
        mostrarBytes(bufferCifrado);
        System.out.println("\nuwu fin del cifrado");
        
        //ahora la publica
        cifrador.init(Cipher.DECRYPT_MODE, clavePublica);
        System.out.println("6.- Desciframos con la llave publica");
        bufferDescifrado = cifrador.doFinal(bufferCifrado);
        System.out.println(" Texto Descifrado:  ");
        mostrarBytes(bufferDescifrado);
        System.out.println("\nnwn wiiiii se logro");
       return s;
     }  
    public static void mostrarBytes(byte[] buffer) {
        System.out.write(buffer, 0, buffer.length);
    }
    */
       
}

