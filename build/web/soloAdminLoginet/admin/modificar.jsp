<%-- 
    Document   : modificar
    Created on : 11/11/2015, 01:03:20 AM
    Author     : Carlo Castro
--%>

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
        <title>Modificar</title>
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
        <%
            if(request.getParameter("tabname").trim()!=null&&request.getParameter("nombre").trim()!=null&&request.getParameter("descripcion").trim()!=null&&Integer.parseInt(request.getParameter("tabno"))>=0&&Integer.parseInt(request.getParameter("iddato"))!=0){
                //session.setAttribute("iddato",Integer.parseInt(request.getParameter("iddato")));
        %>
        <div id="marco" style="background-color: silver;">
            <h3><center>Modificar Datos</center></h3><br>
        <table>
            <tbody>
                <form method="get" action="actualizar.jsp" >
                    <tr><td>TABNAME: </td>
                        <td><br><input type="text" class="form-control" name="tabname" size="40" value="<%=request.getParameter("tabname")%>" readonly><br></td>
                    </tr>
                    <tr><td>NOMBRE: </td>
                        <td><input type="text" class="form-control" name="nombre" size="200" autocomplete="off" value="<%=request.getParameter("nombre")%>" ><br></td>
                    </tr>
                    <tr><td>DESCRIPCION: </td>
                        <td><input type="text" class="form-control" name="descripcion" size="200" autocomplete="off" value="<%=request.getParameter("descripcion")%>" ><br></td>
                    </tr>
                    <tr><!--td>Observacion:</td-->
                        <td></td>
                        <td><input type="hidden" class="form-control" name="tabno" size="60" value="<%=Integer.parseInt(request.getParameter("tabno"))%>" required><br></td>
                    </tr>
                    <tr><!--td>iddato</td-->
                        <td></td>
                        <td><input type="hidden" class="form-control" name="iddato" size="3" value="<%=Integer.parseInt(request.getParameter("iddato"))%>" readonly><br></td>
                    </tr>
                    <tr><td><a href="inicio.jsp" class="btn btn-success"><span class="glyphicon glyphicon-arrow-left"></span> Volver</a></td>
                        <td><button type="submit" class="btn btn-danger">Modificar <span class="glyphicon glyphicon-ok"></span></button></td>
                    </tr>
                </form>
        <%  } %>
            </tbody>
        </table>
        </div>
    </body>
</html>
