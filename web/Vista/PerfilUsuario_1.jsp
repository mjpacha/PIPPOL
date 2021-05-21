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

        <!-- EMOJIS -->  
        <script src=" https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/emojionearea/3.4.2/emojionearea.min.css" integrity="sha512-vEia6TQGr3FqC6h55/NdU3QSM5XR6HSl5fW71QTKrgeER98LIMGwymBVM867C1XHIkYD9nMTfWK2A0xcodKHNA==" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/emojionearea/3.4.2/emojionearea.js" integrity="sha512-aGWPnmdBhJ0leVHhQaRASgb0InV/Z2BWsscdj1Vwt29Oic91wECPixuXsWESpFfCcYPLfOlBZzN2nqQdMxlGTQ==" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/emojionearea/3.4.2/emojionearea.js" integrity="sha512-aGWPnmdBhJ0leVHhQaRASgb0InV/Z2BWsscdj1Vwt29Oic91wECPixuXsWESpFfCcYPLfOlBZzN2nqQdMxlGTQ==" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/emojionearea/3.4.2/emojionearea.css" integrity="sha512-0Nyh7Nf4sn+T48aTb6VFkhJe0FzzcOlqqZMahy/rhZ8Ii5Q9ZXG/1CbunUuEbfgxqsQfWXjnErKZosDSHVKQhQ==" crossorigin="anonymous" />

        <!-- MENSAJES  -->  
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <link href="./css/MensajeriaUsuario/style.css" rel="stylesheet" type="text/css"/>
       
        <title>Perfil Usuario</title>
    </head>
    <body>
        <div class="modal" tabindex="-1" role="dialog" id="ventanapublica">

            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">PUBLICAR</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" >
                        <form method="POST" action="Controla" enctype="multipart/form-data">


                            <input type="text"  name="descripcion" class="descripcion" placeholder="Descripción:" required="">
                            <script>
                                ($('.descripcion')).emojioneArea({
                                    pickerPosition: "bottom"

                                });
                            </script>
                            <input type="file"  name="Fotopublica" required=""/>
                            <input type="submit" id="btnpublicar" name="accion" value="PUBLICAR"/>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <input type="submit" data-dismiss="modal" value="CERRAR"/>
                    </div>
                    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
                    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
                    <!--corregir error de .ajax-->
                    <script
                        src="https://code.jquery.com/jquery-3.4.1.min.js"
                        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
                    crossorigin="anonymous"></script>





                </div>
            </div>
        </div>
        <%--CABECERA DE PÁGINA WEB--%>
        <div id="contenedor5">
            <img  src="./imagen/${usuario.getNomFoto()}" class="fotogrande" width="20%" height="20%" alt="fotoPerfil"/>
            <div class="boton">
                <input type="image" data-target="#ventanapublica" data-toggle="modal" class="agregarpublicacion" id="agregarpublicacion" src="./imagen/boton agragar archivo a perfil.png" width="30%" height="30%"/> 
            </div>
        </div>
        <div id='contenedor4' >
            <%--COLUMNA DE MENÚ--%>
            <div  class="colum1"style='height:90%; width: 10%;  float: left;'>
                <nav class="nav flex-column">
                    <%--MENÚ PERFIL DE USUARIO--%>
                    <li>
                        <img name="logo2" class="logo2" src="./imagen/${usuario.getNomFoto()}" alt="logo2" style="min-width: 20px; min-height: 20px;" width='80%' height='80%'> 
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
                            <img src="./imagen/boton notificaciones.png" alt="notificaciones" width='20%' height='45%'>
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

        <%--CONTENEDOR DE PUBLICACIONES PROPIAS--%>
        <div  class="colum2" style='height:30%; width: 65%; float: left;'>
            <table border="0" id="tablePublicacionesPropias">
                <div class="box-center"> </div>
                <tbody> 
                    <c:set var = "contador" value = "${1}" scope="page"/>
                    <c:forEach var="dato" items="${listaPP}" varStatus="numero">
                        <%--COLUMNA 1--%>
                        <c:if test="${numero.count%4 == 1}">
                            <tr>
                                <td width="25%">
                                    <img class="publicacionesPropias" src="./imagenUsuario/${dato.getImagen()}" width="95%" height="150"/><br>
                                    <img src="./imagen/Corazones.PNG" width="30" height="30" /> ${dato.getTotalLikes()} <img src="./imagen/regalos.PNG" width="30" height="30"/> ${dato.getTotalRegalos()}
                                </td>                                                                 
                            </c:if>
                            <%--COLUMNA 2--%>
                            <c:if test="${numero.count%4 == 2}">
                                <td width="25%">
                                    <img class="publicacionesPropias" src="./imagenUsuario/${dato.getImagen()}" width="95%" height="150"/><br>
                                    <img src="./imagen/Corazones.PNG" width="30" height="30" /> ${dato.getTotalLikes()} <img src="./imagen/regalos.PNG" width="30" height="30"/> ${dato.getTotalRegalos()}
                                </td>                          
                            </c:if>            
                            <%--COLUMNA 3--%>
                            <c:if test="${numero.count%4 == 3}">
                                <td width="25%">
                                    <img class="publicacionesPropias" src="./imagenUsuario/${dato.getImagen()}" width="95%" height="150"/><br>
                                    <img src="./imagen/Corazones.PNG" width="30" height="30" /> ${dato.getTotalLikes()} <img src="./imagen/regalos.PNG" width="30" height="30"/> ${dato.getTotalRegalos()}
                                </td>                            
                            </c:if>            
                            <%--COLUMNA 4--%>
                            <c:if test="${numero.count%4 == 0}">
                                <td width="25%">
                                    <img class="publicacionesPropias" src="./imagenUsuario/${dato.getImagen()}" width="95%" height="150"/><br>
                                    <img src="./imagen/Corazones.PNG" width="30" height="30" /> ${dato.getTotalLikes()} <img src="./imagen/regalos.PNG" width="30" height="30"/> ${dato.getTotalRegalos()}
                                </td> 
                            </tr>
                        </c:if>            
                    </c:forEach>                                                                                                        
                </tbody>
            </table>
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
                        <%--CONDICIONAL PARA DIVIDIR A LOS SEGUIDOS EN DOS COLUMNAS--%>
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
                    <div id="chatbox" style='width: 95%;' >
                        <div class="panel-body chat-widget">
                            <ul class="chat chat-messages">

                            </ul>
                        </div>

                    </div>
                    <%--CAMPOS PARA ENVIAR MENSAJE--%>
                    <a href="#"><img style='min-width: 12.5px; min-height: 12.5px;' name="live" src="./imagen/boton live.png" alt="corazon" width='10%' height='20%'></a>
                    <!-- Aquí puedes escribir tu comentario 
                    
                    <input type="text" class="textochat" name="descripcion" required="" placeholder="Escribe22 un mensaje" >
                    -->
                    <input type="text" class="chat-name" name="descripcion" required="" placeholder="Nombre de Usuario" >
                    <input type="text" class="chat-entry" name="descripcion" required="" placeholder="Escribe un mensaje" >

                    <a href="#"><img name="micro" src="./imagen/micro.PNG" style='min-width: 12.5px; min-height: 12.5px;' alt="micro" width='8%' height='16%'></a>
                    <a href="#"><img name="logo3" src="./imagen/enviar.png" style='min-width: 12.5px; min-height: 12.5px;' alt="logo3" width='8%' height='16%'></a>                  

                </table>
            </form>                
        </div>   
        <!-- CHAT FUNCIONALIDAD -->
        <script src="https://js.pusher.com/7.0/pusher.min.js"></script>
        <script src="./js/MensajeriaUsuario/chat.js" type="text/javascript"></script>
        
        <script>
            Pusher.logToConsole = true;
            var pusher = new Pusher('814af04f4e0ebcbfa6e4', {
            cluster: 'us2'
            });
            var chat = new ChatWidget(pusher);
        </script>
    </body>
</html>