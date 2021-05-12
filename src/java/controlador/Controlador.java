  
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import Backend.CRUD;
import Backend.Conexion;
import Backend.Fecha;
import Entidades.empleado;
import Entidades.tiquet;
import Entidades.usuarios;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Carrito;
import modelo.Cliente;
import modelo.Compra;
import modeloDA.CompraDA;
import modeloDA.ProductoDa;

/**
 *
 * @author osdroix
 */
@WebServlet(name = "Controlador", urlPatterns = {"/Controlador"})
public class Controlador extends HttpServlet {
ProductoDa da = new ProductoDa();
    List<modelo.Producto> productos = new ArrayList<>();
    modelo.Producto p = new modelo.Producto();
    
    List<Carrito> listaCarrito = new ArrayList<>();
    int item;
    double total = 0.0;
    int cantidad =1;
    int idp;
    Carrito car;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
       
        String accion = request.getParameter("accion");
        productos = da.listar();
        
        switch(accion){
            case "AgregarCarrito":
                int pos = 0;
                cantidad = 1;
                idp= Integer.parseInt(request.getParameter("id"));
                p= da.listarId(idp);
                if (listaCarrito.size() >0) {
                    for (int i = 0; i < listaCarrito.size(); i++) {
                        if (idp == listaCarrito.get(i).getIdProducto()) {
                            pos=i;
                        }
                    }
                    if (idp == listaCarrito.get(pos).getIdProducto()) {
                        cantidad = listaCarrito.get(pos).getCantidad()+cantidad;
                        double subtotal = listaCarrito.get(pos).getPrecioCompra()*cantidad;
                        listaCarrito.get(pos).setCantidad(cantidad);
                        listaCarrito.get(pos).setSubTotal(subtotal);
                        
                    }else{
                        item = item + 1;
                        car = new Carrito();
                        car.setItem(item);
                        car.setIdProducto(p.getId());
                        car.setNombres(p.getNombre());
                        car.setDescripcion(p.getDescripcion());
                        car.setPrecioCompra(p.getPrecio());
                        car.setCantidad(cantidad);
                        car.setSubTotal(cantidad*p.getPrecio());
                        listaCarrito.add(car);
                    }
                }else{
                    item = item + 1;
                car = new Carrito();
                car.setItem(item);
                car.setIdProducto(p.getId());
                car.setNombres(p.getNombre());
                car.setDescripcion(p.getDescripcion());
                car.setPrecioCompra(p.getPrecio());
                car.setCantidad(cantidad);
                car.setSubTotal(cantidad*p.getPrecio());
                listaCarrito.add(car);
                }
                
                request.setAttribute("contador", listaCarrito.size());
                request.getRequestDispatcher("Controlador?accion=home").forward(request, response);
               break;
               
            case "Carrito":
               total =0.0;
               request.setAttribute("carrito", listaCarrito);
                for (int i = 0; i < listaCarrito.size(); i++) {
                    total = total + listaCarrito.get(i).getSubTotal();
                }
               request.setAttribute("total", total);
               request.setAttribute("contador", listaCarrito.size());
               request.getRequestDispatcher("carrito.jsp").forward(request, response);
               break;
               
            case "Comprar":
                total =0.0;
                idp= Integer.parseInt(request.getParameter("id"));
                p= da.listarId(idp);
                item = item+1;
                car = new Carrito();
                car.setItem(item);;
                car.setIdProducto(p.getId());
                car.setNombres(p.getNombre());;
                car.setDescripcion(p.getDescripcion());
                car.setPrecioCompra(p.getPrecio());
                car.setCantidad(cantidad);
                car.setSubTotal(cantidad*p.getPrecio());
                listaCarrito.add(car);
                for (int i = 0; i < listaCarrito.size(); i++) {
                    total = total + listaCarrito.get(i).getSubTotal();
                }
                request.setAttribute("total", total);
                request.setAttribute("carrito", listaCarrito);
                request.setAttribute("contador", listaCarrito.size());
                request.getRequestDispatcher("Empledaos/Montos.jsp").forward(request, response);
                break;
                
            case "Delete":
                int idproducto = Integer.parseInt(request.getParameter("idp"));
                for (int i = 0; i < listaCarrito.size(); i++) {
                    if(listaCarrito.get(i).getIdProducto()== idproducto){
                        listaCarrito.remove(i);
                    }
                }
                break;
            case "IniciarCompra":
                request.setAttribute("total", total);
                request.getRequestDispatcher("PagosTarjeta.jsp").forward(request, response);
                break;
                
            case "GenerarCompra":
                java.util.Date fecha = new Date();
                String produc,DATO;
                double monto;
                DATO = " "+fecha;
                int id_emple = Integer.parseInt(request.getParameter("id"));
                produc = request.getParameter("producto");
                monto = Double.parseDouble(request.getParameter("total"));
                tiquet e = new tiquet();
                e.setId_usuario(id_emple);
                e.setFecha(DATO);
                e.setProducto(produc);
                e.setTotal(monto);
                System.out.print(id_emple);
                System.out.print(fecha);
                System.out.print(monto);
                System.out.print(produc);
                int query = CRUD.guardartiquet(e);
                request.getRequestDispatcher("Controlador?accion=home-empleado").forward(request, response);

                break;
                
            case "Producto":
                request.getRequestDispatcher("ProductoEmpleado.jsp").forward(request, response);
                break;
                
            case "Empleado":
                request.getRequestDispatcher("ControlEmpleado.jsp").forward(request, response);
                break;
                
            case "NuevaVenta":
                switch(accion){
                    case "BuscarProducto":
                        int id = Integer.parseInt(request.getParameter("codigoproducto"));
                        p = da.listarId(id);
                        request.setAttribute("producto", p);
                        break;
                    default:
                        request.getRequestDispatcher("RegistrarVenta.jsp").forward(request, response);
                }
                request.getRequestDispatcher("RegistrarVenta.jsp").forward(request, response);
                
                break;
                
            case "home":
                request.setAttribute("contador", listaCarrito.size());
                request.setAttribute("productos", productos);
                request.getRequestDispatcher("inicioCarrito.jsp").forward(request, response);
                break;
                
            case "home-empleado":
                request.setAttribute("contador", listaCarrito.size());
                request.setAttribute("productos", productos);
                request.getRequestDispatcher("Empleados/cuentas.jsp").forward(request, response);
                break;
            
            case "AgregarCarrito-empleado":
                int poss=0;
                cantidad = 1;
                idp= Integer.parseInt(request.getParameter("id"));
                p= da.listarId(idp);
                if (listaCarrito.size() >0) {
                    for (int i = 0; i < listaCarrito.size(); i++) {
                        if (idp == listaCarrito.get(i).getIdProducto()) {
                            poss=i;
                        }
                    }
                    if (idp == listaCarrito.get(poss).getIdProducto()) {
                        cantidad = listaCarrito.get(poss).getCantidad()+cantidad;
                        double subtotal = listaCarrito.get(poss).getPrecioCompra()*cantidad;
                        listaCarrito.get(poss).setCantidad(cantidad);
                        listaCarrito.get(poss).setSubTotal(subtotal);
                        
                    }else{
                        item = item + 1;
                        car = new Carrito();
                        car.setItem(item);
                        car.setIdProducto(p.getId());
                        car.setNombres(p.getNombre());
                        car.setDescripcion(p.getDescripcion());
                        car.setPrecioCompra(p.getPrecio());
                        car.setCantidad(cantidad);
                        car.setSubTotal(cantidad*p.getPrecio());
                        listaCarrito.add(car);
                    }
                }else{
                    item = item + 1;
                car = new Carrito();
                car.setItem(item);
                car.setIdProducto(p.getId());
                car.setNombres(p.getNombre());
                car.setDescripcion(p.getDescripcion());
                car.setPrecioCompra(p.getPrecio());
                car.setCantidad(cantidad);
                car.setSubTotal(cantidad*p.getPrecio());
                listaCarrito.add(car);
                }
                
                request.setAttribute("contador", listaCarrito.size());
                request.getRequestDispatcher("Controlador?accion=home-empleado").forward(request, response);
               break;
               
            case "Carrito-empleado":
               total =0.0;
               request.setAttribute("carrito", listaCarrito);
                for (int i = 0; i < listaCarrito.size(); i++) {
                    total = total + listaCarrito.get(i).getSubTotal();
                }
               request.setAttribute("total", total);
               request.setAttribute("contador", listaCarrito.size());
               request.getRequestDispatcher("Empleados/Montos.jsp").forward(request, response);
               break;
               
            case "Comprar-empleado":
                total =0.0;
                idp= Integer.parseInt(request.getParameter("id"));
                p= da.listarId(idp);
                item = item+1;
                car = new Carrito();
                car.setItem(item);;
                car.setIdProducto(p.getId());
                car.setNombres(p.getNombre());;
                car.setDescripcion(p.getDescripcion());
                car.setPrecioCompra(p.getPrecio());
                car.setCantidad(cantidad);
                car.setSubTotal(cantidad*p.getPrecio());
                listaCarrito.add(car);
                for (int i = 0; i < listaCarrito.size(); i++) {
                    total = total + listaCarrito.get(i).getSubTotal();
                }
                request.setAttribute("total", total);
                request.setAttribute("carrito", listaCarrito);
                request.setAttribute("contador", listaCarrito.size());
                request.getRequestDispatcher("Empleados/Montos.jsp").forward(request, response);
                break;
                
            case "Delete-empleado":
                int idproductos = Integer.parseInt(request.getParameter("idp"));
                for (int i = 0; i < listaCarrito.size(); i++) {
                    if(listaCarrito.get(i).getIdProducto()== idproductos){
                        listaCarrito.remove(i);
                    }
                }

                break;
                case "Buscar":
                String num = request.getParameter("id_tipo");
                productos = da.Buscar(num);
                request.setAttribute("contador", listaCarrito.size());
                request.setAttribute("productos", productos);              
                request.getRequestDispatcher("Empleados/cuentas.jsp").forward(request, response);
                 System.out.print(num+" aqui estoy wey");
                break;
                
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    try {
        processRequest(request, response);
    } catch (SQLException ex) {
        Logger.getLogger(Controlador.class.getName()).log(Level.SEVERE, null, ex);
    }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    try {
        processRequest(request, response);
    } catch (SQLException ex) {
        Logger.getLogger(Controlador.class.getName()).log(Level.SEVERE, null, ex);
    }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}