<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Entidades.empleado"%>
<%@page import="Backend.CRUD"%>
<%@page import="Entidades.usuarios"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Backend.Conexion"%>
<%@page import="Entidades.administrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session= 'true' %>

<%
    HttpSession sesion=request.getSession(true);
    usuarios u=(usuarios)sesion.getAttribute("user");
    if (sesion.getAttribute("user")!=null){
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://kit.fontawesome.com/f46ce87315.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body>
        
        <div class="container mt-2">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <a class="navbar-brand">Carrito Aut-X</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="Controlador?accion=home">Inicio<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled" href="Controlador?accion=Carrito">
                        <i class="fas fa-cart-plus">(<label style="color: orange"> ${contador} </label>)</i>Carrito de compras</a>
                </li>
                </ul>
                </div>
            </nav>
        </div>
                
        <div class="container mt-4">
            <div class="row">
                
                <c:forEach var="p" items="${productos}">
                <div class="col-sm-4">
                    <div class="card">
                        <div class="card-header">
                            <label>${p.getNombre()}</label>
                        </div>
                        <div class="card-body">
                            <label>$ ${p.getPrecio()} MXN</label>
                        </div>
                        <div class="card-body">
                            <label>
                                <img src="${p.getDescripcion()}" height="140" width="135">
                            </label>
                            <!-- CAMBIOS -->
                        </div>
                            <div class="card-footer text-center">
                            <div>
                                <a class="btn btn-outline-info" href="Controlador?accion=AgregarCarrito&id=${p.getId()}" class="hidden">Agregar al carrito</a>
                                <a class="btn btn-outline-danger" href="Controlador?accion=Comprar&id=${p.getId()}">Comprar</a>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
                
             </div>  
         </div>
                     
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        
    </body>
</html>
<%}else{
    response.sendRedirect("/aut/");}
%>
