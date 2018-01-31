<%-- 
    Document   : subcalificador
    Created on : 02/06/2016, 01:04:26 PM
    Author     : Carlo Castro
--%>

<%@page import="Controlador.mysqlConexion"%>
<%@page import = "java.sql.Connection"%>
<%@page import = "java.sql.DriverManager"%> 
<%@page import = "java.sql.ResultSet"%>
<%@page import = "java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="imags/loginet.jpg"/>
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String id_calificador = request.getParameter("id_calificador").toString();
        %>

        <select name="nombre"  id="nombre" class="select" required>

            <%
                Connection conex = mysqlConexion.Conexion();
                ResultSet rs1 = null;
                Statement st1 = conex.createStatement();
                try {
                    String query1 = ("SELECT COLNAME FROM SYSCAT.COLUMNS WHERE TABSCHEMA='DB2ADMIN' AND TABNAME = '" + id_calificador + "' ORDER BY TABNAME,COLNAME");
                    
                    rs1 = st1.executeQuery(query1);
                    while (rs1.next()) {
                        out.println("<option>" + rs1.getString("nombre").trim() + "</option>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                rs1.close();
                st1.close();
                Controlador.mysqlConexion.CloseConnection(conex);
            %>
        </select>
    </body>
</html>
