<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="template.header.jsp">
    <jsp:param name="titulo" value="Inicio" />
    <jsp:param name="body" value="landing" />
</jsp:include>
    <section>
        <div id="logo"><a href="/"><img src="img/logo-white.png"></a></div>
        <div id="landing-search">
            <div id="label">Busca un trabajo por título o zona</div>
            <div id="field">
                <form action="busqueda.jsp" method="get">
                    <input type="text" placeholder="ej. Programación web" name="titulo">
                    <input type="text" placeholder="ej. Tecámac, Edo. Méx." name="zona">
                    <button type="submit">Buscar</button>
                </form>
            </div>
        </div>
    </section>
<%@include file="template.footer.jsp" %>
