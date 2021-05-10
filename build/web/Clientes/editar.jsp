
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
    usuarios u=(usuarios)sesion.getAttribute("user");
    if (sesion.getAttribute("user")!=null){
       
      
    CRUD i = new CRUD();
String usu=request.getParameter("Usu");
int id= Integer.parseInt(request.getParameter("Id"));
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
	<title>
		<%out.println(u.getUsuario());%>
	</title>
</head>
<body>
    <div class="party">
        <div class="tabla">
                <table>
                    <% 
                    ArrayList<usuarios> us = new ArrayList();
                    us=CRUD.getMostrarUsu(usu);
                    for(usuarios o:us){
                          
                    out.println("<tr><td><h1>"+o.getUsuario()+"</h1><h2>Datos Generales</h2>");
                          out.println("<tr><td>"
                                + "<h5>Nombre</h5>"
                                + "<h4><input class='form-control' readonly type='text'placeholder='"+o.getNombre()+" "+o.getApellido()+" "+o.getApellido2()+"' type='text'/>"
                                + "<h5>Correo</h5>"
                                + "<input class='form-control'readonly type='text'placeholder='"+o.getCorreo()+"' type='text'/>"
                               + "<h2>Datos Complementarios</h2>"
                               + "<h5>Edad</h5>"
                                + "<input class='form-control' readonly type='text'placeholder='"+o.getEdad()+"' type='text'/><br>"
                                + "</tr>");
                        
                        
                        
                    }
                    
                    
                    %>
                </table>
        </div>
         <div class="suerte">
         <h1>Editar Datos<hr></h1>  
        <form action="/aut/editarusu" method="POST">
                    <input type="hidden" value="<%out.println(u.getRela());%>" name="id"/>
                     <div class="inputs"><img class="img-fluid" alt="Responsive image"src="/aut/img/nombre.png"width="20" height="20"/>
                         <input class="input-registro" type="text" pattern="[A-Za-z]+" required placeholder="Nombre" name="nombre"></div><br>
                     <div class="inputs"><img class="img-fluid" alt="Responsive image"src="/aut/img/nombre.png"width="20" height="20"/>
                     <input class="input-registro" type="text" pattern="[A-Za-z]+" required placeholder="Apellido Paterno" name="apellido"></div><br> 
                     <div class="inputs"><img class="img-fluid" alt="Responsive image"src="/aut/img/nombre.png"width="20" height="20"/>
                     <input class="input-registro" type="text" pattern="[A-Za-z]+" required placeholder="Apellido Materno" name="apellido2"></div><br>
                     <input class="form-control" type="text" required placeholder="Correo" name="correo"><br>
                     <div class="party">
                     <input class="form-control" type="text" pattern="[0-9]+" required placeholder="Edad" name="edad" maxlength="2"><br>
                     </div><br>
                     <div class="party">
                     <div class="inputs">
                     <img class="img-fluid" alt="Responsive image"src="/aut/img/pp.png" width="30" height="30"/>
                     <input class="input-registro" type="text" required placeholder="Nombre Usuario" name="Usu">
                    </div>
                    <div class="inputs">
                     <img class="img-fluid" alt="Responsive image"src="/aut/img/contrasena.png"width="30" heihrght="30"/>
                     <input class="input-registro" type="text" required placeholder="********" name="contra">
                    </div>
                     </div><hr>
                    <center><button  class="btn btn-success" target='der' name="btn">Editar</button> 
                    <A  class="btn btn-link btn-block" href="/aut/Clientes/main.jsp" >Regresar</A></center> 
        </form>
         </div> 
</div>                        
</body>
</html>
<%   }else{

response.sendRedirect("/aut/");}
%>