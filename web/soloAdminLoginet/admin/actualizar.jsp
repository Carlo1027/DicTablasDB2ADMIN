<%-- 
    Document   : actualizar
    Created on : 11/11/2015, 01:19:39 AM
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
        <title>Actualizar</title>
        <style>
            #marcoooo {
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
        <div id="marcoooo" style="background-color: silver;">
        <%
            if(request.getParameter("tabname").trim()!=null&&request.getParameter("nombre").trim()!=null&&request.getParameter("descripcion").trim()!=null&&Integer.parseInt(request.getParameter("tabno"))>=0&&Integer.parseInt(request.getParameter("iddato"))!=0){
            
                //int iddato=Integer.parseInt(session.getAttribute("iddato").toString());
                int iddato= Integer.parseInt(request.getParameter("iddato"));
                //out.println(iddato);
                Registro reg = new Registro(request.getParameter("tabname"),request.getParameter("nombre"),request.getParameter("descripcion"),Integer.parseInt(request.getParameter("tabno")),iddato);
                boolean respuesta=Consulta.Actualizar(reg,iddato);
                
                              
                if(respuesta!=false){
                    out.println("Datos actualizados correctamente ");
                    out.println("<a href='inicio.jsp' class='btn btn-info'>Verificar <span class='glyphicon glyphicon-eye-open'></span></a>");
                }
                else{ out.println("Datos no actualizados ");
                
                session.invalidate();
        %>
            <a href="inicio.jsp" class="btn btn-info">Verificar <span class="glyphicon glyphicon-eye-open"></span></a>
        <%
                }
            }else out.println("<a href='inicio.jsp' class='btn btn-info'>Verificar <span class='glyphicon glyphicon-eye-open'></span></a>");
        %>
        </div>
    </body>
</html>
