
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
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
	
</head>
<body class="login">
    <div class="centrar">
    <form action="/aut/GuardarUsus" method="post">
        <div class="party">
            <div class="formal">
                    <h2 >Registro</h2><hr>
                     <input type="hidden" value="1" name="id"/>
                     <div><input class="form-control"  type="text" pattern="[A-Za-z]+" required placeholder="Nombre" name="nombre"></div><br>
                     <div><input class="form-control"  type="text" pattern="[A-Za-z]+" required placeholder="Apellido Paterno" name="apellido"></div><br> 
                     <div ><input class="form-control"  type="text" pattern="[A-Za-z]+" required placeholder="Apellido Materno" name="apellido2"></div><br>
                     <div class="party">
                     <input class="form-control" type="text" pattern="[0-9]+" required placeholder="Edad" name="edad" maxlength="2"><br>
                     <select class="form-control" type="text"placeholder="Sexo" name="sexo">
                                    <option value="M">M</option>
                                    <option value="F">F</option>
                                    <option value="Otros">otros</option>
                      </select>
                     </div><hr>
                       <center> <a class="btn btn-danger"  href = "/aut/index.jsp" > Cancelar</a> </center>
                               
            </div>
                
        <div class="formal">
            <p align="right">
                <a class="btn btn-outline-link"  target="_parent"  href = "/aut/Terminos.html">
                       <img  alt="Responsive image"src="/aut/img/pl.png"width="30" height="30"/> 
                       Avisos De Privacidad
                     </a></p><hr>
                    <div >
                     <input class="form-control"  type="text" required placeholder="Correo" name="correo">
                    </div><br>
                     <div >
                     <input class="form-control"  type="text" required placeholder="usuario" name="Usu">
                     </div><br>
                     <div class="party">
                    <div>
                   <input class="form-control"  type="password" required placeholder="contraseña" name="contra">
                    </div>
                         <div>
                     <button class="btn btn-link" id="btn-abrir-popup">
                        <img  alt="Responsive image"src="/aut/img/2.png"wi dth="30" height="30"/>
                     </button>
                         </div>
                     </div><br>
                     <div class="party">
                         <div>
                     
                         </div>
                    <div >
                         <input  type="checkbox" name="ADP" value="si"> Acepto los Términos Y Condiciones.
                    </div> 
                    </div><hr>
                     <center><input type="submit"  class="btn btn-blue"  value="Registrarce"></center>
        </div>
        </div>
    </form>
    </div>
  <div class="overlay" id="overlay">
  <div class="popup" id="popup">
      <a href="#" id="btn-cerrar-popup" class="btn-cerrar-popup">cerrar<i class="fas fa-times"></i></a>
  <h2 align="center">Contraseña</h2>
  <div >
          
  </div>
  </div>
  </div>

  <script src="/aut/JS/ventnas.js"></script>
</body>
</html>