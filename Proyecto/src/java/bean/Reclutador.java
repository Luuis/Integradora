package bean;

public class Reclutador extends Cuenta {
    private String nombre;
    private int categoria;
    private long telefono;
    private String direccionNumInterior;
    private String direccionNumExterior;
    private String direccionLocalidad;
    private String direccionMunicipio;
    private String direccionEstado;
    
    //<editor-fold defaultstate="collapsed" desc="Constructores">
    public Reclutador(String correo, String contrasena, String salt, int rol,
            String nombre, int categoria, long telefono,
            String direccionNumInterior, String direccionNumExterior, String direccionLocalidad,
            String direccionMunicipio, String direccionEstado) {
        super(correo, contrasena, salt, rol);
        this.nombre = nombre;
        this.categoria = categoria;
        this.telefono = telefono;
        this.direccionNumInterior = direccionNumInterior;
        this.direccionNumExterior = direccionNumExterior;
        this.direccionLocalidad = direccionLocalidad;
        this.direccionMunicipio = direccionMunicipio;
        this.direccionEstado = direccionEstado;
    }

    public Reclutador(int id, String correo, String contrasena, String salt, int rol,
            String nombre, int categoria, long telefono,
            String direccionNumInterior, String direccionNumExterior, String direccionLocalidad,
            String direccionMunicipio, String direccionEstado) {
        super(id, correo, contrasena, salt, rol);
        this.nombre = nombre;
        this.categoria = categoria;
        this.telefono = telefono;
        this.direccionNumInterior = direccionNumInterior;
        this.direccionNumExterior = direccionNumExterior;
        this.direccionLocalidad = direccionLocalidad;
        this.direccionMunicipio = direccionMunicipio;
        this.direccionEstado = direccionEstado;
    }

    public Reclutador(Cuenta c, String nombre, int categoria, long telefono,
            String direccionNumInterior, String direccionNumExterior, String direccionLocalidad,
            String direccionMunicipio, String direccionEstado) {
        super(c);
        this.nombre = nombre;
        this.categoria = categoria;
        this.telefono = telefono;
        this.direccionNumInterior = direccionNumInterior;
        this.direccionNumExterior = direccionNumExterior;
        this.direccionLocalidad = direccionLocalidad;
        this.direccionMunicipio = direccionMunicipio;
        this.direccionEstado = direccionEstado;
    }
    //</editor-fold>

    //<editor-fold defaultstate="collapsed" desc="Getters y Setters">
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public long getTelefono() {
        return telefono;
    }

    public void setTelefono(long telefono) {
        this.telefono = telefono;
    }

    public String getDireccionNumInterior() {
        return direccionNumInterior;
    }

    public void setDireccionNumInterior(String direccionNumInterior) {
        this.direccionNumInterior = direccionNumInterior;
    }

    public String getDireccionNumExterior() {
        return direccionNumExterior;
    }

    public void setDireccionNumExterior(String direccionNumExterior) {
        this.direccionNumExterior = direccionNumExterior;
    }

    public String getDireccionLocalidad() {
        return direccionLocalidad;
    }

    public void setDireccionLocalidad(String direccionLocalidad) {
        this.direccionLocalidad = direccionLocalidad;
    }

    public String getDireccionMunicipio() {
        return direccionMunicipio;
    }

    public void setDireccionMunicipio(String direccionMunicipio) {
        this.direccionMunicipio = direccionMunicipio;
    }

    public String getDireccionEstado() {
        return direccionEstado;
    }

    public void setDireccionEstado(String direccionEstado) {
        this.direccionEstado = direccionEstado;
    }
    //</editor-fold>
    
}
