<%-- 
    Document   : error-404
    Created on : 06/05/2021, 10:05:49
    Author     : Santy
--%>

<%@ page language="java" isErrorPage="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link href="css/estilo.css?0.00" rel="stylesheet" type="text/css" />

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar Sesión</title>
    </head>
    <body>
        <button onclick="history.back()"> VOLVER </button>
        <h1>CORREO O NICK YA SE ENCUENTRAN REGISTRADOS. </h1>
        <!--<br />-->
        <!--<p><b>Error code:</b> ${pageContext.errorData.statusCode}</p>-->
        <!--<p><b>Request URI:</b> ${pageContext.request.scheme}://${header.host}${pageContext.errorData.requestURI}</p>-->
        <!--<br />-->

        <div id="contenedor1">
            <form id="form1" action="Controla" method="POST">
                <%--COLOCAR IMAGEN LOGO --%>
                <div class="logo">
                    <img src="imagen/pag.1.logo.png" width="" alt="índice" />
                </div>
                <%--CAJAS DE TEXTO PARA USUARIO Y CONTRASEÑA--%>
                <h1>Usuario:</h1>
                <div class="white-grad">
                    <input type="text" name="respuesta1" placeholder="Alias o mail" required/>
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
                    <input type='button' onclick="location.href = 'Registrar'" name="accion" value='Registrar' />
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