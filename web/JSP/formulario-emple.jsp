
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Aut-X</title>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    <link href="/aut/CSS/diseño.css" rel="stylesheet" type="text/css" />
    </head>
    <body class="bod7">
        <div  class="Muro-registro-emple">
            <div class="party">
            <div class="submuro-registro-emple">
                    <h2 >Registro<br> Datos Generales</h2><hr>
                    <form action="/aut/GuardarEmple" method="post">
                        <input type="hidden" value="2" name="id"/>
                        <input type="hidden" value="2" name="base"/>
                        <input class="form-control" type="text" pattern="[A-Za-z]+" required placeholder="Nombre" name="nombre"><br>
                        <input class="form-control" type="text" pattern="[A-Za-z]+" placeholder="Segundo_Nombre" name="nombre2"><br>
                        <input class="form-control" type="text" pattern="[A-Za-z]+" required placeholder="Apellido Paterno" name="app"><br>
                        <input class="form-control" type="text" pattern="[A-Za-z]+" required placeholder="Apellido Materno" name="app2"><br>
                        <input class="form-control" type="text" required placeholder="Correo" name="correo"><br>
                    <div class="party">
                        <input class="form-control" type="text" pattern="[0-9]+" required placeholder="Edad" name="edad" maxlength="2">
                        <select class="form-control" type="text" required placeholder="Sexo" name="sexo">
                                        <option value="M">M</option>
                                        <option value="F">F</option>
                                        <option value="Otros">otros</option>
                        </select>
                    </div><br>   
                </div>
                <div class="submuro-registro-emple">
                    <h4>Fecha de contratación</h4><hr>
                    <div class="party">
                        <input class="form-control" type="text" pattern="[0-9]+" required placeholder="DD" name="1" maxlength="2">
                        <input class="form-control" type="text" pattern="[0-9]+" required placeholder="MM" name="2" maxlength="2">
                        <input class="form-control" type="text" pattern="[0-9]+" required placeholder="AA" name="3" maxlength="2">
                     </div><br>
                    <textarea class="form-control" type="text" required placeholder="Dirección" name="dire"></textarea><br>
                    <input class="form-control" type="text" pattern="[0-9]+" required placeholder="Codigo.Apostal" name="cod"><br>
                    <input class="form-control" type="text" pattern="[0-9]+" required placeholder="Telefono" name="tel"><br>
                    <input class="form-control" type="text" required placeholder="Usuario" name="usu"><br>
                    <input class="form-control" type="password" required placeholder="Contraseña" name="contra"><br>
                                <center><input type="submit"  class="btn btn-success"  value="Aceptar"></center>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>