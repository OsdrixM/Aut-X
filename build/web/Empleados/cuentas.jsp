<%-- 
    Document   : cuentas
    Created on : 30/12/2020, 10:36:53 PM
    Author     : osdroix
--%>

<%@page import="Entidades.empleado"%>
<%@page import="java.util.List"%>
<%@page import="Entidades.Producto"%>
<%@page import="Backend.CRUD"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entidades.usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<%
    HttpSession sesion = request.getSession(true);
    empleado u = (empleado) sesion.getAttribute("user");
    if (sesion.getAttribute("user") != null) {


%>
<!DOCTYPE html>
<html>
<head>
	 <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="keywords" content="Art Sign Up Form Responsive Widget, 
              Audio and Video players, Login Form Web Template, Flat Pricing 
              Tables, Flat Drop-Downs, Sign-Up Web Templates, 
	Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone 
        Compatible Web Template, Free Web Designs for Nokia, Samsung, 
        LG, Sony Ericsson, Motorola Web Design"
    />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" 
         integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <link rel="stylesheet" type="text/css" href="/aut/CSS/ventana.css">
    <link href="/aut/CSS/diseño.css" rel="stylesheet" type="text/css" />
	<title>
		cuentas.
	</title>
</head>
<body>
        <div class="superiorr">
	<h3  class="hy" >
		Cuentas 
                <div class="p">
                   <A  class="btn btn-success btn-block" href="/aut/cerrasesion" target="_top">
                    <img src='/aut/img/salida.png'width='40' height='40'/>Exit
                   </A>
                 </div>
        </h3></div>
    <div class="party">
         <%
      String nom= request.getParameter("Nom");
      String Id= request.getParameter("ID");
      %> 
		<div class="sumatorios">
			<form>
			<h5 align="center"><br>Productos</h5>
			<br>Enviar productos<hr>
    <div class="party">
                    <input class="text" type="text" placeholder="<%out.println(nom);%>" name="nombre" style="width : 40%;" />
                    <input class="form-control" type="text" placeholder="cantidad" name="cant" style="width : 30%;" />
                    <input class="form-control" type="text" placeholder="<%out.println(Id);%>" name="folio"style="width : 15%;" />
                    <button id="btn"  class="btn btn-link" onclick="" ><img  alt="Responsive image"src="/aut/img/me2.png"width="30" height="30"/></button>
                    
                 
                    
                      
                    
    </div>
                    

        </form>
			<form action="buscador" method="POST">
			<h5 align="center"><br>Nota</h5>
                        <%
                              out.println("<tr><td>" 
                               + "<h3>"+ "Del producto "
                               + (nom) 
                               + " quedan "
                               + (Id)
                               + " piezas"
                               + "</td></td>");
                        %> 
                        <br>
			<br>Servicios<hr>
                    <button  class="btn btn-link" onclick="" ><img  alt="Responsive image"src="/aut/img/pdf.png"width="25" height="30"/></button>
                    <a href="https://mail.google.com/mail/u/0/#inbox" target="_top"><img  alt="Responsive image"src="/aut/img/gmail.png"width="40" height="40"/></a>
                    <button  class="btn btn-link" onclick="" ><img  alt="Responsive image"src="/aut/img/envios.jpg"width="35" height="35"/></button>
                    <button  class="btn btn-link" onclick="" ><img  alt="Responsive image"src="/aut/img/x.png"width="30" height="30"/></button>
                    <button  class="btn btn-link" onclick="" ><img  alt="Responsive image"src="/aut/img/basura2.jpg"width="30" height="30"/></button>
        </form>	
                 </div>
		<div class="buscado">
                   <form action="/aut/Empleados/cuentas.jsp" method="POST">
                        <h5>Buscador</h5>
                       <div class="party">
                            <select class="form-control" type="text" name="id_tipo">
                                    <option value="1">Cremeria</option>
                                    <option value="2">Verduras</option>
                                    <option value="3">Frituras Y Dulces</option>
                                    <option value="4">Chiles</option>
                                    <option value="5">Farmacia</option>
                                    <option value="6">Heladeria</option>
                                    <option value="7">Expendio de pan</option>
                                    <option value="8">Limpieza</option>
                                    <option value="9">Alimento de mascota</option>
                                    <option value="10">Semillas</option>
                                    <option value="11">Refrescos</option>
                                    <option value="12">otros</option>
                          </select>
                            <button type="submit" class="btn btn-link" onclick="" ><img  alt="Responsive image"src="/aut/img/lup.png"width="30" height="30"/></button>
                       </div>
                  </form>
                    
                    <% 
                    String po;
                        po = request.getParameter("id_tipo");
                    if(po != null){
                    %>
                    <div>
                    <hr> 
                    <%
                    ArrayList<Producto> us = new ArrayList();
                    us=CRUD.getBuscador(po);
                    for(Producto o:us){
                          
                          out.println("<tr><td>"
                                + "<h6>"+o.getNombre()+"<br>"
                                + "Cantidad:  "+o.getNum_cantidad()+"  Productos o Kg<br>"
                                + "Precio: "+o.getPrecio()+"</td><td> "
                                 + "<a href='/aut/Empleados/"
                                + "cuentas.jsp?ID="+o.getId_incremet()+""
                                + "&Nom="+o.getNombre()+"'><img  alt='Responsive image'src='/aut/img/carro.png'width='30' height='30'/></a></td>"
                                + "</tr>");
                        
                        
                        
                    }
                    
                    
                    %>
                    </div>
                    <%
                    }else{
                    %>
                    <hr>
                    <h4 align="center">Sin datos</h4></div></div>
                    <%
                    }%>
		</div>
</body>
</html>
<%   } else {

        response.sendRedirect("/aut/Empleados/cuentas.jsp");
    }
%>