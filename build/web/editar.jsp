
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
       
      
    CRUD i = new CRUD();
String usu=request.getParameter("Usu");
int id= Integer.parseInt(request.getParameter("Id"));
int tipo= Integer.parseInt(request.getParameter("Tipo"));
if (tipo == 3) { 
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
    <link href="CSS/diseño.css" rel="stylesheet" type="text/css" />
	<title>
		<%out.println(u.getUsuario());%>
	</title>
</head>
<body >
    <div class="party">
    <div class="tabla">
                <table>
                    
                    <% 
                    
                    ArrayList<empleado> us = new ArrayList();
                    us=CRUD.getMostrardatos(usu);
                    for(empleado o:us){
                          
                    out.println("<tr><td><h1>"+o.getUsuario()+"</h1><h2>Datos Generales</h2>");
                          out.println("<tr><td>"
                                + "<h5>Nombre</h5>"
                                + "<h4><input class='form-control' readonly type='text'placeholder='"+o.getNombre()+" "+o.getApp()+" "+o.getApp2()+"' type='text'/>"
                                + "<h5>Correo</h5>"
                                + "<input class='form-control'readonly type='text'placeholder='"+o.getCorreo()+"' type='text'/>"
                                + "<h5>Telefono</h5>"
                                + "<input class='form-control' readonly type='text'placeholder='"+o.getTelefono()+"' type='text'/>"                                
                                + "<h5>Codigo Apostal</h5>"
                                + "<input class='form-control' readonly type='text'placeholder='"+o.getPostal()+"' type='text'/>"
                                + "<h5>Dirección</h5>"  
                                + "<textarea class='form-control' readonly type='text'placeholder='"+o.getDireccion()+"' type='text'></textarea></td>"
                                + "<td><img class='img-fluid' alt='Responsive image'src='/aut/img/js.gif'width='150' height='150'/></td><td>"
                                + "<h2>Datos Complementarios</h2>"
                                + "<h5>Fecha de contratación</h5>"
                                + "<input class='form-control' readonly type='text'placeholder='"+o.getFecha()+"' type='text'/><br>"
                                + "<h5>Edad</h5>"
                                + "<input class='form-control' readonly type='text'placeholder='"+o.getEdad()+"' type='text'/><br>"
                                + "</tr>");
                        
                        
                        
                    }
                    
                    
                    %>
                </table>
              
            </div>
        
<div class="capsulas">
    <h1 >
		Editar Datos<hr>
                </h1>  
        <form action="editaradm" method="POST">
                    <input type="hidden" value="<%out.println(u.getUsu());%>" name="id"/>
                    <input class="form-control" type="text"placeholder="Nombre" type="text" name="nom" /> <br>
                    <input class="form-control" type="text"placeholder="Apellido Paterno" type="text" name="app" /><br>
                    <input class="form-control" type="text"placeholder="Apellido Materno" type="text" name="app2"/><br>
                    <input class="form-control" type="text"placeholder="Correo" type="text" name="corre"/><br>
                    <input class="form-control" type="text"placeholder="Usuario" type="text" name="usu"/><br>
                    <input class="form-control" type="text"placeholder="Contraseña" type="text"  name="contra"/><br>
                    <input class="form-control" type="text"placeholder="Telefono" type="text" name="tel"/><hr>
                           
                    <center><button  class="btn btn-success" target='der' name="btn">Editar</button> 
                    <A  class="btn btn-link btn-block" href="/aut/Administrador/mainadm.jsp" >Regresar</A></center> 
        </form>
	</div>
</div>                        
</body>
</html>
<%
} else if (tipo == 2) { 
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
    <link href="CSS/diseño.css" rel="stylesheet" type="text/css" />
	<title>
		<%out.println(u.getUsuario());%>
	</title>
</head>
<body >
    <div class="party">
    <div class="tabla">
                <table>
                    
                    <% 
                    
                    ArrayList<empleado> us = new ArrayList();
                    us=CRUD.getMostrardatos(usu);
                    for(empleado o:us){
                          
                    out.println("<tr><td><h1>"+o.getUsuario()+"</h1><h2>Datos Generales</h2>");
                          out.println("<tr><td>"
                                + "<h5>Nombre</h5>"
                                + "<h4><input class='form-control' readonly type='text'placeholder='"+o.getNombre()+" "+o.getApp()+" "+o.getApp2()+"' type='text'/>"
                                + "<h5>Correo</h5>"
                                + "<input class='form-control'readonly type='text'placeholder='"+o.getCorreo()+"' type='text'/>"
                                + "<h5>Telefono</h5>"
                                + "<input class='form-control' readonly type='text'placeholder='"+o.getTelefono()+"' type='text'/>"                                
                                + "<h5>Codigo Apostal</h5>"
                                + "<input class='form-control' readonly type='text'placeholder='"+o.getPostal()+"' type='text'/>"
                                + "<h5>Dirección</h5>"  
                                + "<textarea class='form-control' readonly type='text'placeholder='"+o.getDireccion()+"' type='text'></textarea></td>"
                                + "<td><img class='img-fluid' alt='Responsive image'src='/aut/img/js.gif'width='150' height='150'/></td><td>"
                                + "<h2>Datos Complementarios</h2>"
                                + "<h5>Fecha de contratación</h5>"
                                + "<input class='form-control' readonly type='text'placeholder='"+o.getFecha()+"' type='text'/><br>"
                                + "<h5>Edad</h5>"
                                + "<input class='form-control' readonly type='text'placeholder='"+o.getEdad()+"' type='text'/><br>"
                                + "</tr>");
                        
                        
                        
                    }
                    
                    
                    %>
                </table>
              
            </div>
        
<div class="capsulas">
    <h1 >
		Editar Datos<hr>
                </h1>  
        <form action="editaradm" method="POST">
                    <input type="hidden" value="<%out.println(u.getUsu());%>" name="id"/>
                    <input class="form-control" type="text"placeholder="Nombre" type="text" name="nom" /> <br>
                    <input class="form-control" type="text"placeholder="Apellido Paterno" type="text" name="app" /><br>
                    <input class="form-control" type="text"placeholder="Apellido Materno" type="text" name="app2"/><br>
                    <input class="form-control" type="text"placeholder="Correo" type="text" name="corre"/><br>
                    <input class="form-control" type="text"placeholder="Usuario" type="text" name="usu"/><br>
                    <input class="form-control" type="text"placeholder="Contraseña" type="text"  name="contra"/><br>
                    <input class="form-control" type="text"placeholder="Telefono" type="text" name="tel"/><hr>
                           
                    <center><button  class="btn btn-success" target='der' name="btn">Editar</button> 
                    <A  class="btn btn-link btn-block" href="/aut/Empleados/main.jsp" >Regresar</A></center> 
        </form>
	</div>
</div>                        
</body>
</html>
<%
}
%>
<%   }else{

response.sendRedirect("/aut/");}
%>