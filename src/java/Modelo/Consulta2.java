package Modelo;

import Controlador.Registro2;
import Controlador.mysqlConexion;
import java.sql.*;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Carlo Castro
 */
public class Consulta2 {

    static String query;//esta variable contiene todas las consultas
    static Connection conexion = null;
    static Statement stm = null;
    static ResultSet rst = null;
    static PreparedStatement pstam = null;
    
    public static List<Registro2> MostrarRegistro() {
        List<Registro2> registro = new ArrayList<Registro2>();
        try {
            query = "SELECT * FROM diccionario_columns ORDER BY tabname,colno";
            conexion = mysqlConexion.Conexion();
            stm = conexion.createStatement();
            rst = stm.executeQuery(query);

            while (rst.next()) {
                Registro2 reg = new Registro2(rst.getString("tabname").trim(), rst.getString("colname").trim(), rst.getString("nombre").trim(), rst.getString("descripcion").trim(), rst.getInt("colno"), rst.getInt("iddato"));
                registro.add(reg);
            }
            conexion.close();
            return registro;
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }
    
    public static List<Registro2> MostrarRegistro2() {
        List<Registro2> registro = new ArrayList<Registro2>();
        try {
            query = "SELECT * FROM diccionario_columns WHERE nombre != ''  ORDER BY tabname,colno";
            conexion = mysqlConexion.Conexion();
            stm = conexion.createStatement();
            rst = stm.executeQuery(query);

            while (rst.next()) {
                Registro2 reg = new Registro2(rst.getString("tabname").trim(), rst.getString("colname").trim(), rst.getString("nombre").trim(), rst.getString("descripcion").trim(), rst.getInt("colno"), rst.getInt("iddato"));
                registro.add(reg);
            }
            conexion.close();
            return registro;
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }
    
    public static boolean Insertar(Registro2 registro) {
        boolean respuesta = false;

        try {
            query = "INSERT INTO diccionario_columns (tabname,colname,nombre,descripcion,colno) VALUES (?,?,?,?,?)";
            conexion = mysqlConexion.Conexion();
            pstam = conexion.prepareStatement(query);

            pstam.setString(1, registro.getTabname());
            pstam.setString(2, registro.getColname());
            pstam.setString(3, registro.getNombre());
            pstam.setString(4, registro.getDescripcion());
            pstam.setInt(5, registro.getColno());
            pstam.executeUpdate();

            conexion.close();
            respuesta = true;

        } catch (SQLException ex) {
            Logger.getLogger(Consulta.class.getName()).log(Level.SEVERE, null, ex);
            respuesta = false;
        }
        return respuesta;
    }

    public static boolean Actualizar(Registro2 registro, int iddato) {
        boolean respuesta = false;

        try {
            query = "UPDATE diccionario_columns SET tabname='" + registro.getTabname().trim() + "', colname='" + registro.getColname().trim() +"', nombre='" + registro.getNombre().trim() + "', descripcion='" + registro.getDescripcion().trim() + "', colno=" + registro.getColno() + " WHERE iddato=" + iddato + "";
            conexion = mysqlConexion.Conexion();
            stm = conexion.createStatement();
            stm.execute(query);

            conexion.close();
            respuesta = true;
        } catch (SQLException ex) {
            Logger.getLogger(Consulta.class.getName()).log(Level.SEVERE, null, ex);
            respuesta = false;
        }
        return respuesta;
    }

    public static boolean Eliminar(int iddato) {
        boolean respuesta = false;

        try {
            query = "DELETE FROM diccionario_columns WHERE iddato=" + iddato + "";
            conexion = mysqlConexion.Conexion();
            stm = conexion.createStatement();
            stm.execute(query);

            conexion.close();
            respuesta = true;
        } catch (SQLException ex) {
            Logger.getLogger(Consulta.class.getName()).log(Level.SEVERE, null, ex);
            respuesta = false;
        }
        return respuesta;
    }

    public static ResultSet Combo() {
        try {
            query = "SELECT DISTINCT TABNAME FROM SYSCAT.TABLES WHERE TABSCHEMA='DB2ADMIN' ORDER BY TABNAME";
            conexion = mysqlConexion.Conexion();
            pstam = conexion.prepareStatement(query);
            rst = pstam.executeQuery();
        } catch (Exception e) {
            System.out.print(e.getMessage());
        }
        return rst;
    }
}
