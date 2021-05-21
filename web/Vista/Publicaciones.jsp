<%-- 
    Document   : Publicaciones
    Created on : 19-abr-2021, 14:10:03
    Author     : WilliamMiguel
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="modelo.usuario"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : Perfil
    Created on : 20-feb-2021, 10:02:34
    Author     : Mauricio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="./css/estilo.css" rel="stylesheet" type="text/css"/>
        <link href="./estilosmodal.css" rel="stylesheet" type="text/css"/>
        <link href="../css/estilosmodal.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/ajaxLikesRegalos.js"></script>        
        <title>Perfil Usuario</title>
        <%
            //Extraer la sesión
            HttpSession sesion = request.getSession();
            String usuario1;
            String nivel;
            if (sesion.getAttribute("user") != null) {
                usuario1 = sesion.getAttribute("user").toString();
            } else {
            }
        %>        
    </head>
    <body>        
        <%--COLUMNA DE CABECERA--%>
        <div id="contenedor5">
            <div class="boton">
                <input type="image" data-target="#ventanapublica" data-toggle="modal" class="agregarpublicacion" id="agregarpublicacion" src="./imagen/boton agragar archivo a perfil.png" width="30%" height="30%"/> 
            </div>
        </div>
        <%--COLUMNA DE MENÚ--%>
        <div id='contenedor4' >
            <div  class="colum1"style='height:90%; width: 10%;  float: left;'>
                <nav class="nav flex-column">
                    <%--MENÚ PERFIL DE USUARIO--%>
                    <li>
                        <c:forEach var="usuario" items="${listadousuario}" varStatus="numero" >
                            <a class="nav-link" href="ControlaUsuario"><img style="min-width: 20px; min-height: 20px;" name="logo2" class="logo2" src="./imagen/${usuario.getNomFoto()}" alt="logo2" width='80%' height='80%'> </a>
                            </c:forEach>
                    <li>
                        <%--MENÚ BUSCAR AMIGOS--%>
                        <a class="nav-link" href="#"><img style="min-width: 20px; min-height: 20px;" name="corazon" src="./imagen/boton favoritos.png" alt="corazon" width='25%' height='50%'></a>
                            <%--MENÚ BUSCAR AMIGOS--%>
                        <a class="nav-link" href="#"><img style="min-width: 20px; min-height: 20px;" name="live" src="./imagen/boton live.png" alt="corazon" width='25%' height='50%'></a>
                            <%--MENÚ PUBLICACIONES--%>
                        <a class="nav-link" href="ControlaPublicacion"><img style="min-width: 20px; min-height: 20px;" name="logo3" src="./imagen/boton noticias.png" alt="logo3" width='25%' height='50%'></a>
                            <%--NOTIFICACIONES--%>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                            <img  src="./imagen/boton notificaciones.png" alt="notificaciones" width='20%' height='45%'>
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">Boris te dio un like</a>
                            <a class="dropdown-item" href="#">Vale te mando un regalo</a>
                            <a class="dropdown-item" href="#">Boris comenzo a seguirte</a>
                        </div>
                    </li>
                    <%--CONFIGURACIONES--%>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                            <img name="ajustes" src="./imagen/boton configuraciones.png" alt="ajustes" width='20%' height='45%'>
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">Editar Perfil</a>
                            <a class="dropdown-item" href="#">Invitar a Piipol</a>
                            <a class="dropdown-item" href="#">Ajustes de cuenta</a>
                            <a class="dropdown-item" href="#">Ajustes de privacidad</a>
                            <a class="dropdown-item" href="#">Notificaciones</a>
                            <a class="dropdown-item" href="#">Regla de uso</a>
                            <a class="dropdown-item" href="#">Mandanos un Piip</a>
                        </div>
                    </li>
                    <%--ESTADÍSTICAS--%>
                    <a href="#"><img style="min-width: 20px; min-height: 20px;" name="ganancia" src="./imagen/boton estadisticas.png" alt="ganancia" width='20%' height='45%'></a>
                </nav>
            </div>
        </div>

        <%--COLUMNA DE PUBLICACIONES--%>
        <div  class="colum2" action='Controla' method='POST' style='height:70%; width: 65% ; float: left;'>
            <form id="form2">
                <c:forEach var="dato" items="${listap}" varStatus="numero" >
                    <div id="chatbox1" style='height:auto; max-height: 550px; width: 80% ;'>
                        <%--CABECERA, IMAGEN Y NOMBRE DE LA PERSONA QUE PUBLICA--%>
                        <img src="./imagen/${dato.getNomFoto()}" class="fotogrande" width="10%" height="10%"/>${dato.getNombreUsuario()} 
                        <%--IMAGEN PUBLICADA--%>
                        <img src="./imagenUsuario/${dato.getImagen()}" style='height:auto; max-height: 400px; width: 100%;'/>

                        <table align='left' width="100%" height="15%" id="tablepublicacionreacciones">
                            <tr>
                                <%--REGALOS Y LIKES RECIBIDOS--%>
                                <td style="text-align: left; height:10%; width: 10%; font-size: 70%;">
                                    ${dato.getTotalRegalos()} Regalos  ${dato.getTotalLikes()} Me gusta                        
                                </td>
                                <td rowspan="2" style="text-align: right;">

                                    <div id="${dato.getIdpub()}" class="like" style="float:right; width:30%">  

                                        <input type="hidden" value="${dato.getIdSeguidor()}" id="iduser">                                        
                                        <img
                                            <%--CONDICIONAL DE BORDEAR LA IMAGEN SI EL USUARIO YA HA DADO LIKE A ESA PUBLICACION--%>
                                            <c:forEach var="datou" items="${listaplu}" varStatus="numero" >
                                                <c:if test="${dato.getIdpub() == datou.getIdpub()}">
                                                    class="d-likes"
                                                </c:if>      
                                            </c:forEach>                                                              
                                            <%--CONDICIONAL SI EL USUARIO NO HA DADO LIKE A ESA PUBLICACION--%>
                                            src="./imagen/Corazones.PNG" style='height:87%; width: 87%; float: left;' id="imagenlikes"/>
                                    </div>

                                    <div id="${dato.getIdpub()}" class="likes" style="float:right; width:30%">
                                        <input type="hidden" value="${dato.getIdSeguidor()}" id="iduser">    
                                        <img 
                                            <%--CONDICIONAL DE BORDEAR LA IMAGEN SI EL USUARIO YA HA DADO REGALOS A ESA PUBLICACION--%>
                                            <c:forEach var="dator" items="${listapru}" varStatus="numero" >
                                                <c:if test="${dato.getIdpub() == dator.getIdpub()}">
                                                    class="d-regalos"
                                                </c:if>      
                                            </c:forEach>
                                            <%--CONDICIONAL SI EL USUARIO NO HA DADO REGALOS A ESA PUBLICACION--%>
                                            id="imagenlikes" src="./imagen/regalos.PNG" style='height:90%; width: 90%; float: left;'/>
                                    </div>
                                </td>
                            </tr>                                                
                            <tr>
                                <%--DESCRIPCION DEL IMAGEN PUBLICADA--%>
                                <td style="text-align: left; height:70%; width: 70%; font-size: 90%;">
                                    ${dato.getDescripcion()}
                                </td>
                            </tr>
                        </table>
                    </div>
                </c:forEach> 
            </form>    
        </div>

        <%--DIVISOR PARA CREAR CAMPO DE SEGUIDOS--%>
        <div  class="colum3" style='height:80%; width: 20%; float: left;'>
            <%--TABLA DONDE SE COLOCA LOS USUARIOS SEGUIDOS--%>
            <table border="0" id="tablefotoseguidos">
                <div class="box-center"> </div>
                <tbody> 
                    <%--INICIALIZADOR DE CONTADOR DE SEGUIDOS--%>
                    <c:set var = "contador" value = "${1}" scope="page"/>
                    <%--LISTA DE SEGUIDOS--%>
                    <c:forEach var="dato" items="${listadofollower}" varStatus="numero">                        
                        <%--COLUMNA 1--%>
                        <c:if test="${numero.count%2 != 0}">
                            <tr>
                                <td width="25%" style="font-size: 70%;">
                                    <img src="./imagen/${dato.getNomFoto()}" /><br>${dato.getNombre()} ${dato.getApellido()}
                                </td>                                                                 
                            </c:if>
                            <%--COLUMNA 2--%>
                            <c:if test="${numero.count%2 == 0}">
                                <td width="25%" style="font-size: 70%;">
                                    <img src="./imagen/${dato.getNomFoto()}" /><br>${dato.getNombre()} ${dato.getApellido()}        
                                </td> 
                            </tr>
                        </c:if>            
                    </c:forEach>
                </tbody>
            </table>

            <%--DISEÑO DEL CHAT--%>
            <%--CABECERA DEL CHAT--%>
            <table id="tablefotochat">                
                <tr>
                    <%--BOTON DE RETROCESO--%>
                    <td rowspan='2' width='90'><a href="#"><img style='vertical-align:middle; min-width: 15px; min-height: 15px;' name="logo3" src="./imagen/boton atrás.png" alt="logo3" width='100%' height='auto'></a></td>
                            <%--IMAGEN DEL USUARIO--%>
                    <td rowspan='2' width='120'><img class="fotochat" name="logo3" src="./imagen/${usuario.getNomFoto()}" alt="logo3" width='70' height='70'><br>${usuario.getNombre()} ${usuario.getApellido()}</td>  
                        <%--BOTON PARA ELIMINAR USUARIO--%>
                    <td width='60'><a href="#"><img style='float: top; vertical-align:middle; min-width: 12.5px; min-height: 12.5px;' name="eliminar" src="./imagen/boton eliminar.png" alt="logo3" width='50%' height='auto'></a></td>
                            <%--BOTON PARA BLOQUEAR USUARIO--%>
                    <td width='60'><a href="#"><img style='float: top; vertical-align:middle; min-width: 12.5px; min-height: 12.5px;' name="bloquear" src="./imagen/boton bloquear.png" alt="logo3" width='50%' height='auto'></a></td>
                </tr>
                <tr>
                    <%--BOTON PARA LLAMAR USUARIO--%>
                    <td width='60' align="top" valign="top"><a href="#"><img style='float: top; vertical-align:middle; min-width: 12.5px; min-height: 12.5px;' name="llamar" src="./imagen/boton llamar.png" alt="logo3" width='50%' height='auto'></a></td>
                            <%--BOTON PARA MANDAR MENSAJE A USUARIO--%>
                    <td width='60' align="top" valign="top"><a href="#"><img style='float: top; vertical-align:middle; min-width: 12.5px; min-height: 12.5px;' name="perfil" src="./imagen/boton perfil mensaje.png" alt="logo3" width='50%' height='auto'></a></td>
                </tr>
            </table>

            <%--FORMULARIO DE CHAT PARA ESCRIBIR MENSAJES--%>
            <form id="form2" name="message" action="">
                <table>                                
                    <%--USUARIO CON EL QUE SE VA A CHATEAR--%>
                    <p style="text-align: right; padding-right: 20px;">Plip</p>
                    <%--CONTENEDOR DONDE SE DEBEN VISUALIZAR LOS MENSAJES DEL CHAT--%>
                    <div id="chatbox" style='width: 95%;' ></div>
                    <%--CAMPOS PARA ENVIAR MENSAJE--%>
                    <a href="#"><img style='min-width: 12.5px; min-height: 12.5px;' name="live" src="./imagen/boton live.png" alt="corazon" width='10%' height='20%'></a>
                    <input type="text" class="textochat" name="descripcion" required="" placeholder="Escribe un mensaje" >
                    <a href="#"><img name="micro" src="./imagen/micro.PNG" style='min-width: 12.5px; min-height: 12.5px;' alt="micro" width='8%' height='16%'></a>
                    <a href="#"><img name="logo3" src="./imagen/enviar.png" style='min-width: 12.5px; min-height: 12.5px;' alt="logo3" width='8%' height='16%'></a>                  
                </table>
            </form>                
        </div>                                                                                                       
    </body>
</html>