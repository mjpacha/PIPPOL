<%-- 
    Document   : index
    Created on : 22-feb-2021, 11:25:53
    Author     : Mauriciov1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link href="css/estilo.css?0.00" rel="stylesheet" type="text/css" />

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar Sesión</title>
    </head>

    <body>
        <div id="contenedor1">
            <form id="form1" action="Controla" method="POST">
                <%--COLOCAR IMAGEN LOGO --%>
                <div class="logo">
                    <img src="imagen/pag.1.logo.png" width="" alt="índice" />
                </div>
                <%--CAJAS DE TEXTO PARA USUARIO Y CONTRASEÑA--%>
                <h1>Usuario:</h1>
                <div class="white-grad">
                    <input type="text" name="respuesta1" placeholder="Alias o mail desde git" required/>
                </div>
                <h1>Contraseña:</h1>
                <div class="white-grad">
                    <input type="password" name="contrasena" placeholder="Contraseña" required/>
                </div>
                <%--COLOCAR BOTON--%>
                <div class="div-button">
                    <input type='submit' name="accion" value='Iniciar' />
                </div>
                <div class="div-button">
                    <input type='button' onclick="location.href='Registrar'" name="accion" value='Registrar' />
                </div>
                <%
                    if (request.getAttribute("fail") != null) {
                        out.print("<script>alert('Usuario o contraseña incorrectos')</script>");
                    } 
                %>
            </form>

        </div>
    </body>

</html>
