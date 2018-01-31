package Controlador;

import java.sql.*;
import javax.swing.JOptionPane;

/**
 *
 * @author Carlo Castro
 */
public class mysqlConexion {
    static String Usuario="";
    static String Clave="";
    
    public static Connection Conexion() throws SQLException{
    
    Connection con=null; 
    try{ 

    Class.forName("com.ibm.db2.jcc.DB2Driver"); 
    String url = "jdbc:db2://IP:PORT/DATABASE_NAME"; 
    con = DriverManager.getConnection(url,Usuario,Clave); 

    } catch(Exception ex) { 
    JOptionPane.showMessageDialog(null, ex.getMessage());
    } 
    return con;
    }
    
    public static void CloseConnection(Connection con)
    {
        try {
            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
}
