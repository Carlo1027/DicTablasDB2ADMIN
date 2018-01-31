package Controlador;

/**
 *
 * @author Carlo Castro
 */
public class Registro {
    private String tabname;
    private String nombre;
    private String descripcion;
    private int tabno;
    private int iddato;

    public String getTabname() {
        return tabname;
    }

    public void setTabname(String tabname) {
        this.tabname = tabname.trim();
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre.trim();
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion.trim();
    }

    public int getTabno() {
        return tabno;
    }

    public void setTabno(int tabno) {
        this.tabno = tabno;
    }

    public int getIddato() {
        return iddato;
    }

    public void setIddato(int iddato) {
        this.iddato = iddato;
    }

    public Registro(String tabname, String nombre, String descripcion, int tabno, int iddato) {
        this.tabname = tabname;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.tabno = tabno;
        this.iddato = iddato;
    }
        
}
