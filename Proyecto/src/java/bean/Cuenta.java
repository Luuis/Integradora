package bean;

public class Cuenta {
    
    private int id;
    private String correo;
    private String contrasena;
    private String salt;
    private int rol;

    //<editor-fold defaultstate="collapsed" desc="Constructores">
    public Cuenta(String correo, String contrasena, String salt, int rol) {
        this.correo = correo;
        this.contrasena = contrasena;
        this.salt = salt;
        this.rol = rol;
    }

    public Cuenta(int id, String correo, String contrasena, String salt, int rol) {
        this.id = id;
        this.correo = correo;
        this.contrasena = contrasena;
        this.salt = salt;
        this.rol = rol;
    }
    
    public Cuenta(Cuenta c) {
        this.id = c.getId();
        this.correo = c.getCorreo();
        this.contrasena = c.getContrasena();
        this.salt = c.getSalt();
        this.rol = c.getRol();
    }
    //</editor-fold>
    
    //<editor-fold defaultstate="collapsed" desc="Getters y Setters">
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public int getRol() {
        return rol;
    }

    public void setRol(int rol) {
        this.rol = rol;
    }
    //</editor-fold>
    
}
