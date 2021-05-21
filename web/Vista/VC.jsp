<%-- 
    Document   : VC
    Created on : 19/05/2021, 10:31:55
    Author     : Santy
--%>

<%@page import="java.util.Base64"%>
<%@page import="modeloDAO.usuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link href="../css/estilo.css?0.00" rel="stylesheet" type="text/css" />

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar Sesión</title>
    </head>

    <body>
        <div id="contenedor1">
            <div>
                <%
                    usuarioDAO usuario = new usuarioDAO();
                    String correo = request.getParameter("e");
                    String informacion ="";
                    String respuesta = "error";
                            respuesta = new String(Base64.getDecoder().decode(correo.getBytes("UTF8")),"UTF-8");
//                    System.err.println("Correo "+ respuesta);
                    boolean res; 
                    res = usuario.Correov(respuesta);
                    if (res == true ) {
                        informacion = "Su cuenta esta activada";
                    } else {
                        informacion = "Su cuenta no se activo";
                    }
                %>
                <h4> <%=informacion%> </h4>
            </div>
            <form id="form1" action="../Controla" method="POST">
                <%--COLOCAR IMAGEN LOGO --%>
                <div class="logo">
                    <img src="../imagen/pag.1.logo.png" width="" alt="índice" />
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