<%@page import="Entidades.Producto"%>
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
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);%>

    
<%
 HttpSession sesion=request.getSession(true);
    empleado u=(empleado)sesion.getAttribute("user");
    if (sesion.getAttribute("user")!=null){
       Producto p = new Producto();
int id= Integer.parseInt(request.getParameter("ID"));
int tipo= Integer.parseInt(request.getParameter("tipo"));
%>
<html>
<head>
	<meta charset="UTF-8">
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta name="expires" content="Wed, 01 Jan 1997 00:00:00 GMT">
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

    
        <script  src="JS/validacion.js"></script>
    <link rel="stylesheet" type="text/css" href="CSS/ventana.css">
    <link href="/aut/CSS/diseño.css" rel="stylesheet" type="text/css" />
</head>
 <body class="l">
          <div class="superiorr">
            <h3  class="hy" >
                    Productos
                    <div class="p">
                       <A  class="btn btn-success btn-block" href="/aut/cerrasesion" target="_top">
                        <img src='/aut/img/salida.png'width='40' height='40'/>Exit
                       </A>
                     </div>
                    <div class="p">
                       <a class="btn btn-success" href="/aut/JSP/CRUD_P.jsp">
                        <img  alt="Responsive image"src="/aut/img/olu.png"width="40" height="40"/> Regresar</a>
                     </div>
                   
            </h3></div>   
    <%
    if (tipo == 1) { 
    %>
    <div class="party"><br>
    <table class="table table-dark"> 
                                 <% 
                        ArrayList<Producto> us = new ArrayList();
                        us=CRUD.getmostrarproductos(id);
                        for(Producto o:us){
                                out.println("<tr><td>"
                                    + "<h2 align='center' class='hy'>Producto</h2><hr>"
                                    + "<h2 align='center'><img src='"+o.getDescripcion()+"' width='200' height='200'><br>"+o.getNombre()+"</h2>"
                                    + "<h4 align='center'> Caducidad:  "+o.getFecha()+"<br>"
                                    + "Cantidad Kg o Producto:  "+o.getNum_cantidad()+"<br>"
                                    + "Precio:<br></h4>"
                                    + "<h3 class='azul' align='center'>$"+o.getPrecio()+"$</h3></td></tr>");



                        }
                        %>
                    </table> 
<%
}else if (tipo == 2) { 
    %>
    <div class="party"><br>
    <table class="table table-dark"> 
                                 <% 
                        ArrayList<Producto> us = new ArrayList();
                        us=CRUD.getmostrarproductos(id);
                        for(Producto o:us){
                                out.println("<tr><td>"
                                    + "<h2 align='center' class='hy'>Producto</h2><hr>"
                                    + "<h2 align='center'><img src='"+o.getDescripcion()+"' width='200' height='200'><br>"+o.getNombre()+"</h2>"
                                    + "<h4 align='center'> Caducidad:  "+o.getFecha()+"<br>"
                                    + "Cantidad Kg o Producto:  "+o.getNum_cantidad()+"<br>"
                                    + "Precio:<br></h4>"
                                    + "<h3 class='azul' align='center'>$"+o.getPrecio()+"$</h3></td></tr>");



                        }
                        %>
                    </table> 
<%
}else if (tipo == 3) { 
    %>
    <div class="party"><br>
    <table class="table table-dark"> 
                                 <% 
                        ArrayList<Producto> us = new ArrayList();
                        us=CRUD.getmostrarproductos(id);
                        for(Producto o:us){
                                out.println("<tr><td>"
                                    + "<h2 align='center' class='hy'>Producto</h2><hr>"
                                    + "<h2 align='center'><img src='"+o.getDescripcion()+"' width='200' height='200'><br>"+o.getNombre()+"</h2>"
                                    + "<h4 align='center'> Caducidad:  "+o.getFecha()+"<br>"
                                    + "Cantidad Kg o Producto:  "+o.getNum_cantidad()+"<br>"
                                    + "Precio:<br></h4>"
                                    + "<h3 class='azul' align='center'>$"+o.getPrecio()+"$</h3></td></tr>");



                        }
                        %>
                    </table> 
<%
}else if (tipo == 4) { 
    %>
    <div class="party"><br>
    <table class="table table-dark"> 
                                 <% 
                        ArrayList<Producto> us = new ArrayList();
                        us=CRUD.getmostrarproductos(id);
                        for(Producto o:us){
                                out.println("<tr><td>"
                                    + "<h2 align='center' class='hy'>Producto</h2><hr>"
                                    + "<h2 align='center'><img src='"+o.getDescripcion()+"' width='200' height='200'><br>"+o.getNombre()+"</h2>"
                                    + "<h4 align='center'> Caducidad:  "+o.getFecha()+"<br>"
                                    + "Cantidad Kg o Producto:  "+o.getNum_cantidad()+"<br>"
                                    + "Precio:<br></h4>"
                                    + "<h3 class='azul' align='center'>$"+o.getPrecio()+"$</h3></td></tr>");



                        }
                        %>
                    </table> 
<%
}else if (tipo == 5) { 
    %>
    <div class="party"><br>
    <table class="table table-dark"> 
                                 <% 
                        ArrayList<Producto> us = new ArrayList();
                        us=CRUD.getmostrarproductos(id);
                        for(Producto o:us){
                                out.println("<tr><td>"
                                    + "<h2 align='center' class='hy'>Producto</h2><hr>"
                                    + "<h2 align='center'><img src='"+o.getDescripcion()+"' width='200' height='200'><br>"+o.getNombre()+"</h2>"
                                    + "<h4 align='center'> Caducidad:  "+o.getFecha()+"<br>"
                                    + "Cantidad Kg o Producto:  "+o.getNum_cantidad()+"<br>"
                                    + "Precio:<br></h4>"
                                    + "<h3 class='azul' align='center'>$"+o.getPrecio()+"$</h3></td></tr>");



                        }
                        %>
                    </table> 
<%
}else if (tipo == 6) { 
    %>
    <div class="party"><br>
    <table class="table table-dark"> 
                                 <% 
                        ArrayList<Producto> us = new ArrayList();
                        us=CRUD.getmostrarproductos(id);
                        for(Producto o:us){
                                out.println("<tr><td>"
                                    + "<h2 align='center' class='hy'>Producto</h2><hr>"
                                    + "<h2 align='center'><img src='"+o.getDescripcion()+"' width='200' height='200'><br>"+o.getNombre()+"</h2>"
                                    + "<h4 align='center'> Caducidad:  "+o.getFecha()+"<br>"
                                    + "Cantidad Kg o Producto:  "+o.getNum_cantidad()+"<br>"
                                    + "Precio:<br></h4>"
                                    + "<h3 class='azul' align='center'>$"+o.getPrecio()+"$</h3></td></tr>");



                        }
                        %>
                    </table> 
<%
}else if (tipo == 7) { 
    %>
    <div class="party"><br>
    <table class="table table-dark"> 
                                 <% 
                        ArrayList<Producto> us = new ArrayList();
                        us=CRUD.getmostrarproductos(id);
                        for(Producto o:us){
                                out.println("<tr><td>"
                                    + "<h2 align='center' class='hy'>Producto</h2><hr>"
                                    + "<h2 align='center'><img src='"+o.getDescripcion()+"' width='200' height='200'><br>"+o.getNombre()+"</h2>"
                                    + "<h4 align='center'> Caducidad:  "+o.getFecha()+"<br>"
                                    + "Cantidad Kg o Producto:  "+o.getNum_cantidad()+"<br>"
                                    + "Precio:<br></h4>"
                                    + "<h3 class='azul' align='center'>$"+o.getPrecio()+"$</h3></td></tr>");



                        }
                        %>
                    </table> 
<%
}else if (tipo == 8) { 
    %>
    <div class="party"><br>
    <table class="table table-dark"> 
                                 <% 
                        ArrayList<Producto> us = new ArrayList();
                        us=CRUD.getmostrarproductos(id);
                        for(Producto o:us){
                                out.println("<tr><td>"
                                    + "<h2 align='center' class='hy'>Producto</h2><hr>"
                                    + "<h2 align='center'><img src='"+o.getDescripcion()+"' width='200' height='200'><br>"+o.getNombre()+"</h2>"
                                    + "<h4 align='center'> Caducidad:  "+o.getFecha()+"<br>"
                                    + "Cantidad Kg o Producto:  "+o.getNum_cantidad()+"<br>"
                                    + "Precio:<br></h4>"
                                    + "<h3 class='azul' align='center'>$"+o.getPrecio()+"$</h3></td></tr>");



                        }
                        %>
                    </table> 
<%
}else if (tipo == 9) { 
    %>
    <div class="party"><br>
    <table class="table table-dark"> 
                                 <% 
                        ArrayList<Producto> us = new ArrayList();
                        us=CRUD.getmostrarproductos(id);
                        for(Producto o:us){
                                out.println("<tr><td>"
                                    + "<h2 align='center' class='hy'>Producto</h2><hr>"
                                    + "<h2 align='center'><img src='"+o.getDescripcion()+"' width='200' height='200'><br>"+o.getNombre()+"</h2>"
                                    + "<h4 align='center'> Caducidad:  "+o.getFecha()+"<br>"
                                    + "Cantidad Kg o Producto:  "+o.getNum_cantidad()+"<br>"
                                    + "Precio:<br></h4>"
                                    + "<h3 class='azul' align='center'>$"+o.getPrecio()+"$</h3></td></tr>");



                        }
                        %>
                    </table> 
<%
}else if (tipo == 10) { 
    %>
    <div class="party"><br>
    <table class="table table-dark"> 
                                 <% 
                        ArrayList<Producto> us = new ArrayList();
                        us=CRUD.getmostrarproductos(id);
                        for(Producto o:us){
                                out.println("<tr><td>"
                                    + "<h2 align='center' class='hy'>Producto</h2><hr>"
                                    + "<h2 align='center'><img src='"+o.getDescripcion()+"' width='200' height='200'><br>"+o.getNombre()+"</h2>"
                                    + "<h4 align='center'> Caducidad:  "+o.getFecha()+"<br>"
                                    + "Cantidad Kg o Producto:  "+o.getNum_cantidad()+"<br>"
                                    + "Precio:<br></h4>"
                                    + "<h3 class='azul' align='center'>$"+o.getPrecio()+"$</h3></td></tr>");



                        }
                        %>
                    </table> 
<%
}else if (tipo == 11) { 
    %>
    <div class="party"><br>
    <table class="table table-dark"> 
                                 <% 
                        ArrayList<Producto> us = new ArrayList();
                        us=CRUD.getmostrarproductos(id);
                        for(Producto o:us){
                                out.println("<tr><td>"
                                    + "<h2 align='center' class='hy'>Producto</h2><hr>"
                                    + "<h2 align='center'><img src='"+o.getDescripcion()+"' width='200' height='200'><br>"+o.getNombre()+"</h2>"
                                    + "<h4 align='center'> Caducidad:  "+o.getFecha()+"<br>"
                                    + "Cantidad Kg o Producto:  "+o.getNum_cantidad()+"<br>"
                                    + "Precio:<br></h4>"
                                    + "<h3 class='azul' align='center'>$"+o.getPrecio()+"$</h3></td></tr>");



                        }
                        %>
                    </table> 
<%
}else if (tipo == 12) { 
    %>
    <div class="party"><br>
    <table class="table table-dark"> 
                                 <% 
                        ArrayList<Producto> us = new ArrayList();
                        us=CRUD.getmostrarproductos(id);
                        for(Producto o:us){
                                out.println("<tr><td>"
                                    + "<h2 align='center' class='hy'>Producto</h2><hr>"
                                    + "<h2 align='center'><img src='"+o.getDescripcion()+"' width='200' height='200'><br>"+o.getNombre()+"</h2>"
                                    + "<h4 align='center'> Caducidad:  "+o.getFecha()+"<br>"
                                    + "Cantidad Kg o Producto:  "+o.getNum_cantidad()+"<br>"
                                    + "Precio:<br></h4>"
                                    + "<h3 class='azul' align='center'>$"+o.getPrecio()+"$</h3></td></tr>");



                        }
                        %>
                    </table> 
<%
}
%>
<div class="queso">
    <h1 class="hy" >
		Editar Datos<hr>
                </h1>  
            <form action="/aut/editarproductos" method="post">                     
                <input type="hidden" value="<%out.println(id);%>" name="id"/>
                <div class="party">
                        <input class="form-control" type="text"placeholder="Nombre" name="nombre"></div><br>
                    <div class="party">
                        <h6 class="hy">Fecha de caducidad:</h6><br>
                        <input class="form-control" type="text"placeholder="dd" name="fecha">
                        <input class="form-control" type="text"placeholder="mm" name="fecha1">
                        <input class="form-control" type="text"placeholder="aa" name="fecha2">
                        </div><br>
                       <div class="party">
                           <h6 class="hy">Producto o Kg:</h6><br>
                           <input class="form-control" type="text"placeholder="Cantidad" name="cant">
                            <input class="form-control" type="text"placeholder="$Precio$" name="prec"></div><br>
                        <input class="form-control" type="text"placeholder="Imagen Web" name="img"><br>
                <center><button type="submit"  class="btn btn-primary" name="btn">Aceptar</button></center>
               </form>
	</div>
</div>                 
%>                      
</body>

</html>
<%   }else{

response.sendRedirect("/aut/");}
%>