<%-- 
    Document   : excelColumnas
    Created on : 16/06/2016, 04:16:32 PM
    Author     : Carlo Castro
--%>

<%@page import="Modelo.Consulta2"%>
<%@page import="Controlador.Registro2"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            response.setHeader("Content-Disposition", "attachment; filename=DicColumnas.xls");
            response.setContentType("application/vnd.ms-excel");
        %>
    </head>
    <body>
        <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered rt cf" id="example" width="100%" height="100%">    
            <thead class="cf">

            <th width="10%">TABNAME</th>
            <th width="3%">id</th>
            <th width="10%">COLNAME</th>
            <th width="35%">NOMBRE DE COLUMNA</th>
            <th width="35%">DESCRIPCION</th>
            <!--th width="3%"></th-->
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
                List<Registro2> registro = Consulta2.MostrarRegistro2();
                for (int i = 0; i < registro.size(); i++) {
            %>
            <tr>

                <td width="10%"><%=registro.get(i).getTabname().trim()%></td>
                <td width="2.5%"><%=registro.get(i).getColno()%></td>
                <td width="10%"><%=registro.get(i).getColname().trim()%></td>
                <td width="35%"><%=registro.get(i).getNombre().trim()%></td>
                <td width="35%"><%=registro.get(i).getDescripcion().trim()%></td>
                <!--td width="2.5%"><center><a href="modificar.jsp?tabname=<%=registro.get(i).getTabname().trim()%>&&colname=<%=registro.get(i).getColname().trim()%>&&nombre=<%=registro.get(i).getNombre().trim()%>&&descripcion=<%=registro.get(i).getDescripcion().trim()%>&&colno=<%=registro.get(i).getColno()%>&&iddato=<%=registro.get(i).getIddato()%>"><span class="glyphicon glyphicon-edit"></span></a></center></td-->
                <!--td><center><a href="eliminar.jsp?iddato=<%=registro.get(i).getIddato()%>"><span class="glyphicon glyphicon-trash"></span></a></center></td-->
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</body>
</html>
