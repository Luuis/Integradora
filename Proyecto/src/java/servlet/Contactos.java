package servlet;

import extra.ConexionBD;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.JSONObject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Contactos", urlPatterns = {"/ServletContactos"})
public class Contactos extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            JSONObject json = new JSONObject();
            LinkedList contactos = new LinkedList();
            LinkedList busqueda = new LinkedList();
            ConexionBD objCBD = new ConexionBD("bolsadetrabajo");
            ArrayList sqlQuery = new ArrayList();
            
            if(Integer.parseInt(request.getParameter("tipo")) == 1) {
                if (request.getParameter("busqueda").trim().length() > 0) {
                    sqlQuery.add("SELECT recl_cuenta, recl_nombre_empresa, min(mens_leido) FROM mensajes INNER JOIN reclutador ON recl_cuenta=mens_destinatario WHERE mens_remitente=? AND recl_nombre_empresa LIKE ? GROUP BY mens_destinatario;");
                    sqlQuery.add(request.getParameter("remitente"));
                    sqlQuery.add("%" + request.getParameter("busqueda") + "%");
                } else {
                    sqlQuery.add("SELECT recl_cuenta, recl_nombre_empresa, min(mens_leido) FROM mensajes INNER JOIN reclutador ON recl_cuenta=mens_destinatario WHERE mens_remitente=? GROUP BY mens_destinatario;");
                    sqlQuery.add(request.getParameter("remitente"));
                }
                
                objCBD.consultar(sqlQuery);
                ResultSet rs = objCBD.getCdr();
                try {
                    while (rs.next()) {
                        LinkedHashMap contacto = new LinkedHashMap();
                        contacto.put("id", rs.getInt("recl_cuenta"));
                        contacto.put("nombre", rs.getString("recl_nombre_empresa"));
                        contacto.put("leido", rs.getBoolean(3));
                        contactos.add(contacto);
                    }
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            } else {
                if (request.getParameter("busqueda").trim().length() > 0) {
                    sqlQuery.add("SELECT empl_cuenta, empl_nombre, empl_ap_pat, empl_ap_mat, min(mens_leido) FROM mensajes INNER JOIN empleador ON empl_cuenta=mens_destinatario WHERE mens_remitente=? AND concat(empl_nombre, ' ', empl_ap_pat, ' ', empl_ap_mat) LIKE ? GROUP BY mens_destinatario;");
                    sqlQuery.add(request.getParameter("remitente"));
                    sqlQuery.add("%" + request.getParameter("busqueda") + "%");
                } else { 
                    sqlQuery.add("SELECT empl_cuenta, empl_nombre, empl_ap_pat, empl_ap_mat, min(mens_leido) FROM mensajes INNER JOIN empleador ON empl_cuenta=mens_destinatario WHERE mens_remitente=? GROUP BY mens_destinatario;");
                    sqlQuery.add(request.getParameter("remitente"));
                }
                
                objCBD.consultar(sqlQuery);
                ResultSet rs = objCBD.getCdr();
                try {
                    while (rs.next()) {
                        LinkedHashMap contacto = new LinkedHashMap();
                        contacto.put("id", rs.getInt("empl_cuenta"));
                        contacto.put("nombre", rs.getString("empl_nombre") + " " +
                                rs.getString("empl_ap_pat") + " " + rs.getString("empl_ap_mat"));
                        contacto.put("leido", rs.getBoolean(5));
                        contactos.add(contacto);
                    }
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            
            json.put("contactos", contactos);
            
            out.write(json.toString(4));
            out.flush();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods">
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Obtener los contactos del usuario";
    }// </editor-fold>

}
