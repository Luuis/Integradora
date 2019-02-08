package bean;

import extra.ConexionBD;
import java.util.ArrayList;

public class Capacitador extends Cuenta {
    private String nombre;
    private long telefono;
    private String direccionNumInterior;
    private String direccionNumExterior;
    private String direccionLocalidad;
    private String direccionMunicipio;
    private String direccionEstado;
    private long numTarjeta;
    
    //<editor-fold defaultstate="collapsed" desc="Constructores">
    public Capacitador(String correo, String contrasena, String salt, String rol, String nombre, long telefono,
            String direccionNumInterior, String direccionNumExterior, String direccionLocalidad,
            String direccionMunicipio, String direccionEstado, long numTarjeta) {
        super(correo, contrasena, salt, rol);
        this.nombre = nombre;
        this.telefono = telefono;
        this.direccionNumInterior = direccionNumInterior;
        this.direccionNumExterior = direccionNumExterior;
        this.direccionLocalidad = direccionLocalidad;
        this.direccionMunicipio = direccionMunicipio;
        this.direccionEstado = direccionEstado;
        this.numTarjeta = numTarjeta;
    }

    public Capacitador(int id, String correo, String contrasena, String salt, String rol,
            String nombre, long telefono, String direccionNumInterior, String direccionNumExterior,
            String direccionLocalidad, String direccionMunicipio, String direccionEstado, long numTarjeta) {
        super(id, correo, contrasena, salt, rol);
        this.nombre = nombre;
        this.telefono = telefono;
        this.direccionNumInterior = direccionNumInterior;
        this.direccionNumExterior = direccionNumExterior;
        this.direccionLocalidad = direccionLocalidad;
        this.direccionMunicipio = direccionMunicipio;
        this.direccionEstado = direccionEstado;
        this.numTarjeta = numTarjeta;
    }

    public Capacitador(Cuenta c, String nombre, long telefono, String direccionNumInterior,
            String direccionNumExterior, String direccionLocalidad, String direccionMunicipio,
            String direccionEstado, long numTarjeta) {
        super(c);
        this.nombre = nombre;
        this.telefono = telefono;
        this.direccionNumInterior = direccionNumInterior;
        this.direccionNumExterior = direccionNumExterior;
        this.direccionLocalidad = direccionLocalidad;
        this.direccionMunicipio = direccionMunicipio;
        this.direccionEstado = direccionEstado;
        this.numTarjeta = numTarjeta;
    }
    //</editor-fold>
    
    //<editor-fold defaultstate="collapsed" desc="Getters y Setters">
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
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

    public long getNumTarjeta() {
        return numTarjeta;
    }

    public void setNumTarjeta(long numTarjeta) {
        this.numTarjeta = numTarjeta;
    }
    //</editor-fold>
    
    //<editor-fold defaultstate="collapsed" desc="Métodos">
    public boolean registrar(int id) {
        ArrayList instDB = new ArrayList();
        ConexionBD objCBD = new ConexionBD("bolsadetrabajo");
        
        instDB.add("INSERT INTO capacitador VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)");
        instDB.add(id);
        instDB.add(nombre);
        instDB.add(telefono);
        instDB.add(direccionNumInterior);
        instDB.add(direccionNumExterior);
        instDB.add(direccionLocalidad);
        instDB.add(direccionMunicipio);
        instDB.add(direccionEstado);
        instDB.add(numTarjeta);
        
        return objCBD.ejecutarABC(instDB) > 0;
    }
    //</editor-fold>
    
}
