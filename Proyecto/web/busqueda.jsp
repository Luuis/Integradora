<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Sesion sesion = (Sesion) session.getAttribute("sesion"); %>
<jsp:include page="template.header.jsp">
    <jsp:param name="titulo" value="Búsqueda" />
</jsp:include>
<section class="two small">
    <div class="big">
        <div class="container">
            <h2>Vacantes</h2>
            <article>
                <h3>Hola mundo</h3>
                <p></p>
            </article>
        </div>
    </div>
    <div class="small">
        <div class="container">
            <h3><i class="fas fa-filter fa-fw"></i> Filtros</h3>
            <form action="" method="get" autocomplete="off">
                <p>
                    <label for="bsqTitulo">Título</label>
                    <input id="bsqTitulo" type="text" name="titulo" value="${param.titulo}">
                </p>
                <p>
                    <label for="bsqZona">Zona</label>
                    <input id="bsqZona" type="text" name="zona" value="${param.zona}">
                </p>
                <hr>
                <p>
                    <label for="bsqCategoria">Categoría</label>
                    <select id="bsqCategoria" name="categoria">
                        <option value="0">Cualquiera</option>
                    </select>
                </p>
                <p>
                    <label for="bsqPaga">Paga</label>
                    
                </p>
            </form>
        </div>
    </div>
</section>
<%@include file="template.footer.jsp" %>
