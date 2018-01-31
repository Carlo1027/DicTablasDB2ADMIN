<%-- 
    Document   : validardatos
    Created on : 13/06/2016, 01:01:03 PM
    Author     : Carlo Castro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>validacion de la palabra</title>
    </head>
    <body>


        <%
            pkgMenu.admin p = new pkgMenu.admin();

            p.setUsuario(request.getParameter("usuario"));
            p.setcontrasena(request.getParameter("contrasena"));
            p.setAutorizacion(request.getParameter("autorizacion"));
            
            String auto=request.getParameter("autorizacion");
            
            String res = p.insertar4();
            
            if(auto.equals("ADMIN") && res.equals("-1")){
                response.sendRedirect("soloAdminLoginet/admin/inicio.jsp");
            } else if (auto.equals("USER") && res.equals("-1")){
                response.sendRedirect("inicio2.jsp");
            } else response.sendRedirect("index.jsp");
            /*
            pkgMenu.admin p = new pkgMenu.admin();

            p.setUsuario(request.getParameter("usuario"));
            p.setcontrasena(request.getParameter("contrasena"));

            String res = p.insertar3();
            
            
            
            if (res.equals("-1")) {
                //out.print("entraste clic aqui para entrar");
                response.sendRedirect("inicio.jsp");*/
        %>
        <%
            /*} else if (res.equals("1")) {
                response.sendRedirect("index.jsp");
            } else {
                out.print("algo pasa ");
            }*/


        %>
    </body>
</html>

