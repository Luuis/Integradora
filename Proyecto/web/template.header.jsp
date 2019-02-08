<%@page import="bean.Sesion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% if(session.getAttribute("sesion") == null) {
    session.setAttribute("sesion", new Sesion());
}
Sesion sh = (Sesion) session.getAttribute("sesion"); %>
<!DOCTYPE html>
<html>
    <head>
        <% if (request.getParameter("titulo") != null) { %>
        <title>BulkJobs &middot; ${param.titulo}</title>
        <% } else { %>
        <title>BulkJobs</title>
        <% } %>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/alertify.min.css">
        <link rel="stylesheet" href="css/all.min.css">
        <link rel="stylesheet" href="css/tippy.css">
        <link rel="stylesheet" href="css/main.css">
        <script src="js/jquery.min.js"></script>
        <script src="js/alertify.min.js"></script>
        <script src="js/tippy.min.js"></script>
        <script src="js/parsley.min.js"></script>
    </head>
    <body class="${param.body}">
        <div id="content">
            <% if (request.getParameter("body") == null ||
                !request.getParameter("body").equalsIgnoreCase("landing")) { %>
            <header>
                <div id="left"><a href=""><img src="img/logo-dark.png" alt="BulkJobs" height="24px"></a></div>
                <div id="right">
                    <ul id="menu">
                        <li><a href="/">Inicio</a></li>
                        <li><a href="busqueda.jsp">Búsqueda</a></li>
                        <% if (sh != null && sh.isIniciada()) { %>
                        <li><a href="sesion.jsp?f=salir">Cerrar sesión</a></li>
                        <% } else { %>
                        <li><a href="sesion.jsp">Iniciar sesión</a></li>
                        <li><a href="sesion.jsp?f=registro">Regístrarse</a></li>
                        <% } %>
                    </ul>
                    <% if (sh != null && sh.isIniciada()) { %>
                    <ul id="menu">
                        <li><a href="mensajes.jsp" title="Perfil"><i class="fas fa-user fa-fw"></i></a></li>
                        <li><a href="mensajes.jsp" title="Mensajes"><i class="fas fa-envelope fa-fw"></i> <% out.print(sh.getTipo()); %></a></li>
                    </ul>
                    <% } %>
                </div>
            </header>
            <% } %>
