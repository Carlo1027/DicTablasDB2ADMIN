package Modelo;

import Controlador.Registro;
import Controlador.mysqlConexion;
import java.sql.*;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Carlo Castro
 */
public class Consulta {

    static String query;//esta variable contiene todas las consultas
    static Connection conexion = null;
    static Statement stm = null;
    static ResultSet rst = null;
    static PreparedStatement pstam = null;
    
    public static List<Registro> MostrarRegistro() {
        List<Registro> registro = new ArrayList<Registro>();
        try {
            query = "SELECT * FROM diccionario_tables ORDER BY tabname";
            conexion = mysqlConexion.Conexion();
            stm = conexion.createStatement();
            rst = stm.executeQuery(query);

            while (rst.next()) {
                Registro reg = new Registro(rst.getString("tabname").trim(), rst.getString("nombre").trim(), rst.getString("descripcion").trim(), rst.getInt("tabno"), rst.getInt("iddato"));
                registro.add(reg);
            }
            conexion.close();
            return registro;
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public static List<Registro> MostrarRegistro2() {
        List<Registro> registro = new ArrayList<Registro>();
        try {
            query = "SELECT * FROM diccionario_tables WHERE nombre != '' ORDER BY tabname";
            conexion = mysqlConexion.Conexion();
            stm = conexion.createStatement();
            rst = stm.executeQuery(query);

            while (rst.next()) {
                Registro reg = new Registro(rst.getString("tabname").trim(), rst.getString("nombre").trim(), rst.getString("descripcion").trim(), rst.getInt("tabno"), rst.getInt("iddato"));
                registro.add(reg);
            }
            conexion.close();
            return registro;
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }    
    
    public static boolean Insertar(Registro registro) {
        boolean respuesta = false;

        try {
            query = "INSERT INTO diccionario_tables (tabname,nombre,descripcion,tabno) VALUES (?,?,?,?)";
            conexion = mysqlConexion.Conexion();
            pstam = conexion.prepareStatement(query);

            pstam.setString(1, registro.getTabname());
            pstam.setString(2, registro.getNombre());
            pstam.setString(3, registro.getDescripcion());
            pstam.setInt(4, registro.getTabno());
            pstam.executeUpdate();

            conexion.close();
            respuesta = true;

        } catch (SQLException ex) {
            Logger.getLogger(Consulta.class.getName()).log(Level.SEVERE, null, ex);
            respuesta = false;
        }
        return respuesta;
    }

    public static boolean Actualizar(Registro registro, int iddato) {
        boolean respuesta = false;

        try {
            query = "UPDATE diccionario_tables SET tabname='" + registro.getTabname().trim() + "', nombre='" + registro.getNombre().trim() + "', descripcion='" + registro.getDescripcion().trim() + "', tabno=" + registro.getTabno() + " WHERE iddato=" + iddato + "";
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
            query = "DELETE FROM diccionario_tables WHERE iddato=" + iddato + "";
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
