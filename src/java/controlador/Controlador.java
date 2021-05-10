/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import Backend.Fecha;
import Entidades.usuarios;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
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
            throws ServletException, IOException {
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
                request.getRequestDispatcher("carrito.jsp").forward(request, response);
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
                //objeto usuario para crear la informacion
                Cliente cliente = new Cliente();
                //numero de cliente que esta en la sesión
                usuarios u = new usuarios();
                //extrae numero de usuario logeado
                //dar un vistazo a al archivo Cliente.java y checar el usuarios.java
                int usuario = u.getId();
                cliente.setId(usuario);
                CompraDA de = new CompraDA();
                Compra compra = new Compra(cliente, 1, Fecha.FechaBD(), total, "realizado", listaCarrito);
                int res = de.GenerarCompra(compra);
                if (res !=0 && total>0) {
                    request.getRequestDispatcher("mensaje.jsp").forward(request, response);
                }else{
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
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
                
            default:
                request.setAttribute("contador", listaCarrito.size());
                request.setAttribute("productos", productos);
                request.getRequestDispatcher("inicioCarrito.jsp").forward(request, response);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
