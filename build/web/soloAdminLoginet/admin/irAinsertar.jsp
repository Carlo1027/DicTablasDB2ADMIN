<%-- 
    Document   : irAinsertar
    Created on : 02/06/2016, 12:57:11 PM
    Author     : Carlo Castro
--%>

<%@page import="Controlador.mysqlConexion"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="imags/loginet.jpg"/>
        <title>Insertar</title>
    </head>
    <body>
        <script type="text/javascript">
            var peticion = false;
            var testPasado = false;
            try
            {
                peticion = new XMLHttpRequest();
            }
            catch (trymicrosoft)
            {
                try
                {
                    peticion = new ActiveXObject("Msxml2.XMLHTTP");
                }
                catch (othermicrosoft)
                {
                    try
                    {
                        peticion = new ActiveXObject("Microsoft.XMLHTTP");
                    }
                    catch (failed)
                    {
                        peticion = false;
                    }
                }
            }

            if (!peticion)
                alert("ERROR AL INICIALIZAR!");

            function cargarCombo(url, comboAnterior, element_id)
            {
                //Obtenemos el contenido del div
                //donde se cargaran los resultados
                var element = document.getElementById(element_id);
                //Obtenemos el valor seleccionado del combo anterior
                var valordepende = document.getElementById(comboAnterior)
                var x = valordepende.value
                //construimos la url definitiva
                //pasando como parametro el valor seleccionado
                var fragment_url = url + '?id_calificador=' + x;
                //element.innerHTML = '<img src="imagenes/loading.gif" />'; //opcional
                //abrimos la url
                peticion.open("GET", fragment_url);
                peticion.onreadystatechange = function ()
                {
                    if (peticion.readyState == 4)
                    {
                        //escribimos la respuesta
                        element.innerHTML = peticion.responseText;
                    }
                }
                peticion.send(null);
            }
        </script>
        <form action="insertar.jsp">
            <div>
                <span class="Estilo5">
                    <label>Nombre de la Tabla:</label>
                    <select name="tabname" 
                            onchange="javascript:cargarCombo('subcalificador.jsp', 'tabname', 'nombre')" 
                            id="tabname">

                        <%
                            Connection conex = mysqlConexion.Conexion();
                                ResultSet rs = null;
                                Statement st = conex.createStatement();
                                try {
                                    String query = ("SELECT DISTINCT TABNAME from SYSCAT.TABLES ORDER BY TABNAME");
                                    rs = st.executeQuery(query);
                                    while (rs.next()) {
                                        out.println("<option selected value='" + rs.getString("tabname").trim() + "'>" + rs.getString("tabname").trim() + "</option>");
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                                st.close();
                                rs.close();
                        %>
                    </select>
                </span>
            </div>
            
            <div>
                <div><label>Nombre de sus columnas:</label></div>
                <div id="nombre"><br></div>
            </div>
            
            <div>
                <label>Observacion:</label>
                <input type="text" name="descripcion" size="50"><br>
            </div>
            
            <div>
                <label>Descripcion:</label>
                <input type="numeric" name="tabno" size="30" required><br>
            </div>
            <div>
                <input type="submit" style="width:200px;height:20px" value="Agregar"><br>
            </div>
        </form>
    </body>
</html>
