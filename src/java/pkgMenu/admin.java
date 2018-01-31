package pkgMenu;

/**
 *
 * @author Carlo Castro
 */
public class admin {

    private String usuario;
    private String contrasena;
    private String autorizacion;

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getcontrasena() {
        return contrasena;
    }

    public void setcontrasena(String contrasena) {
        this.contrasena = contrasena;
    }    
    
    public String getAutorizacion() {
        return autorizacion;
    }

    public void setAutorizacion(String autorizacion) {
        this.autorizacion = autorizacion;
    }

    private clsConn cnn = new clsConn();

    public String insertar3() {
        if ((verificau(usuario,contrasena) == true)) {
            return "-1";
        }
        return "1";
    }
    
    public String insertar4() {
        if ((verificac(usuario,contrasena,autorizacion) == true)) {
            return "-1";
        }
        return "1";
    }

    public boolean verificau(String key, String keyp) {
        String sql = "SELECT * From usuarios where login='" + key.toString() + "' and password='"+keyp.toString()+"'";;
        if (getCnn().verificar(sql) == 1) {
            return true;
        }
        return false;
    }

    public boolean verificac(String key, String keyp, String keyd) {
        String sql = "SELECT * From usuarios where login='" + key.toString() + "' and password='"+keyp.toString()+"' and autorizacion='"+keyd.toString()+"'";
        if (getCnn().verificar(sql) == 1) {
            return true;
        }
        return false;
    }

    public clsConn getCnn() {
        return cnn;
    }
}
