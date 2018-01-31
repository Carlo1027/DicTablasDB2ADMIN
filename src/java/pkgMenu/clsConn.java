/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pkgMenu;

/**
 *
 * @author Carlo Castro
 */
import java.io.Serializable;
import java.sql.*;

public class clsConn implements Serializable{
    ResultSet res=null;
    private Connection con= null;
    Statement st=null;
    String driver="com.ibm.db2.jcc.DB2Driver";
    String url="jdbc:db2://184.172.97.90:50000/PRUEBA1";
    String userDB="db2admin";
    String passDB="awx29ap0";

    public clsConn(){
        conectar();
    }
    public int conectar(){
        try{
            Class.forName(driver);
        }
        catch (ClassNotFoundException e){
            System.out.println("No se pudo cargal el driver :-( "+driver);
			return -1;

        }
        try{
            con=DriverManager.getConnection(url,userDB,passDB);
        }
        catch(SQLException e){
            System.out.println("No se pudo realizar la conexion :-(");
			return -2;
        }
	return 1;
    }

    public int verificar(String sql){
        try{
            st=getCon().createStatement();
            res= st.executeQuery(sql);
            if (res.next())
                return 1;
            st.close();
        }
        catch(SQLException e){
            System.out.println(e);
        }
        return -1;
    }

    /**
     * @return the con
     */
    public Connection getCon() {
        return con;
    }
}