package Controlador;

/**
 *
 * @author Carlo Castro
 */
public class Registro2 {
    private String tabname;
    private String colname;
    private String nombre;
    private String descripcion;
    private int colno;
    private int iddato;

    public String getTabname() {
        return tabname;
    }

    public void setTabname(String tabname) {
        this.tabname = tabname.trim();
    }
    
    public String getColname() {
        return colname;
    }

    public void setColname(String colname) {
        this.colname = colname.trim();
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

    public int getColno() {
        return colno;
    }

    public void setTabno(int colno) {
        this.colno = colno;
    }

    public int getIddato() {
        return iddato;
    }

    public void setIddato(int iddato) {
        this.iddato = iddato;
    }

    public Registro2(String tabname, String colname, String nombre, String descripcion, int colno, int iddato) {
        this.tabname = tabname;
        this.colname = colname;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.colno = colno;
        this.iddato = iddato;
    }
}
