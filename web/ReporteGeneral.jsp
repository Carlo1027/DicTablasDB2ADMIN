<%-- 
    Document   : Reportes
    Created on : 17/08/2015, 04:54:30 PM
    Author     : Carlo Castro
--%>

<%@page import="net.sf.jasperreports.engine.export.JRXlsExporterParameter"%>
<%@page import="net.sf.jasperreports.engine.export.JRXlsExporter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="net.sf.jasperreports.engine.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="Controlador.*" %> 
<%
    /*Parametros para realizar la conexión*/
    //Connection conexion;
    //Class.forName("com.mysql.jdbc.Driver").newInstance();
    //conexion = DriverManager.getConnection("jdbc:mysql://localhost/agenda","root",""); 
    /*Establecemos la ruta del reporte*/
    mysqlConexion conn = new mysqlConexion();
    File reportFile = new File(application.getRealPath("reportes//reporte.jasper"));
    JasperPrint print = null;
    byte[] bytes = null;
    /* No enviamos parámetros porque nuestro reporte no los necesita asi que escriba cualquier 
     cadena de texto ya que solo seguiremos el formato del método runReportToPdf*/
    Map parameters = new HashMap();
    parameters.put("Nombre_parametro", "Valor_Parametro");
    /*Enviamos la ruta del reporte, los parámetros y la conexión(objeto Connection)*/
    //byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath (), parameters,conexion.getconexion());
    print = JasperFillManager.fillReport(reportFile.getPath(), parameters, conn.Conexion());
    
    
    /*Indicamos que la respuesta va a ser en formato XLS*/
    ByteArrayOutputStream arrayOutputStream = new ByteArrayOutputStream();
            JRXlsExporter exporterXLS = new JRXlsExporter();                

            exporterXLS.setParameter(JRXlsExporterParameter.JASPER_PRINT, print);
            exporterXLS.setParameter(JRXlsExporterParameter.OUTPUT_STREAM, arrayOutputStream);
            exporterXLS.setParameter(JRXlsExporterParameter.IS_ONE_PAGE_PER_SHEET, Boolean.FALSE);
            exporterXLS.setParameter(JRXlsExporterParameter.IS_DETECT_CELL_TYPE, Boolean.TRUE);
            exporterXLS.setParameter(JRXlsExporterParameter.IS_WHITE_PAGE_BACKGROUND, Boolean.FALSE);
            exporterXLS.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS, Boolean.TRUE);
            exporterXLS.exportReport();
            bytes = arrayOutputStream.toByteArray();
            response.setContentType("application/vnd.ms-excel");
            response.setHeader("Content-disposition", "attachment; filename=DiiccionarioDB2.xls");
            response.setContentLength(bytes.length);
            OutputStream ouputStream = response.getOutputStream();
            ouputStream.write(bytes, 0, bytes.length);
            ouputStream.flush();
            ouputStream.close();
%>