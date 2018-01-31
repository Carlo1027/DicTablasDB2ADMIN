<%-- 
    Document   : index
    Created on : 06/11/2015, 04:09:51 PM
    Author     : Carlo Castro
--%>

<%@page import="Modelo.Consulta"%>
<%@page import="java.util.*"%>
<%@page import="Controlador.Registro"%>
<%@page import="java.sql.*"%>
<%@page import="Controlador.mysqlConexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="imags/loginet.jpg"/>
        
        <link href="../../css/bootstrap.min.css" rel="stylesheet">
        <link href="../../css/bootstrap-theme.min.css" rel="stylesheet">
        <link href="../../css/font-awesome.min.css" rel="stylesheet">
        <link href="../../css/bootstrap-social.css" rel="stylesheet">
        <link href="../../css/mystyles.css" rel="stylesheet">
        <title>Diccionario</title>
        <!-- Bootstrap -->
        <link href="../../css/bootstrap/bootstrap.css" rel="stylesheet" media="screen">				
        <link href="../../css/controls/datatable/demo_table.css" rel="stylesheet" media="screen">
        <style type="text/css" title="currentStyle"></style>
        <script type="text/javascript" language="javascript" src="../../js/jquery-1.10.2.min.js"></script>
        <script type="text/javascript" language="javascript" src="../../js/datables/jquery.dataTables.min.js"></script>
        <script type="text/javascript" language="javascript" src="../../js/bootstrap/bootstrap.js"></script>                        
        <script type="text/javascript" language="javascript" src="../../js/bootstrap/ext.bootstrap.js"></script>
        <script type="text/javascript" charset="utf-8">
            $(document).ready(function () {

            });
        </script>
    </head>
    <body id="dt_example">
        <!--table border="1"-->
        <form align="right" name="form1" method="post" action="JavaScript:window.location='index.jsp'">
		<label class="logoutLblPos">
			<a href="../../index.jsp" class="btn btn-danger">Salir <span class="glyphicon glyphicon-log-out"></span></a>
		</label>
	</form>
        <h2><center>Diccionario de Datos</center></h2><br>
        <div>
            <center><a href="http://184.172.97.90:8080/DICCIONARIO/servlet/com.datadic.wpdocumentacion">Diccionario Columnas <span class="glyphicon glyphicon-globe"></span></a></center>
        </div>
        <div class="container">
            <legend>Diccionario para Tablas</legend>
            <div>
                <div class="col-lg-12">
                    <div class="responsive-tables">
                        <table style="table-layout: auto" cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered rt cf" id="example" width="100%" height="100%">    
                            <thead class="cf">
                                <th width="10%">TABNAME</th>
                                <th width="43%">NOMBRE</th>
                                <th width="43%">DESCRIPCION</th>
                                <th width="4%"></th>
                                <!--th></th-->
                            </thead>

                            <!--tfoot>
                                <th>TABNAME</th>
                                <th>COLNAME</th>
                                <th>DESCRIPCION</th>
                                <th>OBSERVACION</th>
                                <th></th>
                                <th></th>
                            </tfoot-->

                            <tbody align="left">
                                <%
                                    //Connection conexion=mysqlConexion.Conexion();
                                    //if(conexion!=null)out.println(conexion+" Conexion hecha\n");
                                    //else out.println("Error de conexion\n");

                                    List<Registro> registro = Consulta.MostrarRegistro();
                                    for (int i = 0; i < registro.size(); i++) {
                                %>
                                <tr>
                                    <td width="10%"><%=registro.get(i).getTabname().trim() %></td>
                                    <td width="43%"><%=registro.get(i).getNombre().trim()%></td>
                                    <td width="43%"><%=registro.get(i).getDescripcion().trim()%></td>
                                    <td width="4%"><center><a href="modificar.jsp?tabname=<%=registro.get(i).getTabname().trim()%>&&nombre=<%=registro.get(i).getNombre().trim()%>&&descripcion=<%=registro.get(i).getDescripcion().trim()%>&&tabno=<%=registro.get(i).getTabno()%>&&iddato=<%=registro.get(i).getIddato()%>"><span class="glyphicon glyphicon-edit"></span></a></center></td>
                                    <!--td><center><a href="eliminar.jsp?iddato=<%=registro.get(i).getIddato()%>"><span class="glyphicon glyphicon-trash"></span></a></center></td-->
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!--form action="irAinsertar.jsp" align="center">
                <button type="submit" class="btn btn-success">Agregar <span class="glyphicon glyphicon-plus-sign"></span></button>
            </form-->
        </div>
    </body>
</html>