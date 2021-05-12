/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloDA;

import Backend.Conexion;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import modelo.Producto;

public class ProductoDa {
    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    
    public List listar(){
        List<Producto>productos=new ArrayList();
        String sql = "SELECT *FROM productos";
        try{
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Producto p = new Producto();
                p.setId(rs.getInt(1));
                p.setTipo(rs.getString(2));
                p.setNombre(rs.getString(3));
                //ID CAMBIO A 5
                p.setPrecio(rs.getDouble(5));
                //ID CAMBIO A 4
                p.setFecha(rs.getString(4));
                //CAMBIO A 7
                p.setDescripcion(rs.getString(7));
                //CAMBIO A 6
                p.setNum(rs.getInt(6));
                productos.add(p);
                
            }
        }catch(Exception e){
            
        }
        
        
        return productos;
    }
    public List Buscar(String num){
        List<Producto>productos=new ArrayList();
        String sql = "SELECT *FROM productos where Id_tipo_producto like '"+num+"'";
        try{
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Producto p = new Producto();
                p.setId(rs.getInt(1));
                p.setTipo(rs.getString(2));
                p.setNombre(rs.getString(3));
                //ID CAMBIO A 5
                p.setPrecio(rs.getDouble(5));
                //ID CAMBIO A 4
                p.setFecha(rs.getString(4));
                //CAMBIO A 7
                p.setDescripcion(rs.getString(7));
                //CAMBIO A 6
                p.setNum(rs.getInt(6));
                productos.add(p);
                
            }
        }catch(Exception e){
            
        }
        
        
        return productos;
    }
   
    
    /*
    public static void main(String [] args){
        ProductoDa pda = new ProductoDa();
        for (Object p: pda.listar()) {
            System.out.println(p);
        }
    }
    */
    
    /*
    public void listarImg(int id, HttpServletResponse response){
        String sql = "SELECT * FROM productos WHERE Id_producto ="+id;
        InputStream inputStream = null;
        OutputStream outputStream = null;
        BufferedInputStream bufferedInputStream = null;
        BufferedOutputStream bufferedOutputStream = null;
        try{
            outputStream = response.getOutputStream();
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if(rs.next()){
                inputStream = rs.getBinaryStream("Foto");
            }
            bufferedInputStream = new BufferedInputStream(inputStream);
            bufferedOutputStream = new BufferedOutputStream(outputStream);
            int i = 0;
            while((i=bufferedInputStream.read()) != -1){
                bufferedOutputStream.write(i);
            }
        }catch(Exception e){
        
        }
    }
    */

    public Producto listarId(int id){
        String sql = "SELECT *FROM productos WHERE Id_producto =" +id;
        Producto p = new Producto();
        try{
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                p.setId(rs.getInt(1));
                p.setNombre(rs.getString(3));
                //descripcion es foto
                p.setDescripcion(rs.getString(7));
                //precio producto cambiar a 5
                p.setPrecio(rs.getDouble(5));
                
                //eliminar stock
                //p.setStock(rs.getInt(7));
            }
        }catch(Exception e){
            
        }
        return p;
    }
    
    
}
