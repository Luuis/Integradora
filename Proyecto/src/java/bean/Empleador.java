package bean;

import java.util.Date;

public class Empleador extends Cuenta {
    private String nombre;
    private String apPaterno;
    private String apMaterno;
    private String sexo;
    private long telefono;
    private Date fechaNacimiento;
    private String curp;
    private String cedulaProf;
    private String direccionNumInterior;
    private String direccionNumExterior;
    private String direccionLocalidad;
    private String direccionMunicipio;
    private String direccionEstado;
    private int estadoCivil;

    //<editor-fold defaultstate="collapsed" desc="Constructores">
    public Empleador(String nombre, String apPaterno, String apMaterno, String sexo,
            long telefono, Date fechaNacimiento, String curp, String cedulaProf,
            String direccionNumInterior, String direccionNumExterior, String direccionLocalidad,
            String direccionMunicipio, String direccionEstado, int estadoCivil,
            String correo, String contrasena, String salt, int rol) {
        super(correo, contrasena, salt, rol);
        this.nombre = nombre;
        this.apPaterno = apPaterno;
        this.apMaterno = apMaterno;
        this.sexo = sexo;
        this.telefono = telefono;
        this.fechaNacimiento = fechaNacimiento;
        this.curp = curp;
        this.cedulaProf = cedulaProf;
        this.direccionNumInterior = direccionNumInterior;
        this.direccionNumExterior = direccionNumExterior;
        this.direccionLocalidad = direccionLocalidad;
        this.direccionMunicipio = direccionMunicipio;
        this.direccionEstado = direccionEstado;
        this.estadoCivil = estadoCivil;
    }

    public Empleador(int id, String correo, String contrasena, String salt, int rol,
            String nombre, String apPaterno, String apMaterno, String sexo,
            long telefono, Date fechaNacimiento, String curp, String cedulaProf,
            String direccionNumInterior, String direccionNumExterior, String direccionLocalidad,
            String direccionMunicipio, String direccionEstado, int estadoCivil) {
        super(id, correo, contrasena, salt, rol);
        this.nombre = nombre;
        this.apPaterno = apPaterno;
        this.apMaterno = apMaterno;
        this.sexo = sexo;
        this.telefono = telefono;
        this.fechaNacimiento = fechaNacimiento;
        this.curp = curp;
        this.cedulaProf = cedulaProf;
        this.direccionNumInterior = direccionNumInterior;
        this.direccionNumExterior = direccionNumExterior;
        this.direccionLocalidad = direccionLocalidad;
        this.direccionMunicipio = direccionMunicipio;
        this.direccionEstado = direccionEstado;
        this.estadoCivil = estadoCivil;
    }
    
    public Empleador(Cuenta c, String nombre, String apPaterno, String apMaterno, String sexo,
            long telefono, Date fechaNacimiento, String curp, String cedulaProf,
            String direccionNumInterior, String direccionNumExterior, String direccionLocalidad,
            String direccionMunicipio, String direccionEstado, int estadoCivil) {
        super(c);
        this.nombre = nombre;
        this.apPaterno = apPaterno;
        this.apMaterno = apMaterno;
        this.sexo = sexo;
        this.telefono = telefono;
        this.fechaNacimiento = fechaNacimiento;
        this.curp = curp;
        this.cedulaProf = cedulaProf;
        this.direccionNumInterior = direccionNumInterior;
        this.direccionNumExterior = direccionNumExterior;
        this.direccionLocalidad = direccionLocalidad;
        this.direccionMunicipio = direccionMunicipio;
        this.direccionEstado = direccionEstado;
        this.estadoCivil = estadoCivil;
    }
    //</editor-fold>
    
    //<editor-fold defaultstate="collapsed" desc="Getters y Setters">
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApPaterno() {
        return apPaterno;
    }

    public void setApPaterno(String apPaterno) {
        this.apPaterno = apPaterno;
    }

    public String getApMaterno() {
        return apMaterno;
    }

    public void setApMaterno(String apMaterno) {
        this.apMaterno = apMaterno;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public long getTelefono() {
        return telefono;
    }

    public void setTelefono(long telefono) {
        this.telefono = telefono;
    }

    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getCurp() {
        return curp;
    }

    public void setCurp(String curp) {
        this.curp = curp;
    }

    public String getCedulaProf() {
        return cedulaProf;
    }

    public void setCedulaProf(String cedulaProf) {
        this.cedulaProf = cedulaProf;
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

    public int getEstadoCivil() {
        return estadoCivil;
    }

    public void setEstadoCivil(int estadoCivil) {
        this.estadoCivil = estadoCivil;
    }
    //</editor-fold>
    
}
