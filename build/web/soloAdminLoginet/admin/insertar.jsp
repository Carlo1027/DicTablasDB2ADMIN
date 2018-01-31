<%-- 
    Document   : respuesta
    Created on : 06/11/2015, 04:18:08 PM
    Author     : Carlo Castro
--%>

<%@page import="Modelo.Consulta"%>
<%@page import="Controlador.Registro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="imags/loginet.jpg"/>
        <!-- Bootstrap -->
        <link href="../../css/bootstrap.min.css" rel="stylesheet">
        <link href="../../css/bootstrap-theme.min.css" rel="stylesheet">
        <link href="../../css/font-awesome.min.css" rel="stylesheet">
        <link href="../../css/bootstrap-social.css" rel="stylesheet">
        <link href="../../css/mystyles.css" rel="stylesheet">
        <title>Respuesta</title>
        <style>
            #marco {
                position:absolute;
                border-radius: 30px;
                top:50%; 
                left:50%;
                border: 5px #aaa;
                border-style: outset inset inset outset;
                padding: 15px 15px 15px 15px;
                transform: translate(-50%, -50%);
                -webkit-transform: translate(-50%, -50%);
            }
        </style>
    </head>
    <body background="../../imags/fondo1.jpg" style="background-size: cover;-moz-background-size: cover;-webkit-background-size: cover;-o-background-size: cover;">
        <div id="marco" style="background-color: silver;">
        <%
            if(request.getParameter("tabname").trim()!=null&&request.getParameter("nombre").trim()!=null&&request.getParameter("descripcion").trim()!=null&&Integer.parseInt(request.getParameter("tabno"))>=0){
            
                Registro reg=new Registro(request.getParameter("tabname").trim(),request.getParameter("nombre").trim(),request.getParameter("descripcion").trim(),Integer.parseInt(request.getParameter("tabno")),0);
                
                boolean respuesta=Consulta.Insertar(reg);
                
                if(respuesta!=false) out.println("Datos agregados correctamente ");
                else out.println("Datos no agregados ");
                
                session.invalidate();
            }
            else out.println("Datos no agregados ");
        %>
        <a href="inicio.jsp" class="btn btn-info">Verificar <span class="glyphicon glyphicon-eye-open"></span></a>
        </div>
    </body>
</html>
