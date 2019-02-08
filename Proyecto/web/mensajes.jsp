<%@page import="java.sql.ResultSet"%>
<%@page import="bean.Reclutador"%>
<%@page import="bean.Empleador"%>
<%@page import="java.util.ArrayList"%>
<%@page import="extra.ConexionBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Sesion sesion = (Sesion) session.getAttribute("sesion"); %>
<jsp:include page="template.header.jsp">
    <jsp:param name="titulo" value="Mensajes" />
</jsp:include>
<%
if (sesion != null && sesion.isIniciada()) {
    ConexionBD objCBD = new ConexionBD("bolsadetrabajo");
    if (request.getParameter("enviar") != null) {
    if (request.getParameter("texto").trim().length() > 0) {
        ArrayList instBD = new ArrayList();
        instBD.add("INSERT INTO mensajes VALUES (null, ?, ?, ?, null, NOW(), 0)");
        System.out.println("sql");
        int remi = 0;
        System.out.println("tipo " + sesion.getTipo());
        if(sesion.getTipo() == 1) {
            System.out.println("emp");
            Empleador cuenta = (Empleador) sesion.getCuenta();
            System.out.println("ok");
            remi = cuenta.getId();
        } else {
            System.out.println("rec");
            Reclutador cuenta = (Reclutador) sesion.getCuenta();
            System.out.println("ok");
            remi = cuenta.getId();
        }
        System.out.println("id" + remi);
        instBD.add(remi);
        instBD.add(request.getParameter("c"));
        instBD.add(request.getParameter("texto").trim());
        System.out.println("param");
        objCBD.ejecutarABC(instBD);
        System.out.println("query");
    } else {
        out.println("<script>alertify.error('Debes escribir un mensaje')</script>");
    }
} %>
<section class="two small">
    <div class="small">
        <div class="container">
            <input type="text" maxlength="150" id="busquedaTermino" placeholder="Buscar o iniciar conversación">
            <input type="hidden" id="busquedaTipo" value="<% out.print(sesion.getTipo()); %>">
            <input type="hidden" id="busquedaRemitente" value="<% out.print(sesion.getId()); %>">
            <h4>Contactos</h4>
            <div class="people" id="contacts">
                
            </div>
        </div>
    </div>
    <div class="big">
        <div class="container" id="messages">
            <% if (request.getParameter("c") != null) { %>
            <h3>aquí el nombre</h3>
            <script></script>
            <div id="conversation">
                <%
                ArrayList sqlQuery = new ArrayList();
                sqlQuery.add("SELECT * FROM mensajes WHERE (mens_remitente=? AND mens_destinatario=?) OR (mens_remitente=? AND mens_destinatario=?)");
                sqlQuery.add(request.getParameter("c"));
                sqlQuery.add(sesion.getId());
                sqlQuery.add(sesion.getId());
                sqlQuery.add(request.getParameter("c"));
                objCBD.consultar(sqlQuery);
                ResultSet rs = objCBD.getCdr();
                while (rs.next()) { %>
                <div id="msg-<% out.print(rs.getInt("id_mensaje")); %>" class="message <%=(rs.getInt("mens_remitente")==sesion.getId())?"sended":"received"%>" title="<%= rs.getString("mens_fecha_hora") %>">
                    <div class="text"><%=rs.getString("mens_texto") %></div>
                </div>
                <% } %>
            </div>
            <form action="" method="post" autocomplete="off">
                <div id="newmessage">
                    <div id="text">
                        <input type="text" name="texto" placeholder="Escribir un mensaje">
                    </div>
                    <!-- <div id="file">
                        <button type="button"><i class="far fa-clipboard fa-fw"></i> Adjuntar PDF</button>
                    </div> -->
                    <div id="send">
                        <button name="enviar" type="submit">
                            <i class="fas fa-envelope fa-fw"></i> Enviar
                        </button>
                    </div>
                </div>
            </form>
            <% } else { %>
            <h3>Selecciona una conversación</h3>
            <% } %>
        </div>
    </div>
</section>
<% } else {
    response.sendRedirect("/sesion.jsp");
} %>
<%@include file="template.footer.jsp" %>
