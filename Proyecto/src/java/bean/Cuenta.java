package bean;

import extra.ConexionBD;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Cuenta {
    
    private int id;
    private String correo;
    private String contrasena;
    private String salt;
    private String rol;

    //<editor-fold defaultstate="collapsed" desc="Constructores">
    public Cuenta(String correo, String contrasena, String salt, String rol) {
        this.correo = correo;
        this.contrasena = contrasena;
        this.salt = salt;
        this.rol = rol;
    }

    public Cuenta(int id, String correo, String contrasena, String salt, String rol) {
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

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }
    //</editor-fold>
    
    //<editor-fold defaultstate="collapsed" desc="Métodos">
    public int registro() {
        ConexionBD objCBD = new ConexionBD("bolsadetrabajo");
        ArrayList instBD = new ArrayList();
        instBD.add("INSERT INTO cuenta VALUES(null, ?, ?, ?, ?)");
        instBD.add(rol);
        instBD.add(correo);
        instBD.add(contrasena);
        instBD.add(salt);
        int ibd = objCBD.ejecutarABC(instBD);
        if (ibd > 0) {
            return objCBD.ultimoId();
        }
        return 0;
    }
    //</editor-fold>
}
