<%-- 
    Document   : index
    Created on : 13/06/2016, 12:59:58 PM
    Author     : Carlo Castro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="es-es" class="no-js">
    <head>
        <meta charset="UTF-8" />
        <link rel="shortcut icon" href="imags/loginet.jpg"/>
        <title>Login</title>
        <link rel="stylesheet" type="text/css" href="css2/demo.css" />
        <link rel="stylesheet" type="text/css" href="css2/style.css" />
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!--link href="css/bootstrap-theme.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/bootstrap-social.css" rel="stylesheet"-->
        <link href="css/mystyles.css" rel="stylesheet">
        
        <script type="text/javascript" language="javascript" src="js/jquery-1.10.2.min.js"></script>
        <script type="text/javascript">
            function nobackbutton() {

                window.location.hash = "no-back-button";
                window.location.hash = "Again-No-back-button" //chrome
                window.onhashchange = function () {
                    window.location.hash = "no-back-button";
                }
            }
        </script>
        <link rel="stylesheet" href="css/bootstrap-combobox.css">

        <script src="js/bootstrap-combobox.js"></script>
    </head>
    <body onload="nobackbutton();">
        <div class="container">
            <header>
                <h1>Bienvenido</h1>
            </header>
            <section>				
                <div id="container_demo">
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form">
                            <form method="get" autocomplete="off" name="f1" action="validardatos.jsp">
                                <h1>Admin/User</h1>
                                <p> 
                                    <label for="username" class="uname" data-icon="u" > Usuario </label>
                                    <input type="text" name="usuario" size="15" id="usuario" required="required" placeholder="Ingrese su usuario"/>
                                </p>
                                <p> 
                                    <label for="password" class="youpasswd" data-icon="p"> Contraseña </label>
                                    <input type="password" name="contrasena" size="15" id="contrasena" required="required" placeholder="Ingrese su contraseña" /> 
                                </p>
                                <p> 
                                    <label for="autorizacion" class="uname">Autorizacion </label>
                                    <select class="form-control" name="autorizacion">
                                        <option value="ADMIN">Administrador</option>
                                        <option value="USER">Usuario</option>
                                    </select>
                                </p>
                                <p class="login button"> 
                                    <input type="submit" value="Ingresar"/>
                                </p><br>
                                <p class="change_link">
                                    <!--a class="to_register" onclick="muestraMensaje()">HELP!</a-->
                                </p>
                            </form>
                        </div>						
                    </div>
                </div>  
            </section>
        </div>
    </body>
</html>
