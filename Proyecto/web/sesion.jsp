<%@page import="bean.Capacitador"%>
<%@page import="bean.Reclutador"%>
<%@page import="bean.Reclutador"%>
<%@page import="java.sql.Date"%>
<%@page import="bean.Empleador"%>
<%@page import="extra.PasswordUtils"%>
<%@page import="bean.Cuenta"%>
<%@page import="bean.Sesion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Sesion sesion = (Sesion) session.getAttribute("sesion"); %>
<jsp:include page="template.header.jsp">
    <jsp:param name="titulo" value="Sesión" />
</jsp:include>
    <section class="one small">
    <% if (request.getParameter("f") != null && request.getParameter("f").equalsIgnoreCase("registro")) {
        if (sesion != null && sesion.isIniciada()) {
            response.sendRedirect("/");
        } else {
            boolean rc = false;
            if (request.getParameter("boton") != null) {
                String salt = PasswordUtils.getSalt(30);
                String contra =  PasswordUtils.generateSecurePassword(request.getParameter("pword1"), salt);
                String rol = request.getParameter("tipo");
                
                Cuenta cuenta = new Cuenta(request.getParameter("email"), contra, salt, rol);
                int id = cuenta.registro();
                
                if (rol.equalsIgnoreCase("Empleador")) {
                    Empleador emp = new Empleador(cuenta, request.getParameter("emp_nombre"), request.getParameter("emp_app"), request.getParameter("emp_apm"), request.getParameter("emp_sexo"), Long.parseLong(request.getParameter("emp_telefono")), Date.valueOf(request.getParameter("emp_date")), request.getParameter("emp_curp"), request.getParameter("emp_profesion"), request.getParameter("emp_numint"), request.getParameter("emp_numext"), request.getParameter("emp_localidad"), request.getParameter("emp_municipio"), request.getParameter("emp_estado"), request.getParameter("emp_ecivil"));
                    rc = emp.registrar(id);
                } else if (rol.equalsIgnoreCase("Reclutador")) {
                    Reclutador rec = new Reclutador(cuenta, request.getParameter("rec_nombre"), Integer.parseInt(request.getParameter("rec_categoria")), Long.parseLong(request.getParameter("rec_telefono")), request.getParameter("rec_numint"), request.getParameter("rec_numext"), request.getParameter("rec_localidad"), request.getParameter("rec_municipio"), request.getParameter("rec_estado"));
                    rc = rec.registrar(id);
                } else if (rol.equalsIgnoreCase("Capacitador")) {
                    Capacitador cap = new Capacitador(cuenta, request.getParameter("cap_nombre"), Long.parseLong(request.getParameter("cap_telefono")), request.getParameter("cap_numint"), request.getParameter("cap_numext"), request.getParameter("cap_localidad"), request.getParameter("cap_municipio"), request.getParameter("cap_estado"), Long.parseLong(request.getParameter("cap_tarjeta")));
                    rc = cap.registrar(id);
                }
                
                if (rc) {
                    response.sendRedirect("/sesion.jsp?m=registro");
                } else {
                    out.println("<script>alertify.error('Comprueba los datos ingresados e intentalo de nuevo');</script>");
                }
            } %>
        <form action="" method="post"  autocomplete="off" data-parsley-errors-messages-disabled>
        <center>
        <div class="container">
            <h2>Registro</h2>
            <p>
                <label>Correo electronico <font color="red">*</font></label>
                <input type="email" required name="email"  placeholder="Correo electrónico"
                   data-parsley-maxlength="255" maxlength="255"
                   data-parsley-maxlength-message="El correo no puede ser mayor a 255 carácteres"
                   data-parsley-required-message="Debes ingresar tu correo"
                   data-parsley-type-message="Debes ingresar un correo válido">
            </p>
            <p>
                <label>Contraseña <font color="red">*</font></label>
                <input type="password" required name="pword1" placeholder="Contraseña"
                   data-parsley-maxlength="50" maxlength="50"
                   data-parsley-maxlength-message="La contraseña no puede ser mayor a 50 carácteres"
                   data-parsley-required-message="Debes ingresar la contraseña">
            </p>
            <p>
                <label>Repetir contraseña <font color="red">*</font></label>
                <input type="password" required name="pword2" placeholder="Repetir contraseña"
                   data-parsley-maxlength="50" maxlength="50"
                   data-parsley-maxlength-message="La contraseña no puede ser mayor a 50 carácteres"
                   data-parsley-required-message="Debes ingresar e nuevo la contraseña">
            </p>
            <p>
                <label>Tipo de cuenta <font color="red">*</font></label>
                <input type="radio" name="tipo" data-num="1" value="Empleador" checked> Empleador
                <input type="radio" name="tipo" data-num="2" value="Reclutador"> Reclutador
                <input type="radio" name="tipo" data-num="3" value="Capacitador"> Capacitador
            </p>
        </div>
        
        <div id="reg-1" class="container registro" style="display: block;"><fieldset>
            <p>
                <label>Nombre(s) <font color="red">*</font></label>
                <input type="text" required name="emp_nombre" placeholder="Nombre(s)"
                   data-parsley-maxlength="50" maxlength="50"
                   data-parsley-maxlength-message="El nombre no puede ser mayor a 50 carácteres"
                   data-parsley-required-message="Debes ingresar el nombre">
            </p>
            <p>
                <label>Apellido paterno <font color="red">*</font></label>
                <input type="text" required name="emp_app" placeholder="Apellido paterno"
                   data-parsley-maxlength="50" maxlength="50"
                   data-parsley-maxlength-message="El apellido paterno no puede ser mayor a 50 carácteres"
                   data-parsley-required-message="Debes ingresar el apellido paterno">
            </p>
            <p>
                <label>Apellido materno <font color="red">*</font></label>
                <input type="text" required name="emp_apm" placeholder="Apellido materno"
                   data-parsley-maxlength="50" maxlength="50"
                   data-parsley-maxlength-message="El apellido materno no puede ser mayor a 50 carácteres"
                   data-parsley-required-message="Debes ingresar el apellido materno">
            </p>
            <p>
                <label>Sexo <font color="red">*</font></label>
                <select name="emp_sexo">
                    <option value="M">Masculino</option>
                    <option value="F">Femenino</option>
                </select>
            </p>
            <p>
                <label>Estado civil <font color="red">*</font></label>
                <select name="emp_ecivil">
                    <option value="Solter@">Solter@</option>
                    <option value="Casad@">Casad@</option>
                    <option value="Viud@">Viud@</option>
                    <option value="Divorciad@">Divorciad@</option>
                    <option value="Unión Libre">Unión Libre</option>
                    <option value="Otro">Otro</option>
                </select>
            </p>
            <p>
                <label>Teléfono <font color="red">*</font></label>
                <input type="tel" required name="emp_telefono" placeholder="Teléfono"
                   data-parsley-minlength="10" minlength="10"
                   data-parsley-maxlength="10" maxlength="10"
                   data-parsley-minlength-message="El telefono debe tener 10 digitos"
                   data-parsley-maxlength-message="El telefono debe tener 10 digitos"
                   data-parsley-required-message="Debes ingresar el teléfono"
                   data-parsley-type-message="Debes ingresar un teléfono válido">
            </p>
            <p>
                <label>CURP <font color="red">*</font></label>
                <input type="tel" required name="emp_curp" placeholder="CURP"
                   data-parsley-minlength="18" minlength="18"
                   data-parsley-maxlength="18" maxlength="18"
                   data-parsley-maxlength-message="El CURP debe tener 18 carácteres"
                   data-parsley-minlength-message="El CURP debe tener 18 carácteres"
                   data-parsley-required-message="Debes ingresar el CURP">
            </p>
            <p>
                <label>Profesión <font color="red">*</font></label>
                <input type="text" required name="emp_profesion" placeholder="Profesión"
                   data-parsley-maxlength="18" maxlength="18"
                   data-parsley-maxlength-message="La profesión no debe tener más de 50 carácteres"
                   data-parsley-required-message="Debes ingresar la profesión">
            </p>
            <p>
                <label>Fecha de nacimiento <font color="red">*</font></label>
                <input type="date" required name="emp_date" placeholder="Fecha de nacimiento"
                   data-parsley-required-message="Debes ingresar la fecha de nacimiento">
            </p>
            <p>
                <label>Número interior</label>
                <input type="text" name="emp_numint" placeholder="Número interior"
                   data-parsley-maxlength="50" maxlength="50"
                   data-parsley-maxlength-message="El número interior no puede ser mayor a 50 carácteres">
            </p>
            <p>
                <label>Número exterior</label>
                <input type="text" name="emp_numext" placeholder="Número exterior"
                   data-parsley-maxlength="50" maxlength="50"
                   data-parsley-maxlength-message="El número exterior no puede ser mayor a 50 carácteres">
            </p>
            <p>
                <label>Localidad <font color="red">*</font></label>
                <input type="text" required name="emp_localidad" placeholder="Localidad"
                   data-parsley-maxlength="50" maxlength="50"
                   data-parsley-maxlength-message="La localidad no puede ser mayor a 50 carácteres"
                   data-parsley-required-message="Debes ingresar la localidad">
            </p>
            <p>
                <label>Municipio <font color="red">*</font></label>
                <input type="text" required name="emp_municipio" placeholder="Municipio"
                   data-parsley-maxlength="50" maxlength="50"
                   data-parsley-maxlength-message="El municipio no puede ser mayor a 50 carácteres"
                   data-parsley-required-message="Debes ingresar el municipio">
            </p>
            <p>
                <label>Estado <font color="red">*</font></label>
                <input type="text" required name="emp_estado" placeholder="Estado"
                   data-parsley-maxlength="50" maxlength="50"
                   data-parsley-maxlength-message="El estado no puede ser mayor a 50 carácteres"
                   data-parsley-required-message="Debes ingresar el estado">
            </p>
        </fieldset></div>
            
        <div id="reg-2" class="container registro"><fieldset disabled> 
            <p>
                <label>Nombre de la empresa <font color="red">*</font></label>
                <input type="text" required name="rec_nombre" placeholder="Nombre de la empresa"
                   data-parsley-maxlength="50" maxlength="50"
                   data-parsley-maxlength-message="El nombre no puede ser mayor a 50 carácteres"
                   data-parsley-required-message="Debes ingresar el nombre de la empresa">
            </p>
            <p>
                <label>Teléfono <font color="red">*</font></label>
                <input type="tel" required name="rec_telefono" placeholder="Teléfono"
                   data-parsley-minlength="10" minlength="10"
                   data-parsley-maxlength="10" maxlength="10"
                   data-parsley-minlength-message="El telefono debe tener 10 digitos"
                   data-parsley-maxlength-message="El telefono debe tener 10 digitos"
                   data-parsley-required-message="Debes ingresar el teléfono"
                   data-parsley-type-message="Debes ingresar un teléfono válido">
            </p>
            <p>
                <label>Categoría <font color="red">*</font></label>
                <select name="rec_categoria">
                    <option value="1">Masculino</option>
                </select>
            </p>
            <p>
                <label>Número interior</label>
                <input type="text" name="rec_numint" placeholder="Número interior"
                   data-parsley-maxlength="50" maxlength="50"
                   data-parsley-maxlength-message="El número interior no puede ser mayor a 50 carácteres">
            </p>
            <p>
                <label>Número exterior</label>
                <input type="text" name="rec_numext" placeholder="Número exterior"
                   data-parsley-maxlength="50" maxlength="50"
                   data-parsley-maxlength-message="El número exterior no puede ser mayor a 50 carácteres">
            </p>
            <p>
                <label>Localidad <font color="red">*</font></label>
                <input type="text" required name="rec_localidad" placeholder="Localidad"
                   data-parsley-maxlength="50" maxlength="50"
                   data-parsley-maxlength-message="La localidad no puede ser mayor a 50 carácteres"
                   data-parsley-required-message="Debes ingresar la localidad">
            </p>
            <p>
                <label>Municipio <font color="red">*</font></label>
                <input type="text" required name="rec_municipio" placeholder="Municipio"
                   data-parsley-maxlength="50" maxlength="50"
                   data-parsley-maxlength-message="El municipio no puede ser mayor a 50 carácteres"
                   data-parsley-required-message="Debes ingresar el municipio">
            </p>
            <p>
                <label>Estado <font color="red">*</font></label>
                <input type="text" required name="rec_estado" placeholder="Estado"
                   data-parsley-maxlength="50" maxlength="50"
                   data-parsley-maxlength-message="El estado no puede ser mayor a 50 carácteres"
                   data-parsley-required-message="Debes ingresar el estado">
            </p>
        </fieldset></div>
        
        <div id="reg-3" class="container registro"><fieldset disabled>
                <p>
                    <label>Nombre del capacitador<font color="red">*</font></label>
                    <input type="text" required name="cap_nombre" placeholder="Nombre del capacitador"
                       data-parsley-maxlength="50" maxlength="50"
                       data-parsley-maxlength-message="El nombre no puede ser mayor a 50 carácteres"
                       data-parsley-required-message="Debes ingresar el nombre del capacitador">
                </p>
                <p>
                    <label>Teléfono <font color="red">*</font></label>
                    <input type="tel" required name="cap_telefono" placeholder="Teléfono"
                       data-parsley-minlength="10" minlength="10"
                       data-parsley-maxlength="10" maxlength="10"
                       data-parsley-minlength-message="El telefono debe tener 10 digitos"
                       data-parsley-maxlength-message="El telefono debe tener 10 digitos"
                       data-parsley-required-message="Debes ingresar el teléfono"
                       data-parsley-type-message="Debes ingresar un teléfono válido">
                </p>
                <p>
                    <label>Número interior</label>
                    <input type="text" name="cap_numint" placeholder="Número interior"
                       data-parsley-maxlength="50" maxlength="50"
                       data-parsley-maxlength-message="El número interior no puede ser mayor a 50 carácteres">
                </p>
                <p>
                    <label>Número exterior</label>
                    <input type="text" name="cap_numext" placeholder="Número exterior"
                       data-parsley-maxlength="50" maxlength="50"
                       data-parsley-maxlength-message="El número exterior no puede ser mayor a 50 carácteres">
                </p>
                <p>
                    <label>Localidad <font color="red">*</font></label>
                    <input type="text" required name="cap_localidad" placeholder="Localidad"
                       data-parsley-maxlength="50" maxlength="50"
                       data-parsley-maxlength-message="La localidad no puede ser mayor a 50 carácteres"
                       data-parsley-required-message="Debes ingresar la localidad">
                </p>
                <p>
                    <label>Municipio <font color="red">*</font></label>
                    <input type="text" required name="cap_municipio" placeholder="Municipio"
                       data-parsley-maxlength="50" maxlength="50"
                       data-parsley-maxlength-message="El municipio no puede ser mayor a 50 carácteres"
                       data-parsley-required-message="Debes ingresar el municipio">
                </p>
                <p>
                    <label>Estado <font color="red">*</font></label>
                    <input type="text" required name="cap_estado" placeholder="Estado"
                       data-parsley-maxlength="50" maxlength="50"
                       data-parsley-maxlength-message="El estado no puede ser mayor a 50 carácteres"
                       data-parsley-required-message="Debes ingresar el estado">
                </p>
                <p>
                    <label>Número de tarjeta</label>
                    <input type="text" name="cap_tarjeta" placeholder="Número de tarjeta"
                       data-parsley-minlength="16" minlength="16"
                       data-parsley-maxlength="16" maxlength="16"
                       data-parsley-minlength-message="El número de tarjeta debe tener 16 digitos"
                       data-parsley-maxlength-message="El número de tarjeta debe tener 16 digitos"
                       data-parsley-type-message="Debes ingresar un número de tarjeta válido">
                </p>
            </fieldset></div>
        
        <div class="container">
            <button type="submit" name="boton" value="registro">Registrarme</button>
            <p>Los campos marcados con <font color="red">*</font> son obligatorios</p>
            <p>¿Ya tienes una cuenta? <a href="sesion.jsp">Inicia sesión</a></p>
            <p>¿Tienes dudas? <a href="contacto.jsp">Contáctanos</a></p>
        </div>
        </center>
        </form>
        <% }
    } else if (request.getParameter("f") != null && request.getParameter("f").equalsIgnoreCase("recuperar")) { %>
        <div class="container">
            <h2>Recuperar contraseña</h2>
        </div>
    <% } else if (request.getParameter("f") != null && request.getParameter("f").equalsIgnoreCase("salir")) {
        session.removeAttribute("sesion");
        response.sendRedirect("/");
    } else {
        if (sesion != null && sesion.isIniciada()) {
            response.sendRedirect("/");
        } else {
            if (request.getParameter("m") != null) {
                if (request.getParameter("m").equalsIgnoreCase("Registro")) {
                    out.println("<script>alertify.success('Te haz registrado correctamente')</script>");
                }
            } %>
        <div class="container">
            <h2>Iniciar sesión</h2>
            <% if (request.getParameter("boton") != null) {
                boolean is = sesion.iniciarSesion(request.getParameter("correo"), request.getParameter("contrasena"));
                if (is) {
                    response.sendRedirect("busqueda.jsp");
                    session.setAttribute("sesion", sesion);
                } else {
                    out.println("<script>alertify.error('Comprueba los datos ingresados e intentalo de nuevo');</script>");
                }
            } %>
            <form action="sesion.jsp" method="post" class="validate" autocomplete="off" data-parsley-errors-messages-disabled>
                <center>
                    <input type="email" required name="correo" placeholder="Correo electrónico"
                           data-parsley-maxlength="255" maxlength="255"
                           data-parsley-maxlength-message="El correo no puede ser mayor a 255 carácteres"
                           data-parsley-required-message="Debes ingresar tu correo"
                           data-parsley-type-message="Debes ingresar un correo válido">
                    <input type="password" required name="contrasena" placeholder="Contraseña"
                           data-parsley-maxlength="50" maxlength="50"
                           data-parsley-maxlength-message="La contraseña no puede ser mayor a 50 carácteres"
                           data-parsley-required-message="Debes ingresar la contraseña">
                    <button type="submit" name="boton" value="entrar">Iniciar sesión</button>
                </center>
            </form>
        </div>
            
        <div class="container">
            <center>
                <p>¿No tienes una cuenta? <a href="sesion.jsp?f=registro">Regístrate</a></p>
                <p>¿Olvidaste tu contraseña? <a href="sesion.jsp?f=recuperar">Recuperar</a></p>
            </center>
        </div>
        <% }
    } %>
    </section>
<%@include file="template.footer.jsp" %>
